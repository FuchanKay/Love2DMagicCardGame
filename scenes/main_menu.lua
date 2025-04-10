local main_menu_module = {}
local button_utils = require "game_objects.ui.button"
-- if you want to do a private global variable like this,
-- make sure to set it to nil then assign a value in load()
local buttons = nil

-- bunch of constants
-- NOTE: lua does not support final or const
local MAIN_BUTTONS_HEIGHT = 120
local MAIN_BUTTONS_SPACING = 20
local BUTTON_TEXT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

local function addStartButton(off_x, off_y)
    if buttons == nil then error("Buttons is nil") end
    local window_width, window_height = love.graphics.getDimensions()
    local main_buttons_width = window_width / 2
    local highest_main_button_y = window_height / 5
    local button_x = (window_width - main_buttons_width) * 0.5 + (off_x or 0)
    local button_y = highest_main_button_y + (off_y or 0)
    table.insert(buttons, button_utils.newButton(
    button_x, button_y,
    main_buttons_width, MAIN_BUTTONS_HEIGHT,
    nil, nil,
    "Start Game",
    BUTTON_TEXT_FONT, nil,
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
    main_buttons_width, MAIN_BUTTONS_HEIGHT,
    nil, nil,
    "Continue Game",
    BUTTON_TEXT_FONT, nil,
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
    main_buttons_width, MAIN_BUTTONS_HEIGHT,
    nil, nil,
    "Settings",
    BUTTON_TEXT_FONT, nil,
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
    main_buttons_width, MAIN_BUTTONS_HEIGHT,
    nil, nil,
    "Quit",
    BUTTON_TEXT_FONT, nil,
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
    addContinueButton(0, MAIN_BUTTONS_HEIGHT + MAIN_BUTTONS_SPACING)
    addSettingsButton(0, 2 * (MAIN_BUTTONS_HEIGHT + MAIN_BUTTONS_SPACING))
    addQuitButton(0, 3 * (MAIN_BUTTONS_HEIGHT + MAIN_BUTTONS_SPACING))
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