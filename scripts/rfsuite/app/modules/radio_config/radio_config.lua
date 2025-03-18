local mspapi = {
    api = {
        [1] = "RC_CONFIG",
    },
    formdata = {
        labels = {
            { t = rfsuite.i18n.get("app.modules.radio_config.stick"),    label = 1, inline_size = 14.5 },
            { t = rfsuite.i18n.get("app.modules.radio_config.throttle"), label = 2, inline_size = 14.5 },
            { t = "",         label = 3, inline_size = 14.5 },
            { t = rfsuite.i18n.get("app.modules.radio_config.deadband"), label = 4, inline_size = 14.5 }
        },
        fields = {
            { t = rfsuite.i18n.get("app.modules.radio_config.center"),     label = 1, inline = 2, mspapi = 1, apikey = "rc_center"       },
            { t = rfsuite.i18n.get("app.modules.radio_config.deflection"), label = 1, inline = 1, mspapi = 1, apikey = "rc_deflection"   },
            { t = rfsuite.i18n.get("app.modules.radio_config.arming"),     label = 2, inline = 2, mspapi = 1, apikey = "rc_arm_throttle" },
            { t = rfsuite.i18n.get("app.modules.radio_config.min_throttle"),        label = 2, inline = 1, mspapi = 1, apikey = "rc_min_throttle" },
            { t = rfsuite.i18n.get("app.modules.radio_config.max_throttle"),        label = 3, inline = 1, mspapi = 1, apikey = "rc_max_throttle" },
            { t = rfsuite.i18n.get("app.modules.radio_config.cyclic"),     label = 4, inline = 2, mspapi = 1, apikey = "rc_deadband"     },
            { t = rfsuite.i18n.get("app.modules.radio_config.yaw_deadband"),        label = 4, inline = 1, mspapi = 1, apikey = "rc_yaw_deadband" }
        }
    }                 
}


local function postLoad(self)
    rfsuite.app.triggers.closeProgressLoader = true
    self.validateThrottleValues(self)
end

local function validateThrottleValues(self)
    local arm = self.fields[3].value
    local min = self.fields[4].value

    self.fields[4].min = arm + 10

    if min < (arm + 10) then self.fields[4].value = arm + 10 end
end

return {
    mspapi=mspapi,
    reboot = true,
    eepromWrite = true,
    postLoad = postLoad,
    validateThrottleValues = validateThrottleValues,
    API = {},
}
