local draw_pile_module = {}

draw_pile_module.newDrawPile = function()
    local draw_pile = {}
    -- for adding multiple cards at once
    draw_pile.addDeck = function(deck)
        for i, card in ipairs(deck) do
            table.insert(draw_pile, card)
        end
    end
    -- for adding a singular card to the draw pile
    draw_pile.addCard = function(card)
        table.insert(draw_pile, card)
    end

    -- removes and returns the first card in draw pile
    -- draw_pile must have at least 1 card
    draw_pile.drawCard = function()
        return table.remove(draw_pile, 1)
    end

    return draw_pile
end

return draw_pile_module