function love.load()
    anim8 = require 'libraries.anim8'
    Settings = require 'settings'
    love.window.setTitle(Settings.title);
    love.window.setMode(Settings.windowWidth, Settings.windowHeight)
    Scenes = {}
    Scenes.mainMenu = require 'scenes.main_menu'
    CurrentScene = Scenes.mainMenu
    CurrentScene.load()
end

function love.update(dt)
    CurrentScene.update(dt)
end

function love.draw()
    CurrentScene.draw()
end

function love.keypressed(k)
    -- relaunches the game when r is pressed
    if k == "escape" then love.event.quit() end
    if k == "r" then love.event.quit "restart" end
    CurrentScene.keyboardpressed(k)
end

function love.keyreleased(k)
    CurrentScene.keyboardreleased(k)
end

function love.mousepressed(x, y, button)
    CurrentScene.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    CurrentScene.mousereleased(x, y, button)
end 