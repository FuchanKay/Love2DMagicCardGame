local hand_display_module = {}

local Colors = require "libraries.luacolors"

local RED_CARD_IMG = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")
local GREY_BLANK_CARD_IMG = love.graphics.newImage("res/images/cards/gray_blank_rune_card_hd.png")
-- constants
-- for sprites
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 30)

hand_display_module.newHandDisplay = function(x, y, width, size, draw_pile, discard_pile, card_scale)
    local hand = {
        x = x, y = y, width = width,
        size = size,
        draw_pile = draw_pile, discard_pile = discard_pile,
        card_scale = card_scale,
        selected_card = nil, selected_cards = {},
        selecting_multiple = false
    }

    local left_input_now = false
    local left_input_late = false
    local right_input_now = false
    local right_input_late = false

    -- draw as in drawing sprites, not drawing cards
    hand.draw = function()
        local spacing = hand.width / hand.size
        love.graphics.setColor(Colors.gray)
        for i = 1, hand.size do
            local card_x =  hand.x + (i - 1) * spacing
            love.graphics.draw(GREY_BLANK_CARD_IMG, card_x, hand.y, 0, hand.card_scale, hand.card_scale)
        end
        for i, card in ipairs(hand) do
            local card_x = hand.x + (i - 1) * spacing
            if not hand.selecting_multiple then
                if hand.selected_card ~= card then card.selected = false end
                card.x = card_x
                card.y = hand.y

                card.update()
                if not card.selected then card.draw() end

                if card.selected then
                    hand.selected_card = card
                end
            else
                card.x = card_x
                card.y = hand.y
                card.update()
                if not card.selected then card.draw() end
                if card.selected then
                    table.insert(hand.selected_cards, card)
                end
            end
        end

        if hand.selected_card then hand.selected_card.draw() end
        for i, card in ipairs(hand.selected_cards) do
            card.draw()
        end
        -- for inputs where it should not trigger multiple times for holding it down,
        -- create boolean variables now and late and set late to now before checking whether the key is down.
        -- if now is true and late is false then trigger
        left_input_late = left_input_now
        right_input_late = right_input_now
        left_input_now = love.keyboard.isDown("left")
        right_input_now = love.keyboard.isDown("right")

        if hand.selected_card then
            hand.selected_card.description_box.draw()
            if left_input_now and not left_input_late and hand.selected_card.ind > 1 then
                hand.selected_card.selected = false
                hand.selected_card = hand[hand.selected_card.ind - 1]
                hand.selected_card.selected = true
            end
            if right_input_now and not right_input_late and hand.selected_card.ind < #hand then
                hand.selected_card.selected = false
                hand.selected_card = hand[hand.selected_card.ind + 1]
                hand.selected_card.selected = true
            end
        end
        local draw_pile_num = #hand.draw_pile
        local discard_pile_num = #hand.discard_pile
        love.graphics.setColor(Colors.white)
        love.graphics.print("Draw Pile: "..draw_pile_num, FONT, 30, 130)
        love.graphics.print("Discard Pile: "..discard_pile_num, FONT, 30, 230)
    end

    -- draws cards from draw pile. num cannot be negative or 0
    hand.drawCards = function (num)
        if num <= 0 then error "num cannto be negative or 0" end
        for i = 1, num do
            -- if there is space in hand
            if #hand < hand.size then
                -- if cards are available from draw pile
                if #hand.draw_pile > 0 then
                    local card = hand.draw_pile.drawCard()
                    table.insert(hand, card)
                    card.ind = #hand
                -- if cards aren't available from draw pile and there are cards in the discard pile
                elseif #hand.discard_pile > 0 then
                    -- reshuffles discard pile into draw pile and draw a card
                    local cards = hand.discard_pile.reshuffle()
                    hand.draw_pile.addCards(cards)
                    local card = hand.draw_pile.drawCard()
                    table.insert(hand, card)
                    card.ind = #hand
                -- if draw pile or discard pile have no cards
                else
                    return
                end
            -- if hand is full, stop drawing
            else
                return
            end
        end
    end

    -- discards entire hand into discard pile
    hand.discardEntireHand = function()
        for i = 1, #hand do
            local removed = table.remove(hand, 1)
            if removed == hand.selected_card then
                hand.selected_card.selected = false
                hand.selected_card = nil
            end
            table.insert(hand.discard_pile, removed)
        end
    end

    hand.forceDiscardCards = function(num)

    end

    hand.deselectAll = function()
        hand.selected_card = nil
        hand.selected_cards = {}
        for i, card in ipairs(hand) do
            card.selected = false
        end
    end
    return hand
end
return hand_display_module