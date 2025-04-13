local game_scene_module = {}

local card_img = nil

local sample_card = nil
game_scene_module.load = function()
    sample_card = Card.newCard(CardTypes.unholy, "A", "gibberish")
end

game_scene_module.update = function(dt)

end

local WHITE = {1.0, 1.0, 1.0, 1.0}
game_scene_module.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(WHITE)
    Card.drawCard(sample_card, 50, 50, 0.5, 0.5)
end

game_scene_module.keyboardpressed = function(k)
    if k == "m" then
        ChangeScene("main_menu")
    end
end

game_scene_module.keyboardreleased = function(k)

end

game_scene_module.mousepressed = function(x, y, button)

end

game_scene_module.mousereleased = function(x, y, button)

end

return game_scene_module