local combat_controller_module = {}

local Card = require "game_objects.cards.card"
local EventQueue = require "game_objects.combat.event_queue"
local Settings = require "settings"

-- constants
local EMPTY = Card.EMPTY

local DARKER_SCREEN_COLOR = {0.1, 0.1, 0.1, 0.6}
combat_controller_module.newController = function(deck, hand, draw_pile, discard_pile, enemy_screen, resource_display, spell_buttons, end_turn_button)
    local controller = {
        hand = hand, deck = deck, draw_pile = draw_pile, discard_pile = discard_pile,
        enemy_screen = enemy_screen,
        resource_display = resource_display,
        spell_buttons = spell_buttons,
        end_turn_button = end_turn_button,
    }
    controller.event_queue = EventQueue.newEventQueue()

    controller.update = function()
        controller.event_queue.update()
        if controller.hand.discard_confirm then
            controller.hand.discard_confirm = false
            controller.enemy_screen.setDim(false)
            controller.setEnemyScreenText("")
            controller.hand.discarding = false
            controller.event_queue.setPause(false)
        end
        if not controller.hand.discarding then
            for i, button in ipairs(spell_buttons) do
                button.update()
            end
        end
        controller.hand.update()
        local fight_victory = true
        for i, enemy in ipairs(controller.enemy_screen) do
            if enemy.hp > 0 then fight_victory = false end
        end
        if fight_victory then controller.enemy_screen.setText("You Win!") end
    end

    controller.draw = function()
        controller.enemy_screen.draw()
        controller.resource_display.draw()
        for i, button in ipairs(spell_buttons) do
            button.draw()
        end
        controller.hand.draw()
    end

    -- although these methods have already been implemented in these objects, its convenient to have these methods be accessible in controller
    controller.addResource = function(card_type, num)
        if num < 0 then error "num cannot be less than 0." end
        local fn = function()
            controller.resource_display.addResource(card_type, num)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.subtractResource = function(card_type, num)
        if num < 0 then error "num cannot be less than 0." end
        local fn = function()
            controller.resource_display.subtractResource(card_type, num)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.addCardToDrawPile = function(card)
        local fn = function()
            controller.draw_pile.addCard(card)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.addCardsToDrawPile = function(cards)
        local fn = function()
            controller.draw_pile.addCards(cards)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.addCardToDiscardPile = function(card)
        local fn = function()
            controller.discard_pile.addCard(card)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.addCardsToDiscardPile = function(cards)
        local fn = function()
            controller.discard_pile.addCards(cards)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.aoeUpdateHp = function(num)
        local fn = function()
            controller.enemy_screen.aoeUpdateHp(num)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.updateRandomHp = function(num)
        local fn = function()
            controller.enemy_screen.updateRandomHp(num)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.setEnemyScreenDim = function(enable)
        local fn = function()
            controller.enemy_screen.setDim(enable)
        end
        controller.event_queue.addEvent(fn)
    end

    controller.setEnemyScreenText = function(text)
        local fn = function ()
            controller.enemy_screen.setText(text)
        end
        controller.event_queue.addEvent(fn)
    end

    -- draws cards from draw pile. returns the card drawn or nil if no card is drawn
    controller.drawCard = function ()
        -- if there is space in hand
        local fn = function()
            local card = nil
            local empty_ind = nil
            for i = 1, #controller.hand do
                local c = controller.hand[i]
                if c == EMPTY then
                    empty_ind = i
                    break
                end
            end
            if not empty_ind then return end
            if #controller.draw_pile > 0 then
                card = controller.draw_pile.drawCard()
                controller.hand.addCard(card)
                card.ind = empty_ind
                card.card_effect.whenDrawn(card)
            -- if cards aren't available from draw pile and there are cards in the discard pile
            elseif #controller.discard_pile > 0 then
                -- reshuffles discard pile into draw pile and draw a card
                local cards = controller.discard_pile.reshuffle()
                controller.draw_pile.addCards(cards)
                card = controller.draw_pile.drawCard()
                controller.hand.addCard(card)
                card.ind = empty_ind
                card.card_effect.whenDrawn(card)
            end
        end
        controller.event_queue.addEvent(fn)
    end

    -- discards entire hand into discard pile
    controller.discardEntireHand = function()
        local fn = function ()        
            for i = 1, #controller.hand do
                local card = controller.hand[i]
                if card ~= EMPTY and not card.card_effect.retain then
                    controller.hand[i] = EMPTY
                    card.selected = false
                    if controller.hand.selected_card == card then controller.hand.selected_card = nil end
                    table.insert(controller.hand.discard_pile, card)
                end
            end
        end
        controller.event_queue.addEvent(fn)
    end

    controller.forceDiscardCard = function(num)
        -- TODO: make the number of non empty cards a property that updates when hand changes because having to do this every time is really tedious
        -- counts the number of non_empty_cards
        local num_of_nonempty_cards = 0
        for i, card in ipairs(controller.hand) do
            if card ~= EMPTY then
                num_of_nonempty_cards = num_of_nonempty_cards + 1
            end
        end
        -- if number of cards is less than the number of cards being force discarded, force discard entire hand
        if num_of_nonempty_cards <= num then
            local fn = function()
                for i, card in ipairs(controller.hand) do
                    if card ~= EMPTY then
                        controller.hand.discard(card)
                    end
                end
            end
            controller.event_queue.addEvent(fn)
        else
            local fn = function()
                -- if you want to call a function without adding to event, call the function from the object, not the controller functions
                controller.hand.discarding = true
                controller.hand.deselectAll()
                controller.enemy_screen.setText("Discard "..num.." cards. (Press enter to confirm)")
                controller.enemy_screen.setDim(true)
                controller.hand.select_num = num
                controller.event_queue.setPause(true)
            end
            controller.event_queue.addEvent(fn)
        end
    end
    return controller
end

return combat_controller_module