Box = Object:extend()
-- bluish grey
local DEFAULT_COLOR = {0.4, 0.4, 0.5, 1.0}
-- Colors.black
local DEFAULT_TEXT_COLOR = {0, 0, 0, 1}
local DEFAULT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

function Box:init(x, y, width, height, box_color, text, font, text_color, centered_x, centered_y)
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

    function box:draw()
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

Button = Object:extend()

local LEFT_CLICK = 1
-- bluish grey
local DEFAULT_COLOR = {0.4, 0.4, 0.5, 1.0}
-- Colors.white
local HOT_COLOR = {0.8, 0.8, 0.9, 1.0}
-- Colors.black
local DEFAULT_TEXT_COLOR = {0, 0, 0, 1}

local DEFAULT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

-- really bloated constructor but idk how to do it any other way
function Button:init(x, y, width, height, button_color, hot_color, text, font, text_color, centered_x, centered_y, on_pressed)
    -- if argument is nil, or X sets the property to X
    local button = {
        x = x or 0,
        y = y or 0,
        width = width or 64,
        height = height or 64,
        hot = false,
        default_color = button_color or DEFAULT_COLOR,
        hot_color = hot_color or HOT_COLOR,
        text = text or "",
        font = font or DEFAULT_FONT,
        text_color = text_color or DEFAULT_TEXT_COLOR,
        centered_x = centered_x or false,
        centered_y = centered_y or false,
        on_pressed = on_pressed or function() print"no function provided for button" end,
        now = false,
        last = false
    }
    function button:update()
        -- button.last/now makes sure that button being pressed is called once
        button.last = button.now

        local mouse_x, mouse_y = love.mouse.getPosition()

        -- button is being hovered by mouse
        button.hot = mouse_x > button.x and mouse_x < button.x + button.width and
                    mouse_y > button.y and mouse_y < button.y + button.height

        button.now = love.mouse.isDown(LEFT_CLICK)
        -- calls function in parameter if button is clicked
        if button.now and not button.last and button.hot then
            button.on_pressed()
        end
    end

    function button:draw()
        love.graphics.push()
        button_color = button.default_color
        if button.hot then button_color = button.hot_color end
        love.graphics.setColor(button_color)
        love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

        -- prints Colors.black text
        love.graphics.setColor(button.text_color)
        -- centers text
        local text_offset_x = 0
        if button.centered_x then
            local text_width = button.font:getWidth(button.text)    
            text_offset_x = (button.width - text_width) / 2
        end
        local text_offset_y = 0
        if button.centered_y then
            local text_height = button.font:getHeight(button.text)
            text_offset_y = (button.height - text_height) / 2
        end
        love.graphics.setFont(button.font)
        love.graphics.print(button.text, button.x + text_offset_x, button.y + text_offset_y)
        love.graphics.pop()
    end
    return button
end