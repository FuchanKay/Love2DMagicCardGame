local scenes = {}
local current_scene = nil
Settings = require 'settings'
love.window.setTitle(Settings.title);
love.window.setMode(Settings.windowWidth, Settings.windowHeight)
scenes.mainMenu = require 'scenes.main_menu'
scenes.gameScene = require 'scenes.game_scene'
current_scene = scenes.mainMenu
function love.load()
    if current_scene.load then current_scene.load() end
end

function love.update(dt)
    if current_scene.update then current_scene.update(dt) end
end

function love.draw()
    if current_scene.draw then current_scene.draw() end
end

function love.keypressed(k)
    -- exits game when esc is pressed no matter what scene
    if k == "escape" then love.event.quit() end
    -- relaunches the game when r is pressed
    if k == "r" then love.event.quit "restart" end
    if current_scene.keypressed then current_scene.keyboardpressed(k) end
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
