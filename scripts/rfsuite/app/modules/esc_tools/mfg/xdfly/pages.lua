local PageFiles = {}

-- ESC pages.
PageFiles[#PageFiles + 1] = {title = rfsuite.i18n.get("app.modules.esc_tools.mfg.xdfly.basic"), script = "esc_basic.lua", image = "basic.png"}
PageFiles[#PageFiles + 1] = {title = rfsuite.i18n.get("app.modules.esc_tools.mfg.xdfly.advanced"), script = "esc_advanced.lua", image = "advanced.png"}
PageFiles[#PageFiles + 1] = {title = rfsuite.i18n.get("app.modules.esc_tools.mfg.xdfly.governor"), script = "esc_governor.lua", image = "other.png"}

return PageFiles
