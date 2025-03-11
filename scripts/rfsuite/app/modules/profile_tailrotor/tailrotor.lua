local activateWakeup = false


local mspapi = {
    api = {
        [1] = "PID_PROFILE",
    },
    formdata = {
        labels = {
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.inertia_precomp"),        label = 2, inline_size = 13.6, apiversiongte = 12.08 },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.collective_impulse_ff"),  label = 3, inline_size = 13.6, apiversionlte = 12.07 },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.yaw_stop_gain"),          label = 1, inline_size = 13.6 },           
        },
        fields = {
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.precomp_cutoff"),        mspapi = 1, apikey = "yaw_precomp_cutoff" },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.cyclic_ff_gain"),        mspapi = 1, apikey = "yaw_cyclic_ff_gain" },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.collective_ff_gain"),    mspapi = 1, apikey = "yaw_collective_ff_gain" },

            -- Collective Impulse FF
            -- gt 12.08
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.gain"),                  inline = 2, label = 2, mspapi = 1, apikey = "yaw_inertia_precomp_gain", apiversiongte = 12.08 },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.cutoff"),                inline = 1, label = 2, mspapi = 1, apikey = "yaw_inertia_precomp_cutoff", apiversiongte = 12.08 },
            -- lt 12.07
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.gain"),                  inline = 2, label = 3, mspapi = 1, apikey = "yaw_collective_dynamic_gain",  apiversionlte = 12.07 },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.decay"),                 inline = 1, label = 3, mspapi = 1, apikey = "yaw_collective_dynamic_decay", apiversionlte = 12.07 },

            -- Yaw stop gain
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.cw"),                    inline = 2, label = 1, mspapi = 1, apikey = "yaw_cw_stop_gain" },
            { t = rfsuite.i18n.get("app.modules.profile_tailrotor.ccw"),                   inline = 1, label = 1, mspapi = 1, apikey = "yaw_ccw_stop_gain" },           
        }
    }                 
}


local function postLoad(self)
    rfsuite.app.triggers.closeProgressLoader = true
    activateWakeup = true
end

local function wakeup()

    if activateWakeup == true and rfsuite.tasks.msp.mspQueue:isProcessed() then        
        if rfsuite.session.activeProfile ~= nil then
            rfsuite.app.formFields['title']:value(rfsuite.app.Page.title .. " #" .. rfsuite.session.activeProfile)
            currentProfileChecked = true
        end
    end

end

return {
    mspapi = mspapi,
    title = rfsuite.i18n.get("app.modules.profile_tailrotor.name"),
    refreshOnProfileChange = true,
    reboot = false,
    eepromWrite = true,
    postLoad = postLoad,
    wakeup = wakeup,
    API = {},
}
