Deck = Object:extend()

function Deck:newDeck()
    local deck = {}
    deck.addCard = function(card)
        card.ind = 1     
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