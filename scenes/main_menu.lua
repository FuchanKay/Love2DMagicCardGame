local main_menu_module = {}
local button_utils = require "game_objects.ui.button"
-- if you want to do a private global variable like this,
-- make sure to set it to nil then assign a value in load()
local buttons = nil

-- bunch of constants
-- NOTE: lua does not support final or const
local main_buttons_height = 120
local main_buttons_spacing = 20
local button_text_font = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

local function addStartButton(off_x, off_y)
    if buttons == nil then error("Buttons is nil") end
    local window_width, window_height = love.graphics.getDimensions()
    local main_buttons_width = window_width / 2
    local highest_main_button_y = window_height / 5
    local button_x = (window_width - main_buttons_width) * 0.5 + (off_x or 0)
    local button_y = highest_main_button_y + (off_y or 0)
    table.insert(buttons, button_utils.newButton(
    button_x, button_y,
    main_buttons_width, main_buttons_height,
    nil, nil,
    "Start Game",
    button_text_font, nil,
    true, true,
    function ()
        ChangeScene("game_scene")
    end
    ))
end
local function addContinueButton(off_x, off_y)
    if buttons == nil then error("Buttons is nil") end
    local window_width, window_height = love.graphics.getDimensions()
    local main_buttons_width = window_width / 2
    local highest_main_button_y = window_height / 5
    local button_x = (window_width - main_buttons_width) * 0.5 + (off_x or 0)
    local button_y = highest_main_button_y + (off_y or 0)
    table.insert(buttons, button_utils.newButton(
    button_x, button_y,
    main_buttons_width, main_buttons_height,
    nil, nil,
    "Continue Game",
    button_text_font, nil,
    true, true,
    function ()
        print "continue"
    end
    ))
end
local function addSettingsButton(off_x, off_y)
    if buttons == nil then error("Buttons is nil") end
    local window_width, window_height = love.graphics.getDimensions()
    local main_buttons_width = window_width / 2
    local highest_main_button_y = window_height / 5
    local button_x = (window_width - main_buttons_width) * 0.5 + (off_x or 0)
    local button_y = highest_main_button_y + (off_y or 0)
    table.insert(buttons, button_utils.newButton(
    button_x, button_y,
    main_buttons_width, main_buttons_height,
    nil, nil,
    "Settings",
    button_text_font, nil,
    true, true,
    function ()
        ChangeScene("settings_scene")
    end
    ))
end
local function addQuitButton(off_x, off_y)
    if buttons == nil then error("Buttons is nil") end
    local window_width, window_height = love.graphics.getDimensions()
    local main_buttons_width = window_width / 2
    local highest_main_button_y = window_height / 5
    local button_x = (window_width - main_buttons_width) * 0.5 + (off_x or 0)
    local button_y = highest_main_button_y + (off_y or 0)
    table.insert(buttons, button_utils.newButton(
    button_x, button_y,
    main_buttons_width, main_buttons_height,
    nil, nil,
    "Quit",
    button_text_font, nil,
    true, true,
    function ()
        love.event.quit(0)
    end
    ))
end

main_menu_module.load = function()
    buttons = {}
    -- initializes font
    addStartButton(0, 0)
    addContinueButton(0, main_buttons_height + main_buttons_spacing)
    addSettingsButton(0, 2 * (main_buttons_height + main_buttons_spacing))
    addQuitButton(0, 3 * (main_buttons_height + main_buttons_spacing))
end

main_menu_module.update = function(dt)

end

main_menu_module.draw = function()
    button_utils.updateAll(buttons)
end

main_menu_module.keyboardpressed = function(k)
    -- if k == "f" then love.filesystem.write("save.txt", "f") end
end

main_menu_module.keyboardreleased = function(k)

end

main_menu_module.mousepressed = function(x, y, button)

end

main_menu_module.mousereleased = function(x, y, button)

end

return main_menu_module