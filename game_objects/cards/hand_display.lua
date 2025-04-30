local hand_display_module = {}

local Colors = require "libraries.luacolors"

local RED_CARD_IMG = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")
local GREY_BLANK_CARD_IMG = love.graphics.newImage("res/images/cards/gray_blank_rune_card_hd.png")
-- constants
-- for sprites
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 30)
local CARD_WIDTH = nil

local Card = require "game_objects.cards.card"

-- table that represents no card
local EMPTY = Card.EMPTY
local SPACING = nil

hand_display_module.newHandDisplay = function(x, y, width, size, draw_pile, discard_pile, card_scale)
    local hand = {
        x = x, y = y, width = width,
        size = size,
        draw_pile = draw_pile, discard_pile = discard_pile,
        card_scale = card_scale,
        selected_cards = {},
        discarded_cards = {},
        select_num = 1,
        left_input_now = false, left_input_late = false,
        right_input_now = false, right_input_late = false,
        enter_input_now = false, enter_input_late = false,
        discarding = false, discard_confirm = false,
    }
    for i = 1, size do
        table.insert(hand, EMPTY)
    end
    CARD_WIDTH = GREY_BLANK_CARD_IMG:getWidth() * card_scale
    SPACING = hand.width / hand.size

    hand.update = function()
        -- for inputs where it should not trigger multiple times for holding it down,
        -- create boolean variables now and late and set late to now and now to key isDown before checking whether the key is down.
        -- if now is true and late is false then trigger
        hand.left_input_late = hand.left_input_now
        hand.right_input_late = hand.right_input_now
        hand.enter_input_late = hand.enter_input_now
        hand.left_input_now = love.keyboard.isDown("left") or love.keyboard.isDown("a")
        hand.right_input_now = love.keyboard.isDown("right") or love.keyboard.isDown("d")
        hand.enter_input_now = love.keyboard.isDown("return")

        local can_discard = (#hand.selected_cards == hand.select_num or hand.selected_card) and hand.discarding
        if can_discard and hand.enter_input_now and not hand.enter_input_late then
            if hand.select_num == 1 then
                hand.discard(hand.selected_cards[1])
                hand.discard_confirm = true
            else
                for i = 1, #hand.selected_cards do
                    local card = table.remove(hand.selected_cards)
                    hand.discard(card)
                end
                hand.select_num = 1
                hand.discard_confirm = true
            hand.description_box.text = ""
            end
        end

        if #hand.selected_cards == 1 and hand.left_input_now and not hand.left_input_late then
            local left_card = nil
            local ind = 1
            local selected_card = hand.selected_cards[1]
            while ind < selected_card.ind do
                if hand[ind] ~= EMPTY then
                    left_card = hand[ind]
                end
                ind = ind + 1
            end
            if left_card then
                selected_card.selected = false
                selected_card.scale = selected_card.default_scale
                table.remove(hand.selected_cards)
                table.insert(hand.selected_cards, left_card)
                left_card.scale = left_card.expanded_scale
                left_card.selected = true
                hand.description_box.text = left_card.description
            end
        end
        if #hand.selected_cards == 1 and hand.right_input_now and not hand.right_input_late and hand.selected_cards[1].ind < #hand then
            local right_card = nil
            local selected_card = hand.selected_cards[1]
            local ind = selected_card.ind + 1
            while ind <= #hand do
                if hand[ind] ~= EMPTY then
                    right_card = hand[ind]
                    break
                end
                ind = ind + 1
            end
            if right_card then
                selected_card.selected = false
                selected_card.scale = selected_card.default_scale
                table.remove(hand.selected_cards)
                table.insert(hand.selected_cards, right_card)
                right_card.scale = right_card.expanded_scale
                right_card.selected = true
                hand.description_box.text = right_card.description
            end
        end

        local is_selecting_multiple = hand.select_num > 1
        for i, card in ipairs(hand) do
            local card_x = hand.x + (i - 1) * SPACING
            local is_in_selected_cards = false
            local selected_ind = 0
            for j, c in ipairs(hand.selected_cards) do
                is_in_selected_cards = c == card
                selected_ind = j
                if is_in_selected_cards then break end
            end

            if card ~= EMPTY then
                card.x = card_x
                card.y = hand.y
                card.update()
            end

            local space_available = #hand.selected_cards < hand.select_num
            if not card.selected and is_in_selected_cards then
                table.remove(hand.selected_cards, selected_ind)
            elseif card.selected and space_available and not is_in_selected_cards then
                hand.description_box.text = card.description
                table.insert(hand.selected_cards, card)
            -- -- card is selected and no more cards can be selected
            elseif card.selected and not is_in_selected_cards then
                table.insert(hand.selected_cards, card)
                hand.description_box.text = card.description
                local removed = table.remove(hand.selected_cards, 1)
                removed.selected = false
            end
        end
    end
    -- draw as in drawing sprites, not drawing cards
    hand.draw = function()
        love.graphics.setColor(Colors.white)
        for i = 1, hand.size do
            local card_x =  hand.x + (i - 1) * SPACING
            love.graphics.draw(GREY_BLANK_CARD_IMG, card_x, hand.y, 0, hand.card_scale, hand.card_scale)
        end
        for i, card in ipairs(hand) do
            local card_x = hand.x + (i - 1) * SPACING
            if card ~= EMPTY then
                -- card.scale = card.default_scale
                card.draw()
            end
            love.graphics.setFont(FONT)
            local num_width = FONT:getWidth(i)
            love.graphics.print(i, card_x + CARD_WIDTH / 2 - num_width / 2, hand.y - 40, 0, 1, 1)
        end

        -- if hand.selected_cards[#hand.selected_cards] then
        --     if not hand.selected_cards[#hand.selected_cards].description_box then error "no description box" end
        --     hand.selected_cards[#hand.selected_cards].description_box.draw()
        -- end

        local draw_pile_num = #hand.draw_pile
        local discard_pile_num = #hand.discard_pile
        love.graphics.setColor(Colors.white)
        love.graphics.print("Draw Pile: "..draw_pile_num, FONT, 30, 130)
        love.graphics.print("Discard Pile: "..discard_pile_num, FONT, 30, 230)
    end

    hand.deselectAll = function()
        hand.selected_cards = {}
        for i, card in ipairs(hand) do
            card.selected = false
        end
    end

    hand.addCard = function(card)
        local empty_ind = 0
        for i, c in ipairs(hand) do
            if c == EMPTY then
                empty_ind = i
                break
            end
        end
        if empty_ind ~= 0 then
            local card_x = hand.x + (empty_ind - 1) * SPACING
            card.x = card_x
            card.y = hand.y
            hand[empty_ind] = card
        end
    end

    hand.discard = function(card)
        -- TODO: implement when discarded functions
        -- card.card_effect.whenDiscarded(card)
        for i, c in ipairs(hand) do
            if c == card then
                c.selected = false
                table.insert(hand.discarded_cards, c)
                hand.discard_pile.addCard(c)
                hand[i] = EMPTY
            end
        end
        for i, c in ipairs(hand.selected_cards) do
            if c == card then
                c.selected = false
                table.remove(hand.selected_cards, i)
            end
        end
    end

    return hand
end
return hand_display_module