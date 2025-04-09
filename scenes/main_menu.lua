MainMenu = {}

local buttons = {}
local button_text_font = nil

-- this local function must be initialized first so that
-- it can be referenced later. lua is weird.
local function newButton(text, fn)
    return {
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

MainMenu.load = function()
    -- initializes font
    button_text_font = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)
    -- adds buttons to table
    table.insert(buttons, newButton(
        "Start Game",
        -- anonymous function
        function()
            print "Starting Game..."
            ChangeScene("game_scene")
        end))
    table.insert(buttons, newButton(
        "Continue",
        function ()
            print "Loading Game..."
        end
    ))
    table.insert(buttons, newButton(
        "Settings",
        function ()
            print "Settings..."
        end
    ))
    table.insert(buttons, newButton(
        "Quit Game",
        function ()
            print "Quit Game"
            love.event.quit(0)
        end
    ))
end

MainMenu.update = function(dt)

end

-- bunch of constants
-- lua does not support final or const
local LEFT_CLICK = 1

local BUTTON_HEIGHT = 64
local BUTTON_MARGIN = 16
-- bluish grey
local BUTTON_DEFAULT_COLOR = {0.4, 0.4, 0.5, 1.0}
-- white
local BUTTON_HOT_COLOR = {0.8, 0.8, 0.9, 1.0}
-- black
local TEXT_COLOR = {0, 0, 0, 1}

MainMenu.draw = function()
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    local button_width = windowWidth * (1/3)
    local total_height = (BUTTON_HEIGHT + BUTTON_MARGIN) * #buttons
    local button_pos_y = 0

    for i, button in ipairs(buttons) do
        -- button.last and now makes sure that button being pressed is called once
        button.last = button.now

        local button_x = (windowWidth - button_width) * 0.5
        local button_y = (windowHeight - total_height) * 0.5 + button_pos_y

        local button_color = BUTTON_DEFAULT_COLOR
        local mouse_x, mouse_y = love.mouse.getPosition()

        -- button is being hovered by mouse
        local hot = mouse_x > button_x and mouse_x < button_x + button_width and
                    mouse_y > button_y and mouse_y < button_y + BUTTON_HEIGHT

        if hot then
            button_color = BUTTON_HOT_COLOR
        end

        button.now = love.mouse.isDown(LEFT_CLICK)
        -- calls function in parameter if button is clicked
        if (button.now and not button.last and hot) then
            button.fn()
        end

        love.graphics.setColor(button_color)
        love.graphics.rectangle(
        "fill",
        button_x,
        button_y,
        button_width,
        BUTTON_HEIGHT)
        
        -- updates the button position every iteration
        button_pos_y = button_pos_y + BUTTON_HEIGHT + BUTTON_MARGIN

        -- prints black text
        love.graphics.setColor(TEXT_COLOR)
        love.graphics.print(
        button.text,
        button_text_font,
        button_x,
        button_y
        )
    end
end

MainMenu.keyboardpressed = function(k)
    -- if k == "f" then love.filesystem.write("save.txt", "f") end
end

MainMenu.keyboardreleased = function(k)

end

MainMenu.mousepressed = function(x, y, button)

end

MainMenu.mousereleased = function(x, y, button)

end

return MainMenu