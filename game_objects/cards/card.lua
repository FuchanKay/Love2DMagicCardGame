local card_module = {}



-- constants
local CARD_LEVEL_MAX = 10
local LEFT_CLICK = 1

local RED_CARD_HD_IMG = love.graphics.newImage("res/images/cards/red_rune_card_hd.png")
local ARCANE_HD_IMG = love.graphics.newImage("res/images/runes/arcane_hd.png")
local HEMO_HD_IMG = love.graphics.newImage("res/images/runes/hemo_hd.png")
local HOLY_HD_IMG = love.graphics.newImage("res/images/runes/holy_hd.png")
local UNHOLY_HD_IMG = love.graphics.newImage("res/images/runes/unholy_hd.png")
local NOT_IMG = love.graphics.newImage("res/images/etc/no.png")

-- for sprites
local CARD_WIDTH = RED_CARD_HD_IMG:getWidth()
local CARD_HEIGHT = RED_CARD_HD_IMG:getHeight()

-- every rune image has the same width and height of 640x640
local RUNE_SCALE = 1 / 2
local RUNE_WIDTH = ARCANE_HD_IMG:getWidth() * RUNE_SCALE
local RUNE_HEIGHT = ARCANE_HD_IMG:getHeight() * RUNE_SCALE
-- card leter bigger than usual so its easier to see for now. will update visuals later
local CARD_LETTER_FONT_FACTOR = 7 / 5
local DEFAULT_SCALE = 1.0
local EXPANDED_SCALE = 1.4

local LIGHT_GREY = {0.9, 0.9, 0.9, 1.0}

card_module.newCard = function(type, letter, scale, description)
    local card = {
    img = RED_CARD_HD_IMG,
    type = type,
    level = 1,
    scale = scale,
    default_scale = scale,
    expanded_scale = scale * EXPANDED_SCALE,
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

    if type == CardTypes.arcane then card.type_img = ARCANE_HD_IMG
    elseif type == CardTypes.hemo then card.type_img = HEMO_HD_IMG
    elseif type == CardTypes.holy then card.type_img = HOLY_HD_IMG
    elseif type == CardTypes.unholy then card.type_img = UNHOLY_HD_IMG
    else card.type_img = NOT_IMG end

    -- if card_letter argument is invalid, sets letter to "!"
    card.letter = letter or "!"
    if string.len(card.letter) == 0 then card.letter = "!" end
    if string.len(card.letter) > 1 then card.letter = "!" end

    card.update = function()
        card.last = card.now
        if card.selected then card.scale = card.expanded_scale
        else card.scale = card.default_scale end
        card.width = CARD_WIDTH * card.scale
        card.height = CARD_HEIGHT * card.scale

        card.width = CARD_WIDTH * card.scale
        card.height = CARD_HEIGHT * card.scale
        local off_x = 0
        if card.selected then off_x = -(card.width * (EXPANDED_SCALE / DEFAULT_SCALE - 1)) / 3 end

        local mouse_x, mouse_y = love.mouse.getPosition()
        card.hot = mouse_x > card.x + off_x and mouse_x < card.x + card.width + off_x and
                    mouse_y > card.y and mouse_y < card.y + card.height
        card.now = love.mouse.isDown(LEFT_CLICK)
        -- calls function in parameter if button is clicked
        if card.now and not card.last and card.hot then
            card.selected = not card.selected
            SoundEffects.playBell()
        end
        -- called again to make sure that everything is updated if scale is changed
        if card.selected then card.scale = card.expanded_scale
        else card.scale = card.default_scale end
        card.width = CARD_WIDTH * card.scale
        card.height = CARD_HEIGHT * card.scale
    end

    card.draw = function()
        local brightness = LIGHT_GREY
        if card.hot then brightness = Colors.white end

        local off_x = 0
        if card.selected then off_x = -(card.width * (EXPANDED_SCALE / DEFAULT_SCALE - 1)) / 3 end

        love.graphics.setColor(brightness)

        local card_x = card.x + off_x
        love.graphics.draw(RED_CARD_HD_IMG, card_x, card.y, 0, card.scale, card.scale)
        if card.ind == 1 and love.keyboard.isDown "space" then
            print("card.width: "..card.width.."  card.scale: "..card.scale.."  card_x: "..card_x)
        end

        local font = love.graphics.newFont("res/fonts/Runicesque.ttf", math.floor(card.width * CARD_LETTER_FONT_FACTOR * card.scale))

        love.graphics.setFont(font)

        local letter_width = font:getWidth(card.letter)
        local letter_height = font:getHeight(card.letter)
        local letter_x = card.x + card.width / 2 - letter_width / 2 + off_x
        local letter_y = card.y + card.height / 7 - letter_height / 2

        love.graphics.setColor(Colors.black)
        love.graphics.print(card.letter, font, letter_x, letter_y)
        love.graphics.setColor(brightness)

        local rune_img = NOT_IMG
        if card.type == CardTypes.arcane then
            rune_img = ARCANE_HD_IMG
        elseif card.type == CardTypes.hemo then
            rune_img = HEMO_HD_IMG
        elseif card.type == CardTypes.holy then
            rune_img = HOLY_HD_IMG  
        elseif card.type == CardTypes.unholy then
            rune_img = UNHOLY_HD_IMG
        elseif card.type == CardTypes.mana then
            -- no mana img because idk if im going to add it
        elseif card.type == CardTypes.item then
            -- no img for item but ill definitely add items
        end

        local rune_width = RUNE_WIDTH * card.scale
        local rune_height = RUNE_HEIGHT * card.scale

        local rune_x = card.x + card.width / 2 - rune_width / 2 + off_x
        local rune_y = card.y + card.height / 2 - rune_height / 2
        local rune_scale_x = card.scale * RUNE_SCALE
        local rune_scale_y = card.scale * RUNE_SCALE

        love.graphics.draw(rune_img, rune_x, rune_y, 0, rune_scale_x, rune_scale_y)
    end

    return card
end

return card_module