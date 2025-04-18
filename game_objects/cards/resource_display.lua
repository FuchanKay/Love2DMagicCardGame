local resource_display_module = {}

local CardTypes = require "game_objects.cards.card_types"

-- functions
local newImage = love.graphics.newImage
local newFont = love.graphics.newFont
local draw = love.graphics.draw
local setColor = love.graphics.setColor
local printText = love.graphics.print
local floor = math.floor


-- constants
local RESOURCE_DISPLAY_WIDTH = Settings.window_dimensions[1] / 5
local NUM_OF_CARD_TYPES = 4

local ARCANE = CardTypes.arcane
local HEMO = CardTypes.hemo
local HOLY = CardTypes.holy
local UNHOLY = CardTypes.unholy
-- for now
local CARD_LETTER_FONT_FACTOR = 30
local RESOURCE_CAP = 99
local ARCANE_IMG = newImage("res/images/runes/arcane.png")
local HEMO_IMG = newImage("res/images/runes/hemo.png")
local HOLY_IMG = newImage("res/images/runes/holy.png")
local UNHOLY_IMG = newImage("res/images/runes/unholy.png")
local CARD_TYPE_HEIGHT = ARCANE_IMG:getHeight()

local WHITE = Colors.white
local RED = Colors.red

-- for if resource display has to start with a certain amount of resources
resource_display_module.newResourceDisplay = function(x, y, scale, init_arcane, init_hemo, init_holy, init_unholy)
    local resource_display = {
        x = x, y = y, scale = scale, 
        font = newFont("res/fonts/Roman SD.ttf", floor(CARD_LETTER_FONT_FACTOR * scale)),
        arcane_num = init_arcane or 0,
        hemo_num = init_hemo or 0,
        holy_num = init_holy or 0,
        unholy_num = init_unholy or 0
    }

    -- adds num to resource specified. num cannot be negative
    resource_display.addResource = function(card_type, num)
        -- lua's weird way of performing ternary operators
        -- make sure to not not perform functions because it can lead to some weird side effects
        -- also lua doesnt support += which sucks
        if num < 0 then error "num cannot be negative" end
        if card_type == ARCANE then
            -- makes sure that if the num goes over the resource cap then the num is set to the resource cap
            resource_display.arcane_num = resource_display.arcane_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.arcane_num + num
        elseif card_type == HEMO then
            resource_display.hemo_num = resource_display.hemo_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.hemo_num + num
        elseif card_type == HOLY then
            resource_display.holy_num = resource_display.holy_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.holy_num + num
        elseif card_type == UNHOLY then
            resource_display.unholy_num = resource_display.unholy_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.unholy_num + num
        end
    end

    -- subtracts num to resource specified. num cannot be negative
    resource_display.subtractResource = function(card_type, num)
        if num < 0 then error "num cannot be negative" end
        if card_type == ARCANE then
            resource_display.arcane_num = resource_display.arcane_num - num < 0 and 0 or resource_display.arcane_num - num
        elseif card_type == HEMO then
            resource_display.hemo_num = resource_display.hemo_num - num < 0 and 0 or resource_display.hemo_num - num
        elseif card_type == HOLY then
            resource_display.holy_num = resource_display.holy_num - num < 0 and 0 or resource_display.holy_num - num
        elseif card_type == UNHOLY then
            resource_display.unholy_num = resource_display.unholy_num - num < 0 and 0 or resource_display.unholy_num - num
        end
    end

    resource_display.draw = function()
        setColor(WHITE)
        local font = resource_display.font
        local resource_scale = resource_display.scale
        local offset_x = RESOURCE_DISPLAY_WIDTH / NUM_OF_CARD_TYPES
        local resource_x = resource_display.x
        local resource_y = resource_display.y
        local text_x = resource_display.x + offset_x / 2 - font:getWidth(""..resource_display.arcane_num) / 2
        local text_y = CARD_TYPE_HEIGHT * scale * 1.4

        draw(ARCANE_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.arcane_num == RESOURCE_CAP then
            setColor(RED)
            printText(""..resource_display.arcane_num, font, text_x, text_y)
            setColor(WHITE)
        else printText(""..resource_display.arcane_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        draw(HEMO_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.hemo_num == RESOURCE_CAP then
            setColor(RED)
            printText(""..resource_display.hemo_num, font, text_x, text_y)
            setColor(WHITE)
        else printText(""..resource_display.hemo_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        draw(HOLY_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.holy_num == RESOURCE_CAP then
            setColor(RED)
            printText(""..resource_display.holy_num, font, text_x, text_y)
            setColor(WHITE)
        else printText(""..resource_display.holy_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        draw(UNHOLY_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.unholy_num == RESOURCE_CAP then
            setColor(RED)
            printText(""..resource_display.unholy_num, font, text_x, text_y)
            setColor(WHITE)
        else printText(""..resource_display.unholy_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x
    end
    return resource_display
end

return resource_display_module