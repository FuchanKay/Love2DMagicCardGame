local game_scene_module = {}

local card_img = nil
local card = require "game_objects.cards.card"
game_scene_module.load = function()
    card_img = love.graphics.newImage("res/images/cards/rune_card_hd.png")
end

game_scene_module.update = function(dt)

end

local WHITE = {1.0, 1.0, 1.0, 1.0}
game_scene_module.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(WHITE)
    love.graphics.draw(card_img, 0, 100)
end

game_scene_module.keyboardpressed = function(k)
    if k == "m" then
        ChangeScene("main_menu")
    end
    if k == "p" then
        print(game_scene_module.loaded)
    end
end

game_scene_module.keyboardreleased = function(k)

end

game_scene_module.mousepressed = function(x, y, button)

end

game_scene_module.mousereleased = function(x, y, button)

end

return game_scene_module