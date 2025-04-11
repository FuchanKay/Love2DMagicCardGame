local settings_scene_module = {}

local button_utils = require "game_objects.ui.button"
local box_utils = require "game_objects.ui.box"

local buttons = nil
local boxes = nil

local fullscreen_
local master_audio_level_is_updated = false

local late_fullscreen = Settings.fullscreen
local late_master_audio_level = Settings.master_audio_level
local late_screen_dimensions = Settings.screen

-- every button and its properties can be globally accessed and changed
local full_screen_button = nil
local back_button = nil
local left_audio_arrow_button = nil
local right_audio_arrow_button = nil
local audio_level_display_box = nil
local left_dimension_arrow_button = nil
local right_dimension_arrow_button = nil
local dimension_display_box = nil
local settings_apply_button = nil

-- constants
local BUTTON_TEXT_FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)
local SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR = 1/5
local SETTINGS_BLOCKS_HEIGHT = 120
local SETTINGS_BLOCKS_SPACING = 20
local MAX_AUDIO = 100
local SCREEN_RESOLUTIONS = {
    {1280, 720},
    {1366, 768},
    {1440, 900},
    {1536, 864},
    {1600, 900},
    {1920, 1080}
}
local NUM_OF_SCREEN_RESOLUTIONS = #SCREEN_RESOLUTIONS
-- the amount that audio changes when arrows are pressed
local AUDIO_INCREMENT = 5
-- the fraction of x-coordinate space that the audio arrows take up
local CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR = 1/16
local CONTROLLER_ARROW_SPACING_SCREEN_FACTOR = 1/96

