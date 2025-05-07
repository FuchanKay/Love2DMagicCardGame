DiscardPile = Object:extend()

function DiscardPile:init()
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

    discard_pile.addCards = function(cards)
        for i, card in ipairs(cards) do
            table.insert(discard_pile, card)
        end
    end
    return discard_pile
end