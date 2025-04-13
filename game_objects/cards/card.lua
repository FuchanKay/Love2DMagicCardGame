local card_module = {}

local red_card_img = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")
local arcane_img = love.graphics.newImage("res/images/runes/arcane_hd.png")
local hemo_img = love.graphics.newImage("res/images/runes/hemo_hd.png")
local holy_img = love.graphics.newImage("res/images/runes/holy_hd.png")
local unholy_img = love.graphics.newImage("res/images/runes/unholy_hd.png")
local not_img = love.graphics.newImage("res/images/etc/no.png")

-- constants
local CARD_LEVEL_MAX = 10

-- for sprites
local CARD_WIDTH = red_card_img:getWidth()
local CARD_HEIGHT = red_card_img:getHeight()
-- every rune image has the same width and height of 640x640
local RUNE_SCALE = 1/2
local RUNE_WIDTH = arcane_img:getWidth() * RUNE_SCALE
local RUNE_HEIGHT = arcane_img:getHeight() * RUNE_SCALE
local CARD_LETTER_FONT_FACTOR = 1/8


card_module.newCard = function(type, letter, description)
    local card = {img = red_card_img, type = type, level = 1, description = description}

    -- if parameter is a negative number, unupgrades
    card.upgrade = function(num)
        card.level = card.level + (num or 1)
        if card.level > CARD_LEVEL_MAX then card.level = CARD_LEVEL_MAX end
        if card.level < 1 then card.level = 1 end
    end

    if type == CardTypes.arcane then card.type_img = arcane_img
    elseif type == CardTypes.hemo then card.type_img = hemo_img
    elseif type == CardTypes.holy then card.type_img = holy_img
    elseif type == CardTypes.unholy then card.type_img = unholy_img
    else card.type_img = not_img end

    -- if card_letter argument is invalid, sets letter to "!"
    card.letter = letter or "!"
    if string.len(card.letter) == 0 then card.letter = "!" end
    if string.len(card.letter) > 1 then card.letter = "!" end

    return card
end

card_module.drawCard = function(card, x, y, x_scale, y_scale)
    local card_width = CARD_WIDTH * x_scale
    local card_height = CARD_HEIGHT * y_scale

    local rune_width = RUNE_WIDTH * x_scale
    local rune_height = RUNE_HEIGHT * y_scale

    love.graphics.draw(red_card_img, x, y, 0, x_scale, y_scale)

    local font = love.graphics.newFont("res/fonts/ComicRunes.otf", math.floor(card_width * CARD_LETTER_FONT_FACTOR))

    love.graphics.setFont(font)
    local letter_width = font:getWidth(card.letter)
    local letter_height = font:getHeight(card.letter)
    love.graphics.print(card.letter, font, x + card_width / 2 - letter_width / 2, y + card_height / 7 - letter_height / 2)

    local rune_img = not_img
    if card.type == CardTypes.arcane then
        rune_img = arcane_img
    elseif card.type == CardTypes.hemo then
        rune_img = hemo_img
    elseif card.type == CardTypes.holy then
        rune_img = holy_img  
    elseif card.type == CardTypes.unholy then
        rune_img = unholy_img
    elseif card.type == CardTypes.mana then
        -- no mana img because idk if im going to add it
    elseif card.type == CardTypes.item then
        -- no img for item but ill definitely add items
    end
    love.graphics.draw(rune_img, x + card_width / 2 - rune_width / 2, y + card_height / 2 - rune_height / 2, 0, x_scale * RUNE_SCALE, y_scale * RUNE_SCALE)
end

return card_module