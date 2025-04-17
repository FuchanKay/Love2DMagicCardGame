local hand_display_module = {}

local red_card_img = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")

-- constants
-- for sprites
local CARD_WIDTH = red_card_img:getWidth()
local CARD_HEIGHT = red_card_img:getHeight()

local DESCRIPTION_BOX_COLOR = {0.6, 0.6, 0.7, 0.5}
local DESCRIPTION_BOX_TEXT_COLOR = {0.1, 0.1, 0.1, 0.5}
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 30)

hand_display_module.newHandDisplay = function(x, y, width, hand_size, draw_pile, discard_pile, card_scale)
    local hand = {
        x = x, y = y, width = width,
        hand_size = hand_size,
        draw_pile = draw_pile, discard_pile = discard_pile,
        card_scale = card_scale,
        selected_card = nil, selected_cards = {}
    }
    hand.addCard = function(card)
        card.width = CARD_WIDTH * card.scale
        card.height = CARD_HEIGHT * card.scale
        table.insert(hand, card)
        card.ind = #hand

        card.description_box = Box.newBox(
        hand.x, hand.y + card.height * 1.4 + 10,
        100, 100,
        DESCRIPTION_BOX_COLOR, card.description,
        nil, DESCRIPTION_BOX_TEXT_COLOR,
        false, false)
    end
    local left_input_now = false
    local left_input_late = false
    local right_input_now = false
    local right_input_late = false

    -- draw as in drawing sprites, not drawing cards
    hand.draw = function()
        local spacing = hand.width / #hand
        local has_selected_card = false
        for i, card in ipairs(hand) do
            if hand.selected_card ~= card then card.selected = false end
            local card_x = hand.x + (i - 1) * spacing
            card.x = card_x
            card.y = hand.y

            card.update()
            if not card.selected then card.draw() end

            if card.selected then
                hand.selected_card = card
                has_selected_card = true
            end
        end

        if hand.selected_card then hand.selected_card.draw() end

        -- for inputs where it should not trigger multiple times for holding it down,
        -- create boolean variables now and late and set late to now before checking whether the key is down.
        -- if now is true and late is false then trigger
        left_input_late = left_input_now
        right_input_late = right_input_now
        left_input_now = love.keyboard.isDown("left")
        right_input_now = love.keyboard.isDown("right")

        if hand.selected_card and has_selected_card then
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
        love.graphics.print("Draw Pile: "..draw_pile_num, FONT, 0, 130)
        love.graphics.print("Discard Pile: "..discard_pile_num, FONT, 0, 230)
    end

    -- draws cards from draw pile. num cannot be negative or 0
    hand.drawCards = function (num)
        if num <= 0 then error "num cannto be negative or 0" end
        for i = 1, num do
            if #hand.draw_pile > 0 then
                local card = hand.draw_pile.drawCard()
                table.insert(hand, card)
            elseif #hand.discard_pile > 0 then
                local cards = hand.discard_pile.reshuffle()
                hand.draw_pile.addCards(cards)
                print(#hand.draw_pile)
                for i = 1, #hand.draw_pile do
                    -- print(hand.draw_pile[i])
                end
                local card = hand.draw_pile.drawCard()
                table.insert(hand, card)
            else
                return
            end
        end
    end

    hand.discardHand = function()
        for i = 1, #hand do
            local removed = table.remove(hand, 1)
            if removed == hand.selected_card then
                hand.selected_card.selected = false
                hand.selected_card = nil
            end
            table.insert(hand.discard_pile, removed)
        end
    end
    return hand
end
return hand_display_module