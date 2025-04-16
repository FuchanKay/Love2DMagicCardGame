local combat_scene_module = {}

local hand = nil

-- constants
local BACKGROUND_COLOR = {0.4, 0.4, 0.5, 1.0}
local WHITE = {1.0, 1.0, 1.0, 1.0}

local CARD_SIZE_SCALE = 1 / 4

combat_scene_module.load = function()
    hand = HandDisplay.newHandDisplay(200, 200, CARD_SIZE_SCALE)
    if not hand then error "hand is nil" end
    hand.addCard(Card.newCard(CardTypes.arcane, "A", CARD_SIZE_SCALE, "card 1 description"))
    hand.addCard(Card.newCard(CardTypes.arcane, "F", CARD_SIZE_SCALE, "card 2 description"))
    hand.addCard(Card.newCard(CardTypes.hemo, "U", CARD_SIZE_SCALE, "card 3 description"))
    hand.addCard(Card.newCard(CardTypes.holy, "M", CARD_SIZE_SCALE, "card 4 description"))
    hand.addCard(Card.newCard(CardTypes.unholy, "A", CARD_SIZE_SCALE, "card 5 description"))
end

combat_scene_module.update = function(dt)

end

combat_scene_module.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(BACKGROUND_COLOR)
    love.graphics.rectangle("fill", 0, 0, Settings.window_dimensions[1], Settings.window_dimensions[2])
    love.graphics.setColor(WHITE)
    HandDisplay.drawHand(hand)
end

combat_scene_module.keyboardpressed = function(k)
    if k == "m" then ChangeScene("main_menu") end
end

combat_scene_module.keyboardreleased = function(k)

end

combat_scene_module.mousepressed = function(x, y, button)

end

combat_scene_module.mousereleased = function(x, y, button)

end

return combat_scene_module