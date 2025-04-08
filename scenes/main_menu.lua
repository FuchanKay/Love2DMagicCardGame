MainMenu = {}

MainMenu.load = function()
    
end

MainMenu.update = function(dt)

end

MainMenu.draw = function(dt)
    
end

MainMenu.keyboardpressed = function(k)
    if k == "f" then love.filesystem.write("save.txt", "f") end
    if k == "escape" then love.event.quit() end
end

MainMenu.keyboardreleased = function(k)

end

MainMenu.mousepressed = function(x, y, button)

end

MainMenu.mousereleased = function(x, y, button, istouch, presses)

end

return MainMenu