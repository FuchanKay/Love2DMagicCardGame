local combat_scene_module = {}

local deck = nil
local draw_pile = nil
local discard_pile = nil
local hand = nil
local resource_display = nil

Card = require "game_objects.cards.card"
CardTypes = require "game_objects.cards.card_types"
HandDisplay = require "game_objects.cards.hand_display"
ResourceDisplay = require"game_objects.cards.resource_display"
Deck = require "game_objects.cards.deck"
DrawPile = require "game_objects.cards.draw_pile"
DiscardPile = require "game_objects.cards.discard_pile"

local arcaneCardEffects = require "game_objects.cards.card_effects.arcane_card_effects"
local hemoCardEffects = require "game_objects.cards.card_effects.hemo_card_effects"
local holyCardEffects = require "game_objects.cards.card_effects.holy_card_effects"
local unholyCardEffects = require "game_objects.cards.card_effects.unholy_card_effects"

-- constants
local CARD_SIZE_SCALE = 1 / 5
local HAND_WIDTH = Settings.window_dimensions[1] / 3
local HAND_SIZE = 5

combat_scene_module.load = function()
    math.randomseed(os.time())
    deck = Deck.newDeck()
    draw_pile = DrawPile.newDrawPile()
    discard_pile = DiscardPile.newDiscardPile()
    deck.addCard(Card.newCard(arcaneCardEffects.A, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(arcaneCardEffects.F, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(hemoCardEffects.U, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(holyCardEffects.M, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(unholyCardEffects.A, CARD_SIZE_SCALE))
    draw_pile.addDeck(deck)
    local hand_x = Settings.window_dimensions[1] - 200 - HAND_WIDTH
    local hand_y = 200
    hand = HandDisplay.newHandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, draw_pile, discard_pile, CARD_SIZE_SCALE)
    if not hand then error "hand is nil" end

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
    if not hand then error "hand is nil" end
    if not draw_pile then error "draw pile is nil" end
    if k == "up" then resource_display.addResource(CardTypes.unholy, 5) end
    if k == "down" then resource_display.subtractResource(CardTypes.unholy, 1) end
    if k == "d" then hand.drawCards(1) end
    if k == "f" then hand.discardHand() end
    if k == "p" then
        print(hand.draw_pile[1])
    end
    if k == "a" then draw_pile.addCard(Card.newCard(holyCardEffects.Z, CARD_SIZE_SCALE)) end
end

combat_scene_module.mousepressed = function(x, y, button)

end

combat_scene_module.mousereleased = function(x, y, button)

end

return combat_scene_module