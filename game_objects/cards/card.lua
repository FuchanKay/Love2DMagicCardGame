local card_module = {}

local red_card_img = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")
local arcane_img = love.graphics.newImage("res/images/runes/arcane_hd.png")
local hemo_img = love.graphics.newImage("res/images/runes/hemo_hd.png")
local holy_img = love.graphics.newImage("res/images/runes/holy_hd.png")
local unholy_img = love.graphics.newImage("res/images/runes/unholy_hd.png")
local not_img = love.graphics.newImage("res/images/etc/no.png")

-- constants
local CARD_LEVEL_MAX = 10
local LEFT_CLICK = 1

-- for sprites
local CARD_WIDTH = red_card_img:getWidth()
local CARD_HEIGHT = red_card_img:getHeight()
-- every rune image has the same width and height of 640x640
local RUNE_SCALE = 1 / 2
local RUNE_WIDTH = arcane_img:getWidth() * RUNE_SCALE
local RUNE_HEIGHT = arcane_img:getHeight() * RUNE_SCALE
local CARD_LETTER_FONT_FACTOR = 1 / 8
local DEFAULT_SCALE = 1.0
local EXPANDED_SCALE = 1.4

local BLACK = {0, 0, 0, 1.0}
local LIGHT_GREY = {0.9, 0.9, 0.9, 1.0}
local WHITE = {1, 1, 1, 1}

card_module.newCard = function(type, letter, description)
    local card = {
    img = red_card_img,
    type = type,
    level = 1,
    description = description,
    x = 0,
    y = 0,
    hot = false,
    selected = false,
    now = false,
    last = false
    }
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

card_module.updateCard = function(card, updated)
    card.last = card.now
    -- lua's equivalent of a ternary operator
    -- careful about evaluating functions to set variables
    -- beacuse they execute weirdly
    card.scale = card.selected and card.scale * EXPANDED_SCALE or card.scale * DEFAULT_SCALE
    
    local mouse_x, mouse_y = love.mouse.getPosition()
    card.hot = mouse_x > card.x and mouse_x < card.x + card.width and
                mouse_y > card.y and mouse_y < card.y + card.height
                and not updated
    card.now = love.mouse.isDown(LEFT_CLICK)
    local selected = false
    -- calls function in parameter if button is clicked
    if card.now and not card.last and card.hot and not updated then
        card.selected = not card.selected
        selected = true
    end
    return selected
end

card_module.drawCard = function(card)
    local brightness = LIGHT_GREY
    if card.hot then brightness = WHITE end

    love.graphics.setColor(brightness)

    local off_x = 0
    if card.selected then off_x = (card.width * (EXPANDED_SCALE / DEFAULT_SCALE - 1)) / 2 end

    love.graphics.draw(red_card_img, card.x - off_x, card.y, 0, card.scale, card.scale)
    -- print(card.scale)

    local font = love.graphics.newFont("res/fonts/Runicesque.ttf", math.floor(card.width * CARD_LETTER_FONT_FACTOR * card.scale))

    love.graphics.setFont(font)

    local letter_width = font:getWidth(card.letter)
    local letter_height = font:getHeight(card.letter)
    local letter_x = card.x + card.width / 2 - letter_width / 2 - off_x
    local letter_y = card.y + card.width / 7 - letter_height / 2

    love.graphics.setColor(BLACK)
    love.graphics.print(card.letter, font, letter_x, letter_y)
    love.graphics.setColor(brightness)

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

    local rune_width = RUNE_WIDTH * card.scale
    local rune_height = RUNE_HEIGHT * card.scale

    local rune_x = card.x + card.width / 2 - rune_width / 2 - off_x
    local rune_y = card.y + card.width / 2 - rune_height / 2
    local rune_scale_x = card.scale * RUNE_SCALE
    local rune_scale_y = card.scale * RUNE_SCALE

    love.graphics.draw(rune_img, rune_x, rune_y, 0, rune_scale_x, rune_scale_y)
end

return card_module