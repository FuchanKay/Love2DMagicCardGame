local button_module = {}

local LEFT_CLICK = 1
-- bluish grey
local DEFAULT_COLOR = {0.4, 0.4, 0.5, 1.0}
-- white
local HOT_COLOR = {0.8, 0.8, 0.9, 1.0}
-- black
local DEFAULT_TEXT_COLOR = {0, 0, 0, 1}

local DEFAULT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

-- really bloated constructor but idk how to do it any other way
button_module.newButton = function(x, y, width, height, button_color, hot_color, text, font, text_color, centered_x, centered_y, on_pressed)
    -- if argument is nil, or X sets the property to X
    return {
        x = x or 0,
        y = y or 0,
        width = width or 64,
        height = height or 64,
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
end

button_module.buttonUpdate = function(button)
    -- button.last/now makes sure that button being pressed is called once
    button.last = button.now

    local button_color = button.default_color
    local mouse_x, mouse_y = love.mouse.getPosition()

    -- button is being hovered by mouse
    local hot = mouse_x > button.x and mouse_x < button.x + button.width and
                mouse_y > button.y and mouse_y < button.y + button.height

    if hot then button_color = button.hot_color end

    button.now = love.mouse.isDown(LEFT_CLICK)
    -- calls function in parameter if button is clicked
    if (button.now and not button.last and hot) then
        button.on_pressed()
    end

    love.graphics.setColor(button_color)
    love.graphics.rectangle(
    "fill",
    button.x,
    button.y,
    button.width,
    button.height)

    -- prints black text
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
    love.graphics.print(
    button.text,
    button.font,
    button.x + text_offset_x,
    button.y + text_offset_y
    )
end

button_module.updateAll = function(buttons)
    for i, button in ipairs(buttons) do
        button_module.buttonUpdate(button)
    end
end
return button_module