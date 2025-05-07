-- TODO: add loading scene and be able to construct this
CombatScene = Object:extend()

require "game.combat.card"
require "game.combat.combat_controller"
require "game.combat.deck"
require "game.combat.discard_pile"
require "game.combat.draw_pile"
require "game.combat.enemy_screen"
require "game.combat.enemy"
require "game.combat.event_queue"
require "game.combat.event"
require "game.combat.hand_display"
require "game.combat.resource_display"

local ArcaneCardEffects = require "game.cards.card_effects.arcane_card_effects"
local HemoCardEffects = require "game.cards.card_effects.hemo_card_effects"
local HolyCardEffects = require "game.cards.card_effects.holy_card_effects"
local UnholyCardEffects = require "game.cards.card_effects.unholy_card_effects"

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
local HAND_WIDTH = 768
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

function CombatScene:init()
    local scene = {}
    scene.load = function()
                -- TODO: implement seed stuff
        local seed = os.time()
        print(seed)
        math.randomseed(seed)
        deck = Deck()
        draw_pile = DrawPile()
        discard_pile = DiscardPile()
        deck.addCard(Card(ArcaneCardEffects.A, CARD_SIZE_SCALE))
        deck.addCard(Card(HemoCardEffects.B, CARD_SIZE_SCALE))
        deck.addCard(Card(HolyCardEffects.C, CARD_SIZE_SCALE))
        deck.addCard(Card(UnholyCardEffects.D, CARD_SIZE_SCALE))
        deck.addCard(Card(ArcaneCardEffects.F, CARD_SIZE_SCALE))
        deck.addCard(Card(HemoCardEffects.F, CARD_SIZE_SCALE))
        deck.addCard(Card(HolyCardEffects.G, CARD_SIZE_SCALE))
        deck.addCard(Card(UnholyCardEffects.H, CARD_SIZE_SCALE))
        deck.addCard(Card(ArcaneCardEffects.A, CARD_SIZE_SCALE))
        deck.addCard(Card(HemoCardEffects.B, CARD_SIZE_SCALE))
        deck.addCard(Card(HolyCardEffects.C, CARD_SIZE_SCALE))
        deck.addCard(Card(UnholyCardEffects.D, CARD_SIZE_SCALE))
        deck.addCard(Card(ArcaneCardEffects.F, CARD_SIZE_SCALE))
        deck.addCard(Card(HemoCardEffects.F, CARD_SIZE_SCALE))
        deck.addCard(Card(HolyCardEffects.G, CARD_SIZE_SCALE))
        deck.addCard(Card(UnholyCardEffects.H, CARD_SIZE_SCALE))
        draw_pile.addDeck(deck)

        local hand_x = Settings.window_dimensions[1] - 50 - HAND_WIDTH
        local hand_y = 520
        hand = HandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, draw_pile, discard_pile, CARD_SIZE_SCALE)

        local resource_display_x = 30
        local resource_display_y = 30
        resource_display = ResourceDisplay(resource_display_x, resource_display_y, 1)

        enemy_screen = EnemyScreen(COMBAT_BACKGROUND_IMG, BACKGROUND_IMG_X, BACKGROUND_IMG_Y, BACKGROUND_IMG_SCALE)
        enemy_screen.addEnemy(Enemy("skelly 1", WHITE_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))
        enemy_screen.addEnemy(Enemy("skelly 2", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))

        spells = {}
        -- table.insert(spells, Spells.fireball)
        -- table.insert(spells, Spells.arrows_of_light)

        controller = CombatController(deck, hand, draw_pile, discard_pile, enemy_screen, resource_display, spells)
        -- dont really know how to pass controller to card effects without doing this
        ArcaneCardEffects.controller = controller
        HemoCardEffects.controller = controller
        HolyCardEffects.controller = controller
        UnholyCardEffects.controller = controller
    end

    scene.update = function(dt)
        if not controller then error "controller is nil" end
        controller.update(dt)
    end
    
    scene.draw = function()
        love.graphics.setBackgroundColor(0.4, 0.4, 0.5)
        if not controller then error "controller is nil" end
        controller.draw()
    end
    
    scene.keyboardpressed = function(k)
        if k == "m" then ChangeScene("main_menu") end
    end
    
    scene.keyboardreleased = function(k)
        if not resource_display then error "resource display is nil" end
        if not controller then error "controller is nil" end
        if not draw_pile then error "draw pile is nil" end
        if not enemy_screen then error "enemy screen is nil" end
        if k == "f" then controller.drawCard() end
        if k == "g" then controller.discardEntireHand() end
        -- if k == "h" then enemy_screen.addEnemy(Enemy.newEnemy("skelly", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {})) end
        if k == "q" then draw_pile.addCard(Card(HolyCardEffects.Z, CARD_SIZE_SCALE)) end
    end
    
    scene.mousepressed = function(x, y, button)
    
    end
    
    scene.mousereleased = function(x, y, button)
    
    end

    return scene
end