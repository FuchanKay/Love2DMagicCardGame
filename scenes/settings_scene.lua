local settings_scene_module = {}

local Settings = require "settings"
local Button = require "game_objects.ui.button"
local Box = require "game_objects.ui.box"
local Colors = require "libraries.luacolors"

local buttons = nil
local boxes = nil

local fullscreen_updated = false
local master_audio_level_updated = false
local window_dimension_updated = false

local late_fullscreen = Settings.fullscreen
local late_master_audio_level = Settings.master_audio_level
local late_window_dimensions = Settings.window_dimensions

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
local WINDOW_WIDTH, WINDOW_HEIGHT = 1536, 864
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

local APPLY_BUTTON_UPDATED_COLOR = {0.6, 0.6, 0.7, 1.0}
-- bluish grey
local DEFAULT_BUTTON_COLOR = {0.4, 0.4, 0.5, 1.0}
-- Colors.white
local DEFAULT_HOT_COLOR = {0.8, 0.8, 0.9, 1.0}

local function updateApplyButton()
    if not settings_apply_button then error("settings apply button is nil") end
    if fullscreen_updated or window_dimension_updated or master_audio_level_updated then
        settings_apply_button.default_color = APPLY_BUTTON_UPDATED_COLOR
        settings_apply_button.hot_color = DEFAULT_HOT_COLOR
    else
        settings_apply_button.default_color = DEFAULT_BUTTON_COLOR
        settings_apply_button.hot_color = DEFAULT_BUTTON_COLOR
    end
end

