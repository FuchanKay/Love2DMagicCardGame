local discard_pile_module = {}

discard_pile_module.newDiscardPile = function()
    local discard_pile = {}
    -- removes and returns all cards in discard pile shuffled as a table
    discard_pile.reshuffle = function()
        local shuffled = {}
        for i = 1, #discard_pile do
            local ind = math.random(#discard_pile)
            local random_card = table.remove(discard_pile, ind)
            table.insert(shuffled, random_card)
        end
        return shuffled
    end

    -- for adding a singular card to the draw pile
    discard_pile.addCard = function(card)
        table.insert(discard_pile, card)
    end
    return discard_pile
end


return discard_pile_module