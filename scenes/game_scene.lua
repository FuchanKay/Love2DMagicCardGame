local game_scene_module = {}

local hand = nil

-- constants
local BACKGROUND_COLOR = {0.4, 0.4, 0.5, 1.0}
local WHITE = {1.0, 1.0, 1.0, 1.0}

local CARD_SIZE_SCALE = 1 / 4

game_scene_module.load = function()
    hand = HandDisplay.newHandDisplay(200, 200, CARD_SIZE_SCALE)
    HandDisplay.addCard(hand, Card.newCard(CardTypes.arcane, "A", "spam"))
    HandDisplay.addCard(hand, Card.newCard(CardTypes.arcane, "A", "spam"))
    HandDisplay.addCard(hand, Card.newCard(CardTypes.arcane, "A", "spam"))
    HandDisplay.addCard(hand, Card.newCard(CardTypes.arcane, "A", "spam"))
    HandDisplay.addCard(hand, Card.newCard(CardTypes.arcane, "A", "spam"))
end

game_scene_module.update = function(dt)

end

game_scene_module.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(BACKGROUND_COLOR)
    love.graphics.rectangle("fill", 0, 0, Settings.window_dimensions[1], Settings.window_dimensions[2])
    love.graphics.setColor(WHITE)
    HandDisplay.drawHand(hand)
end

game_scene_module.keyboardpressed = function(k)

end

game_scene_module.keyboardreleased = function(k)

end

game_scene_module.mousepressed = function(x, y, button)

end

game_scene_module.mousereleased = function(x, y, button)

end

return game_scene_module