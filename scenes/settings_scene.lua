local settings_scene_module = {}

local button_utils = require "game_objects.ui.button"
local box_utils = require "game_objects.ui.box"

local buttons = nil
local boxes = nil
local button_text_font = nil


-- constants
local button_text_font = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)
local settings_blocks_height = 120
local settings_blocks_spacing = 20
local audio_arrow_width = 128
local audio_controller_spacing = 10
local max_audio = 100
-- the amount that audio changes when arrows are pressed
local audio_increment = 5

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
    fullscreen_button_width, settings_blocks_height,
    nil, nil,
    text,
    button_text_font, nil,
    true, true,
    nil
    )
    -- has to initialize function outside of its constructor to be able to reference itself
    new_button.on_pressed = function()
        Settings.fullscreen = not Settings.fullscreen
        if Settings.fullscreen then new_button.text = "Set To Windowed"
        else new_button.text = "Set To FullScreen" end
        love.window.setFullscreen(Settings.fullscreen)
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
    button_text_font, nil,
    true, true,
    function ()
        ChangeScene("main_menu")
    end
    )
    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end

local function addLeftAudioArrow(audio_display_box)
    local button_x = audio_display_box.x - audio_arrow_width - audio_controller_spacing
    local button_y = audio_display_box.y
    local new_button = button_utils.newButton(
        button_x, button_y,
        audio_arrow_width, settings_blocks_height,
        nil, nil,
        "<",
        nil, nil,
        true, true,
        function()
            Settings.game_audio_level = Settings.game_audio_level - audio_increment
            if Settings.game_audio_level < 0 then Settings.game_audio_level = 0 end
            audio_display_box.text = "Master Audio: "..tostring(Settings.game_audio_level)
        end
    )
    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end

local function addRightAudioArrow(audio_display_box)
    local button_x = audio_display_box.x + audio_display_box.width + audio_controller_spacing
    local button_y = audio_display_box.y
    local new_button = button_utils.newButton(
        button_x, button_y,
        audio_arrow_width, settings_blocks_height,
        nil, nil,
        ">",
        nil, nil,
        true, true,
        function()
            Settings.game_audio_level = Settings.game_audio_level + audio_increment
            if Settings.game_audio_level > max_audio then Settings.game_audio_level = max_audio end
            audio_display_box.text = "Master Audio: "..tostring(Settings.game_audio_level)
        end
    )
    if not buttons then error("buttons is nil") end
    table.insert(buttons, new_button)
end
--(window_width - fullscreen_button_width) * 0.5
local function addAudioController(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local audio_display_box_width = (window_width / 2) - 2 * (audio_arrow_width + audio_controller_spacing)
    local highest_settings_block_y = window_height / 5
    local box_x = (window_width - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)
    local new_box = box_utils.newBox(
        box_x, box_y,
        audio_display_box_width, settings_blocks_height,
        nil, "Master Audio: "..tostring(Settings.game_audio_level),
        nil, nil,
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
    addAudioController(0, settings_blocks_height + settings_blocks_spacing)
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