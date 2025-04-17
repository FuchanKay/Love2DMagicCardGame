local deck_module = {}

deck_module.newDeck = function()
    local deck = {}
    deck.addCard = function(card)
        table.insert(deck, card)
    end
    deck.removeCard = function(card)
        for i, c in ipairs(deck) do
            if c == card then
                table.remove(deck, i)
                break
            end
        end
    end
    return deck
end

return deck_module