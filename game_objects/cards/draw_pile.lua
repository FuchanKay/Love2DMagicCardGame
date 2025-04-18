
local draw_pile_module = {}
local RED_CARD_IMG = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")

-- functions
local insert = table.insert
local remove = table.remove
local randomInt = math.random

-- constants
-- for sprites
local CARD_WIDTH = RED_CARD_IMG:getWidth()
local CARD_HEIGHT = RED_CARD_IMG:getHeight()


draw_pile_module.newDrawPile = function()
    local draw_pile = {}

    draw_pile.addDeck = function(deck)
        local deck_copy = {}
        for i, card in ipairs(deck) do
            insert(deck_copy, card)
        end
        for i = 1, #deck_copy do
            local ind = randomInt(#deck_copy)
            local removed = remove(deck_copy, ind)
            removed.width = CARD_WIDTH * removed.scale
            removed.height = CARD_HEIGHT * removed.scale

            insert(draw_pile, removed)
        end
    end
    -- for adding multiple cards at once
    draw_pile.addCards = function(cards)
        for i, card in ipairs(cards) do
            insert(draw_pile, card)
        end
    end
    -- for adding a singular card to the draw pile
    draw_pile.addCard = function(card)
        insert(draw_pile, card)
    end

    -- removes and returns the first card in draw pile
    -- draw_pile must have at least 1 card
    draw_pile.drawCard = function()
        return remove(draw_pile, 1)
    end

    return draw_pile
end

return draw_pile_module