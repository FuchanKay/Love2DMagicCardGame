local scenes = {}
local current_scene = nil


Colors = require "libraries.luacolors"
require "engine.object"
require "settings"
require "game"
require "globals"
require "game.ui"
require "scenes.main_menu"
require "scenes.settings_scene"
require "scenes.combat_scene"
require "game.combat.card"
require "game.combat.combat_controller"
require "game.combat.deck"
require "game.combat.discard_pile"
require "game.combat.draw_pile"
require "game.combat.enemy_screen"
require "game.combat.enemy"
require "game.combat.event_queue"
require "game.combat.event"
require "game.combat.hand_display"
require "game.combat.resource_display"
Game()

love.window.setTitle(Settings.title);
-- Settings.window_dimensions[1], Settings.window_dimensions[2] = love.window.getDesktopDimensions()
love.window.setMode(Settings.window_dimensions[1], Settings.window_dimensions[2])
love.window.setFullscreen(Settings.fullscreen)

Scenes = {
    main_menu = MainMenu(),
    settings = SettingsScene(),
    combat = CombatScene(),
}
-- adds scenes from /scenes
current_scene = Scenes.main_menu

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
    current_scene = Scenes[nextScene]
    current_scene.load()
    
end

function ReloadScene()
    current_scene.load()
end
