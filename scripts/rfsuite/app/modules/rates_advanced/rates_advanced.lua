local labels = {}
local fields = {}

local activateWakeup = false
local currentProfileChecked = false

if rfsuite.RateTable == nil then rfsuite.RateTable = rfsuite.config.defaultRateProfile end

fields[#fields + 1] = {
    t = "Rates Type",
    ratetype = 1,
    min = 0,
    max = 5,
    vals = {1},
    table = {[0] = "NONE", "BETAFLIGHT", "RACEFLIGHT", "KISS", "ACTUAL", "QUICK"},
    postEdit = function(self)
        self.flagRateChange(self, true)
    end
}

labels[#labels + 1] = {t = "Roll dynamics", label = "rolldynamics", inline_size = 14.6}
fields[#fields + 1] = {t = "Time", help = "profilesRatesDynamicsTime", inline = 2, label = "rolldynamics", min = 0, max = 250, unit = "ms", apikey="response_time_1"}
fields[#fields + 1] = {t = "Accel", help = "profilesRatesDynamicsAcc", inline = 1, label = "rolldynamics", min = 0, max = 50000, unit = "°/s", mult = 10, step = 10, apikey="accel_limit_1"}

labels[#labels + 1] = {t = "Pitch dynamics", label = "pitchdynamics", inline_size = 14.6}
fields[#fields + 1] = {t = "Time", help = "profilesRatesDynamicsTime", inline = 2, label = "pitchdynamics", min = 0, max = 250, unit = "ms", apikey="response_time_2"}
fields[#fields + 1] = {t = "Accel", help = "profilesRatesDynamicsAcc", inline = 1, label = "pitchdynamics", min = 0, max = 50000, unit = "°/s", mult = 10, step = 10, apikey="accel_limit_2"}

labels[#labels + 1] = {t = "Yaw dynamics", label = "yawdynamics", inline_size = 14.6}
fields[#fields + 1] = {t = "Time", help = "profilesRatesDynamicsTime", inline = 2, label = "yawdynamics", min = 0, max = 250, unit = "ms", apikey="response_time_3"}
fields[#fields + 1] = {t = "Accel", help = "profilesRatesDynamicsAcc", inline = 1, label = "yawdynamics", min = 0, max = 50000, unit = "°/s", mult = 10, step = 10, apikey="accel_limit_3"}

labels[#labels + 1] = {t = "Collective dynamics", label = "coldynamics", inline_size = 14.6}
fields[#fields + 1] = {t = "Time", help = "profilesRatesDynamicsTime", inline = 2, label = "coldynamics", min = 0, max = 250, unit = "ms", apikey="response_time_4"}
fields[#fields + 1] = {t = "Accel", help = "profilesRatesDynamicsAcc", inline = 1, label = "coldynamics", min = 0, max = 50000, unit = "°/^s", mult = 10, step = 10, apikey="accel_limit_4"}

-- rate table defaults
local function defaultRates(x)
    local defaults = {}
    defaults[0] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} -- NONE
    defaults[1] = {1, 180, 0, 0, 0, 0, 0, 180, 0, 0, 0, 0, 0, 180, 0, 0, 0, 0, 0, 203, 0, 1, 0, 0, 0} -- BF
    defaults[2] = {2, 36, 0, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0} -- RACEFL
    defaults[3] = {3, 180, 0, 0, 0, 0, 0, 180, 0, 0, 0, 0, 0, 180, 0, 0, 0, 0, 0, 250, 0, 0, 0, 0, 0} -- KISS
    defaults[4] = {4, 36, 0, 36, 0, 0, 0, 36, 0, 36, 0, 0, 0, 36, 0, 36, 0, 0, 0, 48, 0, 48, 0, 0, 0} -- ACTUAL
    defaults[5] = {5, 180, 0, 36, 0, 0, 0, 180, 0, 36, 0, 0, 0, 180, 0, 36, 0, 0, 0, 250, 0, 104, 0, 0, 0} -- QUICK

    return defaults[x]
end

local function preSavePayload(payload)
    if rfsuite.app.triggers.resetRates == true then
        rfsuite.app.triggers.resetRates = false
        rfsuite.NewRateTable = rfsuite.app.Page.values[1]
        payload = defaultRates(rfsuite.NewRateTable)
    end

    return payload
end

local function postLoad(self)
    rfsuite.app.triggers.isReady = true
    activateWakeup = true
end

local function wakeup()

    if activateWakeup == true and currentProfileChecked == false and rfsuite.bg.msp.mspQueue:isProcessed() then

        -- update active profile
        -- the check happens in postLoad          
        if rfsuite.config.activeRateProfile ~= nil then
            rfsuite.app.formFields['title']:value(rfsuite.app.Page.title .. " #" .. rfsuite.config.activeRateProfile)
            currentProfileChecked = true
        end

    end

end

local function postRead(self)
end

local function flagRateChange(self)
    rfsuite.app.triggers.resetRates = true
end

return {
    mspapi = "RC_TUNING",
    title = "Rates",
    reboot = false,
    eepromWrite = true,
    labels = labels,
    fields = fields,
    refreshOnRateChange = true,
    rows = rows,
    cols = cols,
    rTableName = rTableName,
    flagRateChange = flagRateChange,
    postRead = postRead,
    postLoad = postLoad,
    preSavePayload = preSavePayload,
    wakeup = wakeup,
    API = {},
}
