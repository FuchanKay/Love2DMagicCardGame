-- TODO: add loading scene and be able to construct this
local combat_scene_module = {}

local Settings = require "settings"
local Deck = require "game_objects.cards.deck"
local DrawPile = require "game_objects.cards.draw_pile"
local DiscardPile = require "game_objects.cards.discard_pile"
local Card = require "game_objects.cards.card"
local HandDisplay = require "game_objects.cards.hand_display"
local ResourceDisplay = require "game_objects.cards.resource_display"
local CardTypes = require "game_objects.cards.card_types"
local EnemyScreen = require "game_objects.combat.enemy_screen"
local Enemy = require "game_objects.combat.enemy"
local Button = require "game_objects.ui.button"
local Controller = require "game_objects.combat.combat_controller"
local Spells = require "game_objects.spells.spells"

local ArcaneCardEffects = require "game_objects.cards.card_effects.arcane_card_effects"
local HemoCardEffects = require "game_objects.cards.card_effects.hemo_card_effects"
local HolyCardEffects = require "game_objects.cards.card_effects.holy_card_effects"
local UnholyCardEffects = require "game_objects.cards.card_effects.unholy_card_effects"

local deck = nil
local draw_pile = nil
local discard_pile = nil
local hand = nil
local resource_display = nil
local enemy_screen = nil
local spells = nil
local controller = nil
local confirm_button = nil

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

local BLACK_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/skeleton_enemy_black.png")
local WHITE_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/skeleton_enemy_white.png")
local SKELETON_SCALE = 0.2
local SKELETON_WIDTH = BLACK_SKELETON_ENEMY_IMG:getWidth() * SKELETON_SCALE
local SKELETON_HEIGHT = BLACK_SKELETON_ENEMY_IMG:getHeight() * SKELETON_SCALE

combat_scene_module.load = function()
    -- TODO: implement seed stuff
    local seed = os.time()
    print(seed)
    math.randomseed(seed)
    deck = Deck.newDeck()
    draw_pile = DrawPile.newDrawPile()
    discard_pile = DiscardPile.newDiscardPile()
    deck.addCard(Card.newCard(ArcaneCardEffects.A, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HemoCardEffects.B, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HolyCardEffects.C, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(UnholyCardEffects.D, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(ArcaneCardEffects.E, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HemoCardEffects.F, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HolyCardEffects.G, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(UnholyCardEffects.H, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(ArcaneCardEffects.A, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HemoCardEffects.B, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HolyCardEffects.C, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(UnholyCardEffects.D, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(ArcaneCardEffects.E, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HemoCardEffects.F, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(HolyCardEffects.G, CARD_SIZE_SCALE))
    deck.addCard(Card.newCard(UnholyCardEffects.H, CARD_SIZE_SCALE))
    draw_pile.addDeck(deck)

    local hand_x = Settings.window_dimensions[1] - 50 - HAND_WIDTH
    local hand_y = 550
    hand = HandDisplay.newHandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, draw_pile, discard_pile, CARD_SIZE_SCALE)

    local resource_display_x = 30
    local resource_display_y = 30
    resource_display = ResourceDisplay.newResourceDisplay(resource_display_x, resource_display_y, 1)

    enemy_screen = EnemyScreen.newScreen(COMBAT_BACKGROUND_IMG, BACKGROUND_IMG_X, BACKGROUND_IMG_Y, BACKGROUND_IMG_SCALE)
    enemy_screen.addEnemy(Enemy.newEnemy("skelly 1", WHITE_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))
    enemy_screen.addEnemy(Enemy.newEnemy("skelly 2", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))

    spells = {}
    table.insert(spells, Spells.fire_ball)

    controller = Controller.newController(deck, hand, draw_pile, discard_pile, enemy_screen, resource_display, spells, nil)
    Spells.controller = controller
    -- dont really know how to pass controller to card effects without doing this
    ArcaneCardEffects.controller = controller
    HemoCardEffects.controller = controller
    HolyCardEffects.controller = controller
    UnholyCardEffects.controller = controller

end

combat_scene_module.update = function(dt)
    if not controller then error "controller is nil" end
    controller.update()
end

combat_scene_module.draw = function()
    love.graphics.setBackgroundColor(0.4, 0.4, 0.5)
    if not controller then error "controller is nil" end
    controller.draw()
end

combat_scene_module.keyboardpressed = function(k)
    if k == "m" then ChangeScene("main_menu") end
end

combat_scene_module.keyboardreleased = function(k)
    if not resource_display then error "resource display is nil" end
    if not controller then error "controller is nil" end
    if not draw_pile then error "draw pile is nil" end
    if not enemy_screen then error "enemy screen is nil" end
    if k == "up" then resource_display.addResource(CardTypes.unholy, 5) end
    if k == "down" then resource_display.subtractResource(CardTypes.unholy, 1) end
    if k == "f" then controller.drawCard() end
    if k == "g" then controller.discardEntireHand() end
    -- if k == "h" then enemy_screen.addEnemy(Enemy.newEnemy("skelly", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {})) end
    if k == "q" then draw_pile.addCard(Card.newCard(HolyCardEffects.Z, CARD_SIZE_SCALE)) end
end

combat_scene_module.mousepressed = function(x, y, button)

end

combat_scene_module.mousereleased = function(x, y, button)

end

return combat_scene_module