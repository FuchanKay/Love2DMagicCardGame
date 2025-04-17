-- TODO: add loading scene and be able to construct this
local combat_scene_module = {}

local deck = nil
local draw_pile = nil
local discard_pile = nil
local hand = nil
local resource_display = nil

local arcaneCardEffects = require "game_objects.cards.card_effects.arcane_card_effects"
local hemoCardEffects = require "game_objects.cards.card_effects.hemo_card_effects"
local holyCardEffects = require "game_objects.cards.card_effects.holy_card_effects"
local unholyCardEffects = require "game_objects.cards.card_effects.unholy_card_effects"

-- constants
local CARD_SIZE_SCALE = 1 / 5
local HAND_WIDTH = Settings.window_dimensions[1] / 2
local HAND_SIZE = 6

local COMBAT_BACKGROUND_IMG = love.graphics.newImage("res/images/backgrounds/combat_background_1.png")
local BACKGROUND_IMG_X = 720
local BACKGROUND_IMG_Y = 20
local BACKGROUND_IMG_SCALE = 2.25
local BACKGROUND_IMG_WIDTH = COMBAT_BACKGROUND_IMG:getWidth() * BACKGROUND_IMG_SCALE
local BACKGROUND_IMG_HEIGHT = COMBAT_BACKGROUND_IMG:getHeight() * BACKGROUND_IMG_SCALE

local BLACK_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/sample_skeleton_enemy_black.png")
local WHITE_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/sample_skeleton_enemy_white.png")
local SKELETON_SCALE = 0.02
local SKELETON_WIDTH = BLACK_SKELETON_ENEMY_IMG:getWidth() * SKELETON_SCALE
local SKELETON_HEIGHT = BLACK_SKELETON_ENEMY_IMG:getHeight() * SKELETON_SCALE

combat_scene_module.load = function()
    local seed = os.time()
    print(seed)
    math.randomseed(seed)
    deck = Deck.newDeck()
    draw_pile = DrawPile.newDrawPile()
    discard_pile = DiscardPile.newDiscardPile()
    deck.addCard(Card.newCard(arcaneCardEffects.A, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(arcaneCardEffects.F, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(hemoCardEffects.U, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(holyCardEffects.M, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(unholyCardEffects.A, CARD_SIZE_SCALE))
    draw_pile.addDeck(deck)
    local hand_x = Settings.window_dimensions[1] - 50 - HAND_WIDTH
    local hand_y = 550
    hand = HandDisplay.newHandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, draw_pile, discard_pile, CARD_SIZE_SCALE)
    if not hand then error "hand is nil" end
    local resource_display_x = 30
    local resource_display_y = 30
    resource_display = ResourceDisplay.newResourceDisplay(resource_display_x, resource_display_y, 1)
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
    love.graphics.draw(COMBAT_BACKGROUND_IMG, BACKGROUND_IMG_X, BACKGROUND_IMG_Y, 0, BACKGROUND_IMG_SCALE, BACKGROUND_IMG_SCALE)
    love.graphics.draw(BLACK_SKELETON_ENEMY_IMG, BACKGROUND_IMG_X + BACKGROUND_IMG_WIDTH / 4 - SKELETON_WIDTH / 2, BACKGROUND_IMG_Y + BACKGROUND_IMG_HEIGHT / 2, 0, SKELETON_SCALE, SKELETON_SCALE)
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
    if k == "f" then hand.discardEntireHand() end
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