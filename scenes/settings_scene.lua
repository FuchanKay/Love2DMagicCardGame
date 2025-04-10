Settings_Scene = {}

local buttons = nil
local button_text_font = nil

Settings_Scene.load = function()
    buttons = {}
    
end

Settings_Scene.update = function(dt)

end

Settings_Scene.draw = function()

end

Settings_Scene.keyboardpressed = function(k)
    -- if k == "f" then love.filesystem.write("save.txt", "f") end
end

Settings_Scene.keyboardreleased = function(k)

end

Settings_Scene.mousepressed = function(x, y, button)

end

Settings_Scene.mousereleased = function(x, y, button)

end

return Settings_Scene