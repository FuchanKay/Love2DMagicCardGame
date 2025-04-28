local box_module = {}
local Colors = require "libraries.luacolors"
-- bluish grey
local DEFAULT_COLOR = {0.4, 0.4, 0.5, 1.0}
-- Colors.black
local DEFAULT_TEXT_COLOR = {0, 0, 0, 1}

local DEFAULT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

box_module.newBox = function(x, y, width, height, box_color, text, font, text_color, centered_x, centered_y)
    -- if argument is nil, or X sets the property to X
    local box = {
        x = x or 0,
        y = y or 0,
        width = width or 64,
        height = height or 64,
        box_color = box_color or DEFAULT_COLOR,
        text = text or "",
        font = font or DEFAULT_FONT,
        text_color = text_color or DEFAULT_TEXT_COLOR,
        centered_x = centered_x or false,
        centered_y = centered_y or false,
    }

    box.draw = function()
        love.graphics.setColor(box.box_color)
        love.graphics.rectangle(
        "fill",
        box.x,
        box.y,
        box.width,
        box.height)
            -- prints Colors.black text
        love.graphics.setColor(box.text_color)
        -- centers text
        local text_offset_x = 0
        if box.centered_x then
            local text_width = box.font:getWidth(box.text)
            text_offset_x = (box.width - text_width) / 2
        end
        local text_offset_y = 0
        if box.centered_y then
            local text_height = box.font:getHeight(box.text)
            text_offset_y = (box.height - text_height) / 2
        end
        love.graphics.setFont(box.font)
        love.graphics.printf(
            box.text,
            box.x + text_offset_x,
            box.y + text_offset_y,
            box.width
        )
        love.graphics.setColor(Colors.white)
    end
    return box
end

return box_module