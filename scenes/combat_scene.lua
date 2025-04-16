local combat_scene_module = {}

local draw_pile = nil
local discard_pile = nil
local hand = nil
local resource_display = nil

Card = require "game_objects.cards.card"
CardTypes = require "game_objects.cards.card_types"
HandDisplay = require "game_objects.cards.hand_display"
ResourceDisplay = require"game_objects.cards.resource_display"
DrawPile = require "game_objects.cards.draw_pile"
DiscardPile = require "game_objects.cards.discard_pile"

-- constants
local CARD_SIZE_SCALE = 1 / 4
local HAND_WIDTH = Settings.window_dimensions[1] / 3
local HAND_SIZE = 5

combat_scene_module.load = function()
    draw_pile = DrawPile.newDrawPile()
    discard_pile = DiscardPile.newDiscardPile()

    local hand_x = Settings.window_dimensions[1] - 200 - HAND_WIDTH
    local hand_y = 200
    hand = HandDisplay.newHandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, draw_pile, discard_pile, CARD_SIZE_SCALE)
    if not hand then error "hand is nil" end
    hand.addCard(Card.newCard(CardTypes.arcane, "A", CARD_SIZE_SCALE, "card 1 description"))
    hand.addCard(Card.newCard(CardTypes.arcane, "F", CARD_SIZE_SCALE, "card 2 description"))
    hand.addCard(Card.newCard(CardTypes.hemo, "U", CARD_SIZE_SCALE, "card 3 description"))
    hand.addCard(Card.newCard(CardTypes.holy, "M", CARD_SIZE_SCALE, "card 4 description"))
    hand.addCard(Card.newCard(CardTypes.unholy, "A", CARD_SIZE_SCALE, "card 5 description"))
    resource_display = ResourceDisplay.newResourceDisplay(0, 0, 1, 15, 20, 25, 0)
end

combat_scene_module.update = function(dt)

end

combat_scene_module.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setBackgroundColor(0.4, 0.4, 0.5)
    if not hand then error "hand is nil" end
    hand.draw()
    if not resource_display then error "resource display is nil" end
    resource_display.draw()
end

combat_scene_module.keyboardpressed = function(k)
    if k == "m" then ChangeScene("main_menu") end
end

combat_scene_module.keyboardreleased = function(k)
    if not resource_display then error "resource display is nil" end
    if k == "up" then resource_display.addResource(CardTypes.unholy, 5) end
    if k == "down" then resource_display.subtractResource(CardTypes.unholy, 1) end
end

combat_scene_module.mousepressed = function(x, y, button)

end

combat_scene_module.mousereleased = function(x, y, button)

end

return combat_scene_module