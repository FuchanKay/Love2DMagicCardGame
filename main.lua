local scenes = {}
local current_scene = nil

-- window setup
local Settings = require 'settings'
love.window.setTitle(Settings.title);
Settings.window_dimensions[1], Settings.window_dimensions[2] = love.window.getDesktopDimensions()
love.window.setMode(Settings.window_dimensions[1], Settings.window_dimensions[2])
love.window.setFullscreen(Settings.fullscreen)

-- play sound effects from here
-- automatically sets volume before playing
local SoundEffects = require 'sound.sound_effects'

-- ui
local Button = require "game_objects.ui.button"
local Box = require "game_objects.ui.box"
local Colors = require "libraries.luacolors"

-- game mechanics
local Card = require "game_objects.cards.card"
local CardTypes = require "game_objects.cards.card_types"
local HandDisplay = require "game_objects.cards.hand_display"
local ResourceDisplay = require"game_objects.cards.resource_display"
local Deck = require "game_objects.cards.deck"
local DrawPile = require "game_objects.cards.draw_pile"
local DiscardPile = require "game_objects.cards.discard_pile"
-- adds scenes from /scenes
current_scene = require "scenes.main_menu"

function love.load()
    -- checks whether .funcion is not nil before calling
    if not current_scene.loaded and current_scene.load then current_scene.load() end
end

function love.update(dt)
    -- relaunches the game when r is pressed
    if love.keyboard.isDown("lctrl") and love.keyboard.isDown("r") then love.event.quit "restart" end
    if current_scene.update then current_scene.update(dt) end
end

function love.draw()
    if current_scene.draw then current_scene.draw() end
end

function love.keypressed(k)
    -- exits game when esc is pressed no matter what scene
    -- if k == "escape" then love.event.quit() end
    if current_scene.keyboardpressed then current_scene.keyboardpressed(k) end
end

function love.keyreleased(k)
    if current_scene.keyboardreleased then current_scene.keyboardreleased(k) end
end

function love.mousepressed(x, y, button)
    if current_scene.mousepressed then current_scene.mousepressed(x, y, button) end
end

function love.mousereleased(x, y, button)
    if current_scene.mousereleased then current_scene.mousereleased(x, y, button) end
end

function ChangeScene(nextScene)
    current_scene = require("scenes/"..nextScene)
    current_scene.load()
end

function ReloadScene()
    current_scene.load()
end