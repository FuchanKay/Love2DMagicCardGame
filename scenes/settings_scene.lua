local settings_scene_module = {}

local buttons = nil
local button_text_font = nil

settings_scene_module.load = function()
    buttons = {}
    
end

settings_scene_module.update = function(dt)

end

settings_scene_module.draw = function()

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