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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * Note: Some icons have been sourced from https://www.flaticon.com/
]] --
local rf2craftname = {wakeupSchedulerUI = os.clock()}

local sensors
local lastName
local lastID
local bitmapPtr
local image
local default_image = "widgets/craftname/default_image.png"
local config = {}

local LCD_W, LCD_H = lcd.getWindowSize()
local LCD_MINH4IMAGE = 130

-- error function
function screenError(msg)
    local w, h = lcd.getWindowSize()
    local isDarkMode = lcd.darkMode()

    -- Available font sizes in order from smallest to largest
    local fonts = {FONT_XXS, FONT_XS, FONT_S, FONT_STD, FONT_L, FONT_XL, FONT_XXL}

    -- Determine the maximum width and height with 10% padding
    local maxW, maxH = w * 0.9, h * 0.9
    local bestFont = FONT_XXS
    local bestW, bestH = 0, 0

    -- Loop through font sizes and find the largest one that fits
    for _, font in ipairs(fonts) do
        lcd.font(font)
        local tsizeW, tsizeH = lcd.getTextSize(msg)
        
        if tsizeW <= maxW and tsizeH <= maxH then
            bestFont = font
            bestW, bestH = tsizeW, tsizeH
        else
            break  -- Stop checking larger fonts once one exceeds limits
        end
    end

    -- Set the optimal font
    lcd.font(bestFont)

    -- Set text color based on dark mode
    local textColor = isDarkMode and lcd.RGB(255, 255, 255, 1) or lcd.RGB(90, 90, 90)
    lcd.color(textColor)

    -- Center the text on the screen
    local x = (w - bestW) / 2
    local y = (h - bestH) / 2
    lcd.drawText(x, y, msg)
end

-- Create function
function rf2craftname.create(widget)
    LCD_W, LCD_H = lcd.getWindowSize()
    bitmapPtr = rfsuite.utils.loadImage(default_image)
end

-- Paint function
function rf2craftname.paint(widget)
    if not rfsuite.utils.ethosVersionAtLeast() then
        status.screenError(string.format(string.upper(rfsuite.i18n.get("ethos")) .." < V%d.%d.%d", 
            rfsuite.config.ethosVersion[1], 
            rfsuite.config.ethosVersion[2], 
            rfsuite.config.ethosVersion[3])
        )
        return
    end

    local w, h = lcd.getWindowSize()  -- Ensure consistency with rf2gov.paint

    -- Text to display
    local str = rfsuite.tasks.active() and rfsuite.session.craftName or "[".. string.upper(rfsuite.i18n.get("no_link")) .. "]"

    -- Available font sizes ordered from smallest to largest
    local fonts = {FONT_XXS, FONT_XS, FONT_S, FONT_STD, FONT_L, FONT_XL, FONT_XXL}

    -- Layout variables
    local padding = 5
    local hasImage = config.image and bitmapPtr ~= nil

    -- Image handling
    local imageY = hasImage and h * 0.1 or 0  -- Image starts 10% from the top if present
    local imageHeight = hasImage and h * 0.7 or 0  -- Image takes 70% height if present

    -- Determine available text area
    local textAvailableHeight = hasImage and (h - (imageY + imageHeight) - (h * 0.1)) or h * 0.9  -- Ensure same as rf2gov.paint

    -- Ensure there's enough space for text
    if textAvailableHeight < 20 then
        textAvailableHeight = 20  -- Set a minimum height to avoid cutting text
    end

    -- Max dimensions for text
    local maxW, maxH = w * 0.9, textAvailableHeight * 0.9
    local bestFont, bestW, bestH = FONT_XXS, 0, 0

    -- Loop through font sizes and find the largest one that fits
    for _, font in ipairs(fonts) do
        lcd.font(font)
        local tsizeW, tsizeH = lcd.getTextSize(str)

        if tsizeW <= maxW and tsizeH <= maxH then
            bestFont, bestW, bestH = font, tsizeW, tsizeH
        else
            break  -- Stop checking larger fonts once one exceeds limits
        end
    end

    -- Set the optimal font
    lcd.font(bestFont)

    -- Correct Centering: Apply small correction factor
    local centerY = (h - bestH) / 2
    local correctionFactor = bestH * 0.1  -- Small correction (10% of text height)
    local posX = (w - bestW) / 2
    local posY = hasImage and (h - (h * 0.1) - bestH) or (centerY + correctionFactor)

    -- Draw the image if available
    if hasImage then
        local bitmapX = padding
        local bitmapW = w - (padding * 2)
        local bitmapH = imageHeight

        lcd.drawBitmap(bitmapX, imageY, bitmapPtr, bitmapW, bitmapH)
    end

    -- Draw the text
    lcd.drawText(posX, posY, str)
end



-- Configure function
function rf2craftname.configure(widget)
    -- reset this to force a lcd refresh
    lastName = nil
    lastID = nil
    
    LCD_W, LCD_H = lcd.getWindowSize()
    if LCD_H > LCD_MINH4IMAGE then
        local line = form.addLine(rfsuite.i18n.get("image"))
        form.addBooleanField(line, nil, function()
            return config.image
        end, function(newValue)
            config.image = newValue
        end)
    end

    return widget
end

-- Read function
function rf2craftname.read(widget)
    -- display or not display an image on the page
    config.image = storage.read("mem1")
    if config.image == nil then config.image = false end

end

-- Write function
function rf2craftname.write(widget)
    storage.write("mem1", config.image)
end

-- Event function
function rf2craftname.event(widget, event)
    -- Placeholder for widget event logic
end

-- Main wakeup function
function rf2craftname.wakeup(widget)
    local schedulerUI = lcd.isVisible() and 0.5 or 5
    local now = os.clock()

    if (now - rf2craftname.wakeupSchedulerUI) >= schedulerUI then
        rf2craftname.wakeupSchedulerUI = now
        rf2craftname.wakeupUI()
    end

end

function rf2craftname.wakeupUI()

    LCD_W, LCD_H = lcd.getWindowSize()

    if LCD_H < LCD_MINH4IMAGE then config.image = false end

    if lastName ~= rfsuite.session.craftName or lastID ~= rfsuite.session.modelID then
        if rfsuite.session.craftName ~= nil then image1 = "/bitmaps/models/" .. rfsuite.session.craftName .. ".png" end
        if rfsuite.session.modelID ~= nil then image2 = "/bitmaps/models/" .. rfsuite.session.modelID .. ".png" end

        bitmapPtr = rfsuite.utils.loadImage(image1, image2, default_image)

        lcd.invalidate()
    end

    lastName = rfsuite.session.craftName
    lastID = rfsuite.session.modelID
end

-- this is called if a langage swap event occurs
function rf2craftname.i18n()

end  

return rf2craftname
