local hand_display_module = {}

local red_card_img = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")

-- constants
local HAND_WIDTH = Settings.window_dimensions[1] / 2

-- for sprites
local CARD_WIDTH = red_card_img:getWidth()
local CARD_HEIGHT = red_card_img:getHeight()

hand_display_module.newHandDisplay = function(x, y, card_scale)
    return {
        x = x, y = y, card_scale = card_scale
    }
end

hand_display_module.addCard = function(hand, card)
    print(hand.card_scale)
    card.scale = hand.card_scale
    card.width = CARD_WIDTH * card.scale
    card.height = CARD_WIDTH * card.scale
    table.insert(hand, card)
    card.ind = #hand
end

hand_display_module.drawHand = function(hand)
    local spacing = HAND_WIDTH / #hand
    local updated = false
    for i, card in ipairs(hand) do
        local card_x = hand.x + (i - 1) * spacing
        card.x = card_x
        card.y = hand.y
        if updated then
            Card.updateCard(card, true)
        else
            updated = Card.updateCard(card, updated) 
        end
        Card.drawCard(card)
    end
end

return hand_display_module
