DrawPile = Object:extend()

local RED_CARD_IMG = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")

-- constants
-- for sprites
local CARD_WIDTH = RED_CARD_IMG:getWidth()
local CARD_HEIGHT = RED_CARD_IMG:getHeight()


function DrawPile:newDrawPile()
    local draw_pile = {}

    draw_pile.addDeck = function(deck)
        local deck_copy = {}
        for i, card in ipairs(deck) do
            table.insert(deck_copy, card)
        end
        for i = 1, #deck_copy do
            local ind = math.random(#deck_copy)
            local removed = table.remove(deck_copy, ind)
            removed.width = CARD_WIDTH * removed.scale
            removed.height = CARD_HEIGHT * removed.scale

            table.insert(draw_pile, removed)
        end
    end
    -- for adding multiple cards at once
    draw_pile.addCards = function(cards)
        for i, card in ipairs(cards) do
            table.insert(draw_pile, math.random(#draw_pile), card)
        end
    end
    -- for adding a singular card to the draw pile
    draw_pile.addCard = function(card)
        table.insert(draw_pile, math.random(#draw_pile), card)
    end

    -- removes and returns the first card in draw pile
    -- draw_pile must have at least 1 card
    draw_pile.drawCard = function()
        return table.remove(draw_pile, 1)
    end

    return draw_pile
end

return draw_pile_module