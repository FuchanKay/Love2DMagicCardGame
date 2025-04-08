local settings = require 'settings'
function love.load()
    anim8 = require 'libraries.anim8'
    love.window.setTitle(settings.title);
    love.window.setMode(settings.windowWidth, settings.windowHeight)
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
    if k == "r" then love.event.quit "restart" end
    CurrentScene.keyboardpressed(k)
end

function love.keyreleased(k)
    CurrentScene.keyboardreleased(k)
end

function love.mousepressed(x, y, button)
    MouseX = x
    MouseY = y
    CurrentScene.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button, istouch, presses)
    CurrentScene.mousereleased(x, y, button, istouch, presses)
end