local function addFullScreenButton(off_x, off_y)
    local fullscreen_button_width = WINDOW_WIDTH / 2
    local highest_settings_button_y = WINDOW_HEIGHT * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local button_x = (WINDOW_WIDTH - fullscreen_button_width) * 0.5 + (off_x or 0)
    local button_y = highest_settings_button_y + (off_y or 0)
    local text = nil
    if Settings.fullscreen then text = "FullScreen" end
    if not Settings.fullscreen then text = "Windowed" end

    full_screen_button = Button.newButton(
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
        Settings.fullscreen = not Settings.fullscreen
        if Settings.fullscreen then full_screen_button.text = "FullScreen"
        else full_screen_button.text = "Windowed" end

        if Settings.fullscreen ~= late_fullscreen then fullscreen_updated = true
        else fullscreen_updated = false end
        updateApplyButton()
    end
    if not buttons then error("buttons is nil") end
    table.insert(buttons, full_screen_button)
end

local BACK_BUTTON_X, BACK_BUTTON_Y = 64, 64
local BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT = 128, 96
local function addBackButton(off_x, off_y)
    back_button = Button.newButton(
    BACK_BUTTON_X + (off_x or 0), BACK_BUTTON_Y + (off_y or 0),
    BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT,
    nil, nil,
    "back",
    BUTTON_TEXT_FONT, nil,
    true, true,
    function ()
        Settings.fullscreen = late_fullscreen
        Settings.master_audio_level = late_master_audio_level
        Settings.window_dimensions = late_window_dimensions
        ChangeScene("main_menu")
    end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, back_button)
end

local function addLeftAudioArrow()
    local audio_arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not audio_level_display_box then error("audio level display box is nil") end
    local button_x = audio_level_display_box.x - audio_arrow_width - audio_controller_spacing
    local button_y = audio_level_display_box.y

    left_audio_arrow_button = Button.newButton(
        button_x, button_y,
        audio_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        "<",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            Settings.master_audio_level = Settings.master_audio_level - AUDIO_INCREMENT
            if Settings.master_audio_level < 0 then
                Settings.master_audio_level = 0
            end
            if Settings.master_audio_level ~= late_master_audio_level then master_audio_level_updated = true
            else master_audio_level_updated = false end
            audio_level_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
            updateApplyButton()
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, left_audio_arrow_button)
end

local function addRightAudioArrow()
    local audio_arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not audio_level_display_box then error("audio level display box is nil") end
    local button_x = audio_level_display_box.x + audio_level_display_box.width + audio_controller_spacing
    local button_y = audio_level_display_box.y

    right_audio_arrow_button = Button.newButton(
        button_x, button_y,
        audio_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        ">",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            Settings.master_audio_level = Settings.master_audio_level + AUDIO_INCREMENT
            if Settings.master_audio_level > MAX_AUDIO then
                Settings.master_audio_level = MAX_AUDIO
            end
            if Settings.master_audio_level ~= late_master_audio_level then master_audio_level_updated = true
            else master_audio_level_updated = false end
            audio_level_display_box.text = "Master Audio: "..tostring(Settings.master_audio_level)
            updateApplyButton()
        end
    )

    if not buttons then error "buttons is nil" end
    table.insert(buttons, right_audio_arrow_button)
end

local function addAudioController(off_x, off_y)
    local audio_arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local audio_controller_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    local audio_display_box_width = (WINDOW_WIDTH / 2) - 2 * (audio_arrow_width + audio_controller_spacing)
    local highest_settings_block_y = WINDOW_HEIGHT * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local box_x = (WINDOW_WIDTH - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)

    audio_level_display_box = Box.newBox(
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
    local dimension_arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local dimension_controller_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not dimension_display_box then error("dimension display box is nil") end
    local button_x = dimension_display_box.x - dimension_arrow_width - dimension_controller_spacing
    local button_y = dimension_display_box.y

    left_dimension_arrow_button = Button.newButton(
        button_x, button_y,
        dimension_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        "<",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            screen_res_ind = screen_res_ind - 1
            if screen_res_ind < 1 then screen_res_ind = 1 end
            Settings.window_dimensions = SCREEN_RESOLUTIONS[screen_res_ind]
            
            if Settings.window_dimensions[1] ~= late_window_dimensions[1] or
            Settings.window_dimensions[2] ~= late_window_dimensions[2]
            then window_dimension_updated = true
            else window_dimension_updated = false end
            dimension_display_box.text = "Res: "..tostring(Settings.window_dimensions[1]).."x"..tostring(Settings.window_dimensions[2])
            updateApplyButton()
        end
    )
    if not buttons then error("buttons is nil") end
    table.insert(buttons, left_dimension_arrow_button)
end

local function addRightDimensionArrow()
    local dimension_arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local dimension_controller_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    if not dimension_display_box then error("dimension display box is nil") end
    local button_x = dimension_display_box.x + dimension_display_box.width + dimension_controller_spacing
    local button_y = dimension_display_box.y

    right_dimension_arrow_button = Button.newButton(
        button_x, button_y,
        dimension_arrow_width, SETTINGS_BLOCKS_HEIGHT,
        nil, nil,
        ">",
        BUTTON_TEXT_FONT, nil,
        true, true,
        function()
            screen_res_ind = screen_res_ind + 1
            if screen_res_ind > NUM_OF_SCREEN_RESOLUTIONS then screen_res_ind = NUM_OF_SCREEN_RESOLUTIONS end
            Settings.window_dimensions = SCREEN_RESOLUTIONS[screen_res_ind]
            if Settings.window_dimensions[1] ~= late_window_dimensions[1] or
            Settings.window_dimensions[2] ~= late_window_dimensions[2]
            then window_dimension_updated = true
            else window_dimension_updated = false end
            dimension_display_box.text = "Res: "..tostring(Settings.window_dimensions[1]).."x"..tostring(Settings.window_dimensions[2])
            updateApplyButton()
        end
    )

    if not buttons then error("buttons is nil") end
    table.insert(buttons, right_dimension_arrow_button)
end

local addScreenDimensionController = function(off_x, off_y)
    local arrow_width = WINDOW_WIDTH * CONTROLLER_ARROW_WIDTH_SCREEN_FACTOR
    local arrow_spacing = WINDOW_WIDTH * CONTROLLER_ARROW_SPACING_SCREEN_FACTOR
    local audio_display_box_width = (WINDOW_WIDTH / 2) - 2 * (arrow_width + arrow_spacing)

    local highest_settings_block_y = WINDOW_HEIGHT / 5
    local box_x = (WINDOW_WIDTH - audio_display_box_width) / 2 + (off_x or 0)
    local box_y = highest_settings_block_y + (off_y or 0)

    dimension_display_box = Box.newBox(
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
    local fullscreen_button_width = WINDOW_WIDTH / 2
    local highest_settings_button_y = WINDOW_HEIGHT * SETTINGS_BLOCK_HIGHEST_SCREEN_FACTOR
    local button_x = (WINDOW_WIDTH - fullscreen_button_width) * 0.5 + (off_x or 0)
    local button_y = highest_settings_button_y + (off_y or 0)
    local text = "Apply Settings"

    settings_apply_button = Button.newButton(
    button_x, button_y,
    fullscreen_button_width, SETTINGS_BLOCKS_HEIGHT,
    DEFAULT_BUTTON_COLOR, DEFAULT_BUTTON_COLOR,
    text,
    BUTTON_TEXT_FONT, nil,
    true, true,
    nil
    )
    -- has to initialize function outside of its constructor to be able to reference itself
    settings_apply_button.on_pressed = function()
        if fullscreen_updated or window_dimension_updated or master_audio_level_updated then
            late_fullscreen = Settings.fullscreen
            late_master_audio_level = Settings.master_audio_level
            late_window_dimensions = Settings.window_dimensions
            fullscreen_updated = false
            window_dimension_updated = false
            master_audio_level_updated = false
            if not Settings.fullscreen then 
                love.window.setFullscreen(Settings.fullscreen)
                love.window.setMode(Settings.window_dimensions[1], Settings.window_dimensions[2])
            else
                love.window.setFullscreen(Settings.fullscreen)
            end
            ReloadScene()
            love.timer.sleep(0.25)
        end
    end
    if not buttons then error("Buttons is nil") end
    table.insert(buttons, settings_apply_button)
end

settings_scene_module.load = function()
    love.graphics.setBackgroundColor(Colors.black)
    buttons = {}
    boxes = {}
    addBackButton()
    addFullScreenButton()
    addAudioController(0, SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING)
    addScreenDimensionController(0, 2 * (SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING))
    addSettingsApplyButton(0, 3 * (SETTINGS_BLOCKS_HEIGHT + SETTINGS_BLOCKS_SPACING))
end

settings_scene_module.update = function(dt)
    if not buttons then error "buttons is nil" end
    for i, button in ipairs(buttons) do
        button.update()
    end
end

settings_scene_module.draw = function()
    if not buttons then error "buttons is nil" end
    for i, button in ipairs(buttons) do
        button.update()
        button.draw()
    end
    if not boxes then error "boxes is nil" end
    for i, box in ipairs(boxes) do
        box.draw()
    end
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