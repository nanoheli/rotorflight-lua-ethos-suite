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
local MSP_API_CMD_READ = 94 -- Command identifier 
local MSP_API_CMD_WRITE = 95 -- Command identifier 

-- Define the MSP response data structures
local MSP_API_STRUCTURE_READ_DATA = {
    {field = "pid_mode",                        type = "U8", apiVersion = 12.06, simResponse = {3}},
    {field = "error_decay_time_ground",         type = "U8", apiVersion = 12.06, simResponse = {25}},
    {field = "error_decay_time_cyclic",         type = "U8", apiVersion = 12.06, simResponse = {250}},
    {field = "error_decay_time_yaw",            type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "error_decay_limit_cyclic",        type = "U8", apiVersion = 12.06, simResponse = {12}},
    {field = "error_decay_limit_yaw",           type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "error_rotation",                  type = "U8", apiVersion = 12.06, simResponse = {1}},
    {field = "error_limit_0",                   type = "U8", apiVersion = 12.06, simResponse = {30}},
    {field = "error_limit_1",                   type = "U8", apiVersion = 12.06, simResponse = {30}},
    {field = "error_limit_2",                   type = "U8", apiVersion = 12.06, simResponse = {45}},
    {field = "gyro_cutoff_0",                   type = "U8", apiVersion = 12.06, simResponse = {50}},
    {field = "gyro_cutoff_1",                   type = "U8", apiVersion = 12.06, simResponse = {50}},
    {field = "gyro_cutoff_2",                   type = "U8", apiVersion = 12.06, simResponse = {100}},
    {field = "dterm_cutoff_0",                  type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "dterm_cutoff_1",                  type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "dterm_cutoff_2",                  type = "U8", apiVersion = 12.06, simResponse = {20}},
    {field = "iterm_relax_type",                type = "U8", apiVersion = 12.06, simResponse = {2}},
    {field = "iterm_relax_cutoff_0",            type = "U8", apiVersion = 12.06, simResponse = {10}},
    {field = "iterm_relax_cutoff_1",            type = "U8", apiVersion = 12.06, simResponse = {10}},
    {field = "iterm_relax_cutoff_2",            type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "yaw_cw_stop_gain",                type = "U8", apiVersion = 12.06, simResponse = {100}},
    {field = "yaw_ccw_stop_gain",               type = "U8", apiVersion = 12.06, simResponse = {100}},
    {field = "yaw_precomp_cutoff",              type = "U8", apiVersion = 12.06, simResponse = {6}},
    {field = "yaw_cyclic_ff_gain",              type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "yaw_collective_ff_gain",          type = "U8", apiVersion = 12.06, simResponse = {30}},
    {field = "yaw_collective_dynamic_gain",     type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "yaw_collective_dynamic_decay",    type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "pitch_collective_ff_gain",        type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "angle_level_strength",            type = "U8", apiVersion = 12.06, simResponse = {40}},
    {field = "angle_level_limit",               type = "U8", apiVersion = 12.06, simResponse = {55}},
    {field = "horizon_level_strength",          type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "trainer_gain",                    type = "U8", apiVersion = 12.06, simResponse = {75}},
    {field = "trainer_angle_limit",             type = "U8", apiVersion = 12.06, simResponse = {20}},
    {field = "cyclic_cross_coupling_gain",      type = "U8", apiVersion = 12.06, simResponse = {25}},
    {field = "cyclic_cross_coupling_ratio",     type = "U8", apiVersion = 12.06, simResponse = {0}},
    {field = "cyclic_cross_coupling_cutoff",    type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "offset_limit_0",                  type = "U8", apiVersion = 12.06, simResponse = {45}},
    {field = "offset_limit_1",                  type = "U8", apiVersion = 12.06, simResponse = {45}},
    {field = "bterm_cutoff_0",                  type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "bterm_cutoff_1",                  type = "U8", apiVersion = 12.06, simResponse = {15}},
    {field = "bterm_cutoff_2",                  type = "U8", apiVersion = 12.06, simResponse = {20}},
    {field = "yaw_inertia_precomp_gain",        type = "U8", apiVersion = 12.08, simResponse = {10}},
    {field = "yaw_inertia_precomp_cutoff",      type = "U8", apiVersion = 12.08, simResponse = {20}},
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
        print("No value set for MSP_API_CMD_READ")
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
        print("No value set for MSP_API_CMD_WRITE")
        return
    end

    local message = {
        command = MSP_API_CMD_WRITE,
        payload = suppliedPayload or payloadData,
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
    error("Invalid field name: " .. fieldName)
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
