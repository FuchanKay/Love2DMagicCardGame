local combat_controller_module = {}

local Card = require "game_objects.cards.card"
local Settings = require "settings"

-- constants
local EMPTY = Card.EMPTY

local DARKER_SCREEN_COLOR = {0.1, 0.1, 0.1, 0.2}
combat_controller_module.newController = function(deck, hand, draw_pile, discard_pile, enemy_screen, resource_display, spell_buttons, end_turn_button)
    local controller = {
        deck = deck, draw_pile = draw_pile, discard_pile = discard_pile,
        enemy_screen = enemy_screen,
        resource_display = resource_display,
        spell_buttons = spell_buttons,
        paused_for_discard = false,
        end_turn_button = end_turn_button,
    }

    -- although these methods have already been implemented in these objects, its convenient to have these methods be accessible in controller
    controller.addResource = function(card_type, num)
        if num < 0 then error "num cannot be less than 0." end
        resource_display.addResource(card_type, num)
    end

    controller.subtractResource = function(card_type, num)
        if num < 0 then error "num cannot be less than 0." end
        resource_display.subtractResource(card_type, num)
    end

    controller.addCardToDrawPile = function(card)
        draw_pile.addCard(card)
    end

    controller.addCardsToDrawPile = function(cards)
        draw_pile.addCards(cards)
    end

    controller.addCardToDiscardPile = function(card)
        discard_pile.addCard(card)
    end

    controller.addCardsToDiscardPile = function(cards)
        discard_pile.addCards(cards)
    end

    controller.aoeUpdateHp = function(num)
        enemy_screen.aoeUpdateHp(num)
    end

    controller.updateRandomHp = function(num)
        enemy_screen.updateRandomHp(num)
    end

    controller.update = function()
        hand.update()
        for i, button in ipairs(spell_buttons) do
            button.update()
        end
    end

    controller.draw = function()
        if controller.paused_for_discard then
            love.graphics.setColor(DARKER_SCREEN_COLOR)
            love.graphics.rectangle("fill", 0, 0, Settings.window_dimensions[1], Settings.window_dimensions[2])
        end
        enemy_screen.draw()
        resource_display.draw()
        for i, button in ipairs(spell_buttons) do
            button.draw()
        end
        hand.draw()
    end

    -- draws cards from draw pile. returns the card drawn or nil if no card is drawn
    controller.drawCard = function ()
        -- if there is space in hand
        local card = nil
        local empty_ind = nil
        for i = 1, #hand do
            local c = hand[i]
            if c == EMPTY then
                empty_ind = i
                break
            end
        end
        if not empty_ind then return end
        if #hand.draw_pile > 0 then
            card = hand.draw_pile.drawCard()
            hand[empty_ind] = card
            card.ind = empty_ind
            card.card_effect.whenDrawn(card)
        -- if cards aren't available from draw pile and there are cards in the discard pile
        elseif #hand.discard_pile > 0 then
            -- reshuffles discard pile into draw pile and draw a card
            local cards = hand.discard_pile.reshuffle()
            hand.draw_pile.addCards(cards)
            card = hand.draw_pile.drawCard()
            hand[empty_ind] = card
            card.ind = empty_ind
            card.card_effect.whenDrawn(card)
        end
        return card
    end

    -- discards entire hand into discard pile
    controller.discardEntireHand = function()
        for i = 1, #hand do
            local card = hand[i]
            if card ~= EMPTY and not card.card_effect.retain then
                hand[i] = EMPTY
                card.selected = false
                if hand.selected_card == card then hand.selected_card = nil end
                table.insert(hand.discard_pile, card)
            end
        end
    end

    controller.forceDiscardCard = function()

    end

    return controller
end

return combat_controller_module