local function addFullScreenButton(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local fullscreen_button_width = window_width / 2
    local highest_settings_button_y = window_height * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local button_x = (window_width - fullscreen_button_width) * 0.5 + (off_x or 0)
    local button_y = highest_settings_button_y + (off_y or 0)
    local text = nil
    if Settings.fullscreen then text = "Set To Windowed" end
    if not Settings.fullscreen then text = "Set To FullScreen" end

    full_screen_button = button_utils.newButton(
    button_x, button_y,
    fullscreen_button_width, SETTINGS_BLOCKS_HEIGHT,
    nil, nil,
    text,
    BUTTON_TEXT_FONT, nil,
    true, true,
    nil
    )
    -- has to initialize function outside of its constructor to be able to reference itself
    full_screen_button.on_pressed = function()
        late_fullscreen = not late_fullscreen
        if Settings.fullscreen then full_screen_button.text = "Set To Windowed"
        else full_screen_button.text = "Set To FullScreen" end
    end
    if not buttons then error("Buttons is nil") end
    table.insert(buttons, full_screen_button)
end

local BACK_BUTTON_X, BACK_BUTTON_Y = 64, 64
local BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT = 128, 96
local function addBackButton(off_x, off_y)
    back_button = button_utils.newButton(
    BACK_BUTTON_X + (off_x or 0), BACK_BUTTON_Y + (off_y or 0),
    BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT,
    nil, nil,
    "back",
    BUTTON_TEXT_FONT, nil,
    true, true,
    function ()
        late_fullscreen = Settings.fullscreen
        late_master_audio_level = Settings.master_audio_level
        late_screen_dimensions = Settings.window_dimensions
        ChangeScene("main_menu")
    end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, back_button)
end

local function addLeftAudioArrow()
    local window_width= love.graphics.getWidth()
    local audio_arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not audio_level_display_box then error("audio level display box is nil") end
    local button_x = audio_level_display_box.x - audio_arrow_width - audio_controller_spacing
    local button_y = audio_level_display_box.y

    left_audio_arrow_button = button_utils.newButton(
        button_x, button_y,
        audio_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        "<",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            late_master_audio_level = late_master_audio_level - AUDIO_INCREMENT
            if Settings.master_audio_level < 0 then
                Settings.master_audio_level = 0
            end
            if Settings.master_audio_level ~= late_master_audio_level then
                has_settings_to_apply = true
            end
            audio_level_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, left_audio_arrow_button)
end

local function addRightAudioArrow()
    local window_width = love.graphics.getWidth()
    local audio_arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not audio_level_display_box then error("audio level display box is nil") end
    local button_x = audio_level_display_box.x + audio_level_display_box.width + audio_controller_spacing
    local button_y = audio_level_display_box.y

    right_audio_arrow_button = button_utils.newButton(
        button_x, button_y,
        audio_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        ">",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            late_master_audio_level = late_master_audio_level + AUDIO_INCREMENT
            if Settings.master_audio_level > MAX_AUDIO then
                Settings.master_audio_level = MAX_AUDIO
            end
            if Settings.master_audio_level ~= late_master_audio_level then
                has_settings_to_apply = true
            end
            audio_level_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, right_audio_arrow_button)
end

local function addAudioController(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local audio_arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    local audio_display_box_width = (window_width / 2) - 2 * (audio_arrow_width + audio_controller_spacing)
    local highest_settings_block_y = window_height * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local box_x = (window_width - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)

    audio_level_display_box = box_utils.newBox(
        box_x, box_y,
        audio_display_box_width, SETTINGS_BLOCKS_HEIGHT,
        nil, "Master Audio: "..tostring(Settings.master_audio_level),
        BUTTON_TEXT_FONT, nil,
        true, true
    )

    addRightAudioArrow()
    addLeftAudioArrow()

    if not boxes then error("boxes is nil") end
    table.insert(boxes, audio_level_display_box)
end
-- default windowed screen resolution is 1280 x 720
local screen_res_ind = 1
local function addLeftDimensionArrow()
    local window_width = love.graphics.getWidth()
    local dimension_arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local dimension_controller_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not dimension_display_box then error("dimension display box is nil") end
    local button_x = dimension_display_box.x - dimension_arrow_width - dimension_controller_spacing
    local button_y = dimension_display_box.y

    left_dimension_arrow_button = button_utils.newButton(
        button_x, button_y,
        dimension_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        "<",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            screen_res_ind = screen_res_ind - 1
            if screen_res_ind < 1 then screen_res_ind = 1 end
            late_screen_dimensions = SCREEN_RESOLUTIONS[screen_res_ind]
            dimension_display_box.text = "Res: "..tostring(Settings.window_dimensions[1]).."x"..tostring(Settings.window_dimensions[2])
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, left_dimension_arrow_button)
end

local function addRightDimensionArrow()
    local window_width = love.graphics.getWidth()
    local dimension_arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local dimension_controller_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not dimension_display_box then error("dimension display box is nil") end
    local button_x = dimension_display_box.x + dimension_display_box.width + dimension_controller_spacing
    local button_y = dimension_display_box.y

    right_dimension_arrow_button = button_utils.newButton(
        button_x, button_y,
        dimension_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        ">",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            screen_res_ind = screen_res_ind + 1
            if screen_res_ind > NUM_OF_SCREEN_RESOLUTIONS then screen_res_ind = NUM_OF_SCREEN_RESOLUTIONS end
            late_screen_dimensions = SCREEN_RESOLUTIONS[screen_res_ind]
            dimension_display_box.text = "Res: "..tostring(Settings.window_dimensions[1]).."x"..tostring(Settings.window_dimensions[2])
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, right_dimension_arrow_button)
end

local addScreenDimensionController = function(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()

    local arrow_width = window_width * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local arrow_spacing = window_width * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    local audio_display_box_width = (window_width / 2) - 2 * (arrow_width + arrow_spacing)

    local highest_settings_block_y = window_height / 5
    local box_x = (window_width - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)

    dimension_display_box = box_utils.newBox(
        box_x, box_y,
        audio_display_box_width, SETTINGS_BLOCKS_HEIGHT,
        nil, "Res: "..tostring(Settings.window_dimensions[1]).."x"..tostring(Settings.window_dimensions[2]),
        BUTTON_TEXT_FONT, nil,
        true, true
    )

    addRightDimensionArrow()
    addLeftDimensionArrow()

    if not boxes then error("boxes is nil") end
    table.insert(boxes, dimension_display_box)
end

local function addSettingsApplyButton(off_x, off_y)
    local window_width, window_height = love.graphics.getDimensions()
    local fullscreen_button_width = window_width / 2
    local highest_settings_button_y = window_height * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local button_x = (window_width - fullscreen_button_width) * 0.5 + (off_x or 0)
    local button_y = highest_settings_button_y + (off_y or 0)
    local text = "Apply Settings"

    settings_apply_button = button_utils.newButton(
    button_x, button_y,
    fullscreen_button_width, SETTINGS_BLOCKS_HEIGHT,
    nil, nil,
    text,
    BUTTON_TEXT_FONT, nil,
    true, true,
    nil
    )
    -- has to initialize function outside of its constructor to be able to reference itself
    settings_apply_button.on_pressed = function()
        
        ReloadScene()
        love.timer.sleep(0.25)
    end
    if not buttons then error("Buttons is nil") end
    table.insert(buttons, settings_apply_button)
end

settings_scene_module.load = function()
    buttons = {}
    boxes = {}
    addBackButton()
    addFullScreenButton()
    addAudioController(0, SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING)
    addScreenDimensionController(0, 2 * (SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING))
    addSettingsApplyButton(0, 3 * (SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING))
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