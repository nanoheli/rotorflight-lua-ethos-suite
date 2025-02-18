--[[
 * Copyright (C) Rotorflight Project
 *
 * License GPLv3: https://www.gnu.org/licenses/gpl-3.0.en.html
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Note. Some icons have been sourced from https://www.flaticon.com/
]] --
-- Constants for MSP Commands
local MSP_API_CMD_READ = 101 -- Command identifier 
local MSP_API_CMD_WRITE = nil -- Command identifier 

-- Define the MSP response data structures
local MSP_API_STRUCTURE_READ_DATA = {
    {field = "task_delta_time_pid",                type = "U16", apiVersion = 12.06, simResponse = {252, 1}},
    {field = "task_delta_time_gyro",               type = "U16", apiVersion = 12.06, simResponse = {127, 0}},
    {field = "sensor_status",                      type = "U16", apiVersion = 12.06, simResponse = {35, 0}},
    {field = "flight_mode_flags",                  type = "U32", apiVersion = 12.06, simResponse = {0, 0, 0, 0}},
    {field = "profile_number",                     type = "U8",  apiVersion = 12.06, simResponse = {0}},
    {field = "max_real_time_load",                 type = "U16", apiVersion = 12.06, simResponse = {122, 1}},
    {field = "average_cpu_load",                   type = "U16", apiVersion = 12.06, simResponse = {182, 0}},
    {field = "extra_flight_mode_flags_count",      type = "U8",  apiVersion = 12.06, simResponse = {0}},
    {field = "arming_disable_flags_count",         type = "U8",  apiVersion = 12.06, simResponse = {0}},
    {field = "arming_disable_flags",               type = "U32", apiVersion = 12.06, simResponse = {0, 0, 0, 0}},
    {field = "reboot_required",                    type = "U8",  apiVersion = 12.06, simResponse = {2}},
    {field = "configuration_state",                type = "U8",  apiVersion = 12.06, simResponse = {0}},
    {field = "current_pid_profile_index",          type = "U8",  apiVersion = 12.06, simResponse = {6}},
    {field = "pid_profile_count",                  type = "U8",  apiVersion = 12.06, simResponse = {6}},
    {field = "current_control_rate_profile_index", type = "U8",  apiVersion = 12.06, simResponse = {1}},
    {field = "control_rate_profile_count",         type = "U8",  apiVersion = 12.06, simResponse = {4}},
    {field = "motor_count",                        type = "U8",  apiVersion = 12.06, simResponse = {1}},
    {field = "servo_count",                        type = "U8",  apiVersion = 12.06, simResponse = {4}},
    {field = "gyro_detection_flags",               type = "U8",  apiVersion = 12.06, simResponse = {1}},
}

-- filter the structure to remove any params not supported by the running api version
local MSP_API_STRUCTURE_READ = rfsuite.bg.msp.api.filterByApiVersion(MSP_API_STRUCTURE_READ_DATA)

-- calculate the min bytes value from the structure
local MSP_MIN_BYTES = rfsuite.bg.msp.api.calculateMinBytes(MSP_API_STRUCTURE_READ)

-- set read structure
local MSP_API_STRUCTURE_WRITE = MSP_API_STRUCTURE_READ

-- generate a simulatorResponse from the read structure
local MSP_API_SIMULATOR_RESPONSE = rfsuite.bg.msp.api.buildSimResponse(MSP_API_STRUCTURE_READ)

-- Variable to store parsed MSP data
local mspData = nil
local mspWriteComplete = false
local payloadData = {}
local defaultData = {}

-- Create a new instance
local handlers = rfsuite.bg.msp.api.createHandlers()

-- Variables to store optional the UUID and timeout for payload
local MSP_API_UUID
local MSP_API_MSG_TIMEOUT

-- Function to initiate MSP read operation
local function read()
    if MSP_API_CMD_READ == nil then
        rfsuite.utils.log("No value set for MSP_API_CMD_READ", "debug")
        return
    end

    local message = {
        command = MSP_API_CMD_READ,
        processReply = function(self, buf)
            mspData = rfsuite.bg.msp.api.parseMSPData(buf, MSP_API_STRUCTURE_READ)
            if #buf >= MSP_MIN_BYTES then
                local completeHandler = handlers.getCompleteHandler()
                if completeHandler then completeHandler(self, buf) end
            end
        end,
        errorHandler = function(self, buf)
            local errorHandler = handlers.getErrorHandler()
            if errorHandler then errorHandler(self, buf) end
        end,
        simulatorResponse = MSP_API_SIMULATOR_RESPONSE,
        uuid = MSP_API_UUID,
        timeout = MSP_API_MSG_TIMEOUT  
    }
    rfsuite.bg.msp.mspQueue:add(message)
end

local function write(suppliedPayload)
    if MSP_API_CMD_WRITE == nil then
        rfsuite.utils.log("No value set for MSP_API_CMD_WRITE", "debug")
        return
    end

    local message = {
        command = MSP_API_CMD_WRITE,
        payload = suppliedPayload or rfsuite.bg.msp.api.buildWritePayload(payloadData,MSP_API_STRUCTURE_WRITE),
        processReply = function(self, buf)
            local completeHandler = handlers.getCompleteHandler()
            if completeHandler then completeHandler(self, buf) end
            mspWriteComplete = true
        end,
        errorHandler = function(self, buf)
            local errorHandler = handlers.getErrorHandler()
            if errorHandler then errorHandler(self, buf) end
        end,
        simulatorResponse = {},
        uuid = MSP_API_UUID,
        timeout = MSP_API_MSG_TIMEOUT  
    }
    rfsuite.bg.msp.mspQueue:add(message)
end

-- Function to get the value of a specific field from MSP data
local function readValue(fieldName)
    if mspData and mspData['parsed'][fieldName] ~= nil then return mspData['parsed'][fieldName] end
    return nil
end

-- Function to set a value dynamically
local function setValue(fieldName, value)
    for _, field in ipairs(MSP_API_STRUCTURE_WRITE) do
        if field.field == fieldName then
            payloadData[fieldName] = value
            return true
        end
    end
end

-- Function to check if the read operation is complete
local function readComplete()
    return mspData ~= nil and #mspData['buffer'] >= MSP_MIN_BYTES
end

-- Function to check if the write operation is complete
local function writeComplete()
    return mspWriteComplete
end

-- Function to reset the write completion status
local function resetWriteStatus()
    mspWriteComplete = false
end

-- Function to return the parsed MSP data
local function data()
    return mspData
end

-- set the UUID for the payload
local function setUUID(uuid)
    MSP_API_UUID = uuid
end

-- set the timeout for the payload
local function setTimeout(timeout)
    MSP_API_MSG_TIMEOUT = timeout
end

-- Return the module's API functions
return {
    read = read,
    write = write,
    readComplete = readComplete,
    writeComplete = writeComplete,
    readValue = readValue,
    setValue = setValue,
    resetWriteStatus = resetWriteStatus,
    setCompleteHandler = handlers.setCompleteHandler,
    setErrorHandler = handlers.setErrorHandler,
    data = data,
    setUUID = setUUID,
    setTimeout = setTimeout
}
