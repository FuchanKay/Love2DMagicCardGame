local discard_pile_module = {}

local randomInt = math.random
local remove = table.remove
local insert = table.insert


discard_pile_module.newDiscardPile = function()
    local discard_pile = {}
    -- removes and returns all cards in discard pile shuffled as a table
    discard_pile.reshuffle = function()
        local shuffled = {}
        for i = 1, #discard_pile do
            local ind = randomInt(#discard_pile)
            local random_card = remove(discard_pile, ind)
            insert(shuffled, random_card)
        end
        return shuffled
    end

    -- for adding a singular card to the draw pile
    discard_pile.addCard = function(card)
        insert(discard_pile, card)
    end
    return discard_pile
end
return discard_pile_module