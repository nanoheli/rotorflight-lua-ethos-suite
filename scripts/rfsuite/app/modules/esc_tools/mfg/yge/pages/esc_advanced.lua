
local folder = "yge"

local mspapi = {
    api = {
        [1] = "ESC_PARAMETERS_YGE",
    },
    formdata = {
        labels = {
        },
        fields = {
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.min_start_power"), mspapi = 1, apikey="min_start_power"},
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.max_start_power"), mspapi = 1, apikey="max_start_power"},
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.throttle_response"), type = 1, mspapi = 1, apikey="throttle_response"},
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.timing"), type = 1, mspapi = 1, apikey="timing"},
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.active_freewheel"), type = 1, mspapi = 1, apikey="active_freewheel"},
            {t = rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.f3c_auto"), type = 1, mspapi = 1, apikey="f3c_auto"},
        }
    }                 
}


local foundEsc = false
local foundEscDone = false

function postLoad()
    rfsuite.app.triggers.closeProgressLoader = true
end

local function onNavMenu(self)
    rfsuite.app.triggers.escToolEnableButtons = true
    rfsuite.app.ui.openPage(pidx, folder, "esc_tools/esc_tool.lua")
end

local function event(widget, category, value, x, y)

    -- if close event detected go to section home page
    if category == EVT_CLOSE and value == 0 or value == 35 then
        if powercycleLoader then powercycleLoader:close() end
        rfsuite.app.ui.openPage(pidx, folder, "esc_tools/esc_tool.lua")
        return true
    end


end

return {
    mspapi = mspapi,
    eepromWrite = true,
    reboot = false,
    escinfo = escinfo,
    svTiming = 0,
    svFlags = 0,
    postLoad = postLoad,
    navButtons = {menu = true, save = true, reload = true, tool = false, help = false},
    onNavMenu = onNavMenu,
    event = event,
    pageTitle = rfsuite.i18n.get("app.modules.esc_tools.name") .. " / " ..  rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.name") .. " / " .. rfsuite.i18n.get("app.modules.esc_tools.mfg.yge.advanced"),
    headerLine = rfsuite.escHeaderLineText
}
