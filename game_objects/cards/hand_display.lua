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
        selected_card = nil, selected_cards = {},
        select_num = 1
    }
    for i = 1, size do
        table.insert(hand, EMPTY)
    end
    local left_input_now = false
    local left_input_late = false
    local right_input_now = false
    local right_input_late = false
    CARD_WIDTH = GREY_BLANK_CARD_IMG:getWidth() * card_scale
    SPACING = hand.width / hand.size

    hand.update = function()
        left_input_late = left_input_now
        right_input_late = right_input_now
        left_input_now = love.keyboard.isDown("left") or love.keyboard.isDown("a")
        right_input_now = love.keyboard.isDown("right") or love.keyboard.isDown("d")
        if hand.selected_card and left_input_now and not left_input_late then
            local left_card = nil
            local ind = 1
            while ind < hand.selected_card.ind do
                if hand[ind] ~= EMPTY then
                    left_card = hand[ind]
                end
                ind = ind + 1
            end
            if left_card then
                hand.selected_card.selected = false
                hand.selected_card.scale = hand.selected_card.default_scale
                hand.selected_card = left_card
                hand.selected_card.scale = hand.selected_card.expanded_scale
                hand.selected_card.selected = true
            end
        end
        if hand.selected_card and right_input_now and not right_input_late and hand.selected_card.ind < #hand then
            local right_card = nil
            local ind = hand.selected_card.ind + 1
            while ind <= #hand do
                if hand[ind] ~= EMPTY then
                    right_card = hand[ind]
                    break
                end
                ind = ind + 1
            end
            if right_card then
                hand.selected_card.selected = false
                hand.selected_card.scale = hand.selected_card.default_scale
                hand.selected_card = right_card
                hand.selected_card.scale = hand.selected_card.expanded_scale
                hand.selected_card.selected = true
            end
        end
        for i, card in ipairs(hand) do
            local card_x = hand.x + (i - 1) * SPACING
            -- TODO: implement multiple selection for cards
            if hand.select_num > 1 then
                if hand.selected_card then hand.selected_card = nil end
                if card ~= EMPTY then
                    card.x = card_x
                    card.y = hand.y
                    card.update()
                end
                if card.selected then
                    print(#hand.selected_cards)
                end
                -- card is selected and there is space in selected cards
                local is_in_selected_cards = false
                for j, c in ipairs(hand.selected_cards) do
                    is_in_selected_cards = c == card
                end

                if card.selected and #hand.selected_cards < hand.select_num and not is_in_selected_cards then
                    table.insert(hand.selected_cards, card)
                -- card is selected and no more cards can be selected
                elseif card.selected and not is_in_selected_cards then
                    table.insert(hand.selected_cards, #hand.selected_cards, card)
                    local c = table.remove(hand.selected_cards, 1)
                    c.selected = false
                end
            else
                -- clears selected cards if only one card is being selected
                if #hand.selected_cards > 0 then
                    for j = 0, #hand.selected_cards do
                        table.remove(hand.selected_cards, 1)
                    end
                end
                if card ~= EMPTY then
                    card.x = card_x
                    card.y = hand.y
                    card.update()
                end
                if card.selected and card ~= hand.selected_card then
                    if hand.selected_card then hand.selected_card.selected = false end
                    hand.selected_card = card
                end
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
        -- for some reason using i doesnt work
        for i, card in ipairs(hand) do
            local card_x = hand.x + (i - 1) * SPACING
            if not card.selected and card ~= EMPTY then
                card.scale = card.default_scale
                card.draw()
            end
            love.graphics.setFont(FONT)
            local num_width = FONT:getWidth(i)
            love.graphics.print(i, card_x + CARD_WIDTH / 2 - num_width / 2, hand.y - 40, 0, 1, 1)
        end
        -- for i, card in ipairs(hand.selected_cards) do
        --     card.draw()
        -- end

        -- for inputs where it should not trigger multiple times for holding it down,
        -- create boolean variables now and late and set late to now before checking whether the key is down.
        -- if now is true and late is false then trigger

        if hand.selected_card then
            hand.selected_card.draw()
            if not hand.selected_card.description_box then error "no description box" end
            hand.selected_card.description_box.draw()
        end
        if #hand.selected_cards > 0 then
            for i, card in ipairs(hand.selected_cards) do
                card.scale = card.expanded_scale
                card.draw()
            end
        end

        local draw_pile_num = #hand.draw_pile
        local discard_pile_num = #hand.discard_pile
        love.graphics.setColor(Colors.white)
        love.graphics.print("Draw Pile: "..draw_pile_num, FONT, 30, 130)
        love.graphics.print("Discard Pile: "..discard_pile_num, FONT, 30, 230)
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