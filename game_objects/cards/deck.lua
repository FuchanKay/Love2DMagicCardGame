local deck_module = {}
local insert = table.insert
local remove = table.remove

deck_module.newDeck = function()
    local deck = {}
    deck.addCard = function(card)
        card.ind = 1     
        insert(deck, card)
    end
    deck.removeCard = function(card)
        for i, c in ipairs(deck) do
            if c == card then
                remove(deck, i)
                break
            end
        end
    end
    return deck
end

return deck_module