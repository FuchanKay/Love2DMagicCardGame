local card_module = {}

local types = require "card_types"

local card_level_max = 10

local red_card_img = love.graphics.newImage("res/images/red_rune_card_hd")
local arcane_img = love.graphics.newImage("res/images/runes/arcane_hd.png")
local hemo_img = love.graphics.newImage("res/images/runes/hemo_hd.png")
local holy_img = love.graphics.newImage("res/images/runes/holy_hd.png")
local unholy_img = love.graphics.newImage("res/images/runes/unholy_hd.png")
local not_img = love.graphics.newImage("res/images/no.png")

card_module.newCard = function(card_type, card_letter)
    local card = {card_img = red_card_img, card_level = 1}
    -- if parameter is a negative number, unupgrades
    card.upgrade = function(num)
        card.card_level = card.card_level + (num or 1)
        if card.card_level > card_level_max then card.card_level = card_level_max end
        if card.card_level < 1 then card.card_level = 1 end
    end

    if card_type == types.arcane then card.type_img = arcane_img
    elseif card_type == types.hemo then card.type_img = hemo_img
    elseif card_type == types.holy then card.type_img = holy_img
    elseif card_type == types.unholy then card.type_img = unholy_img
    else card.type_img = not_img end
    -- if card_letter argument is invalid, sets letter to "!"
    card.letter = card_letter or "!"
    if string.len(card.letter) == 0 then card.letter = "!" end
    if string.len(card.letter) > 1 then card.letter = "!" end
    return card
end

return card_module