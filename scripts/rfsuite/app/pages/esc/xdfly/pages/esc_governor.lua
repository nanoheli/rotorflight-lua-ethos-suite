local labels = {}
local fields = {}

local folder = "xdfly"
local ESC = assert(loadfile("app/pages/esc/" .. folder .. "/init.lua"))()
local mspHeaderBytes = ESC.mspHeaderBytes
local mspSignature = ESC.mspSignature

local foundEsc = false
local foundEscDone = false

local govMode = {"External Governor", "ESC Governor" , "Fixed Windg"}

fields[#fields + 1] = {t = "Governor",  vals = {mspHeaderBytes + 4, mspHeaderBytes + 3}, tableIdxInc = -1, table = govMode}
fields[#fields + 1] = {t = "Gov-P",  vals = {mspHeaderBytes + 14, mspHeaderBytes + 13}, min = 1, max = 10, default = 4}
fields[#fields + 1] = {t = "Gov-I",  vals = {mspHeaderBytes + 16, mspHeaderBytes + 15}, min = 1, max = 10, default = 3}

function postLoad()
    rfsuite.app.triggers.isReady = true
end

local function onNavMenu(self)
    rfsuite.app.triggers.escToolEnableButtons = true
    rfsuite.app.ui.openPage(pidx, folder, "esc_tool.lua")
end

local function event(widget, category, value, x, y)

    -- print("Event received:" .. ", " .. category .. "," .. value .. "," .. x .. "," .. y)

    if category == 5 or value == 35 then
        rfsuite.app.ui.openPage(pidx, folder, "esc_tool.lua")
        return true
    end

    return false
end

return {
    read = 217, -- msp_ESC_PARAMETERS
    write = 218, -- msp_SET_ESC_PARAMETERS
    eepromWrite = true,
    reboot = false,
    title = "Governor",
    minBytes = mspBytes,
    labels = labels,
    fields = fields,
    escinfo = escinfo,
    simulatorResponse = {115, 0, 6, 18, 0, 1, 0, 1, 0, 2, 0, 84, 0, 1, 0, 5, 0, 4, 0, 2, 0, 1, 0, 92, 0, 1, 0, 0, 0, 50, 0, 1, 0, 11, 0, 18, 0, 0},
    postLoad = postLoad,
    navButtons = {menu = true, save = true, reload = true, tool = false, help = false},
    onNavMenu = onNavMenu,
    event = event,
    pageTitle = "ESC / XDFLY / Governor",
    headerLine = rfsuite.escHeaderLineText

}
