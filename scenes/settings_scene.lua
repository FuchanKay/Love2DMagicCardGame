local settings_scene_module = {}

local button_utils = require "game_objects.ui.button"
local box_utils = require "game_objects.ui.box"

local buttons = nil
local boxes = nil

-- constants
local BUTTON_TEXT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)
local SETTINGS_BLOCKS_HEIGHT = 120
local SETTINGS_BLOCKS_SPACING = 20
local MAX_AUDIO = 100

-- the amount that audio changes when arrows are pressed
local AUDIO_INCREMENT = 5

-- the fraction of x-coordinate space that the audio arrows take up
local AUDIO_ARROW_WIDTH_SCREEN_FACTOR = 1/16
local AUDIO_ARROW_SPACING_SCREEN_FACTOR = 1/96

local function addFullScreenButton(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local fullscreen_button_width = window_width / 2
    local highest_settings_button_y = window_height / 5
    local button_x = (window_width - fullscreen_button_width) * 0.5 + (off_x or 0)
    local button_y = highest_settings_button_y + (off_y or 0)
    local text = nil
    if Settings.fullscreen then text = "Set To Windowed" end
    if not Settings.fullscreen then text = "Set To FullScreen" end

    local new_button = button_utils.newButton(
    button_x, button_y,
    fullscreen_button_width, SETTINGS_BLOCKS_HEIGHT,
    nil, nil,
    text,
    BUTTON_TEXT_FONT, nil,
    true, true,
    nil
    )
    -- has to initialize function outside of its constructor to be able to reference itself
    new_button.on_pressed = function()
        Settings.fullscreen = not Settings.fullscreen
        if Settings.fullscreen then new_button.text = "Set To Windowed"
        else new_button.text = "Set To FullScreen" end
        love.window.setFullscreen(Settings.fullscreen)
        ReloadScene()
        new_button.last = false
        love.timer.sleep(0.25)
    end
    if not buttons then error("Buttons is nil") end
    table.insert(buttons, new_button)
end

local back_button_x, back_button_y = 64, 64
local back_button_width, back_button_height = 128, 96
local function addBackButton(off_x, off_y)
    local new_button = button_utils.newButton(
    back_button_x + (off_x or 0), back_button_y + (off_y or 0),
    back_button_width, back_button_height,
    nil, nil,
    "back",
    BUTTON_TEXT_FONT, nil,
    true, true,
    function ()
        ChangeScene("main_menu")
    end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end

local function addLeftAudioArrow(audio_display_box)
    local window_width= love.graphics.getWidth()
    local audio_arrow_width = window_width * AUDIO_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = window_width * AUDIO_ARROW_SPACING_SCREEN_FACTOR
    local button_x = audio_display_box.x - audio_arrow_width - audio_controller_spacing
    local button_y = audio_display_box.y

    local new_button = button_utils.newButton(
        button_x, button_y,
        audio_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        "<",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            Settings.master_audio_level = Settings.master_audio_level - AUDIO_INCREMENT
            if Settings.master_audio_level < 0 then Settings.master_audio_level = 0 end
            audio_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end

local function addRightAudioArrow(audio_display_box)
    local window_width = love.graphics.getWidth()
    local AUDIO_ARROW_WIDTH = window_width * AUDIO_ARROW_WIDTH_SCREEN_FACTOR
    local AUDIO_CONTROLLER_SPACING = window_width * AUDIO_ARROW_SPACING_SCREEN_FACTOR
    local button_x = audio_display_box.x + audio_display_box.width + AUDIO_CONTROLLER_SPACING
    local button_y = audio_display_box.y

    local new_button = button_utils.newButton(
        button_x, button_y,
        AUDIO_ARROW_WIDTH, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        ">",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            Settings.master_audio_level = Settings.master_audio_level + AUDIO_INCREMENT
            if Settings.master_audio_level > MAX_AUDIO then Settings.master_audio_level = MAX_AUDIO end
            audio_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end

local function addAudioController(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local audio_arrow_width = window_width * AUDIO_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = window_width * AUDIO_ARROW_SPACING_SCREEN_FACTOR
    local audio_display_box_width = (window_width / 2) - 2 * (audio_arrow_width + audio_controller_spacing)
    local highest_settings_block_y = window_height / 5
    local box_x = (window_width - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)

    local new_box = box_utils.newBox(
        box_x, box_y,
        audio_display_box_width, SETTINGS_BLOCKS_HEIGHT,
        nil, "Master Audio: "..tostring(Settings.master_audio_level),
        BUTTON_TEXT_FONT, nil,
        true, true
    )

    addRightAudioArrow(new_box)
    addLeftAudioArrow(new_box)

    if not boxes then error("boxes is nil") end
    table.insert(boxes, new_box)
end

settings_scene_module.load = function()
    buttons = {}
    boxes = {}
    addBackButton()
    addFullScreenButton()
    addAudioController(0, SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING)
end

settings_scene_module.update = function(dt)

end

settings_scene_module.draw = function()
    button_utils.updateAll(buttons)
    box_utils.updateAll(boxes)
end

settings_scene_module.keyboardpressed = function(k)
    -- if k == "f" then love.filesystem.write("save.txt", "f") end
end

settings_scene_module.keyboardreleased = function(k)

end

settings_scene_module.mousepressed = function(x, y, button)

end

settings_scene_module.mousereleased = function(x, y, button)

end

return settings_scene_module