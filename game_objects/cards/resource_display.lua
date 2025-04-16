local resource_display_module = {}

-- constants
local RESOURCE_DISPLAY_WIDTH = Settings.window_dimensions[1] / 5
local NUM_OF_CARD_TYPES = 4
-- for now
local CARD_LETTER_FONT_FACTOR = 30
local RESOURCE_CAP = 99
local ARCANE_IMG = love.graphics.newImage("res/images/runes/arcane.png")
local HEMO_IMG = love.graphics.newImage("res/images/runes/hemo.png")
local HOLY_IMG = love.graphics.newImage("res/images/runes/holy.png")
local UNHOLY_IMG = love.graphics.newImage("res/images/runes/unholy.png")
local NOT_IMG = love.graphics.newImage("res/images/etc/no.png")
local CARD_TYPE_WIDTH = ARCANE_IMG:getWidth()
local CARD_TYPE_HEIGHT = ARCANE_IMG:getHeight()


-- for if resource display has to start with a certain amount of resources
resource_display_module.newResourceDisplay = function(x, y, scale, init_arcane, init_hemo, init_holy, init_unholy)
    local resource_display = {
        x = x, y = y, scale = scale, 
        font = love.graphics.newFont("res/fonts/Roman SD.ttf", math.floor(CARD_LETTER_FONT_FACTOR * scale)),
        arcane_num = init_arcane,
        hemo_num = init_hemo,
        holy_num = init_holy,
        unholy_num = init_unholy
    }

    resource_display.addResource = function(card_type, num)
        -- lua's weird way of performing ternary operators
        -- make sure to not not perform functions because it can lead to some weird side effects
        -- also lua doesnt support += which sucks
        if num < 0 then error "num cannot be negative" end
        if card_type == CardTypes.arcane then
            -- makes sure that if the num goes over the resource cap then the num is set to the resource cap
            resource_display.arcane_num = resource_display.arcane_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.arcane_num + num
        elseif card_type == CardTypes.hemo then
            resource_display.hemo_num = resource_display.hemo_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.hemo_num + num
        elseif card_type == CardTypes.holy then
            resource_display.holy_num = resource_display.holy_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.holy_num + num
        elseif card_type == CardTypes.unholy then
            resource_display.unholy_num = resource_display.unholy_num + num > RESOURCE_CAP and RESOURCE_CAP or resource_display.unholy_num + num
        end
    end

    resource_display.subtractResource = function(card_type, num)
        if num < 0 then error "num cannot be negative" end
        if card_type == CardTypes.arcane then
            resource_display.arcane_num = resource_display.arcane_num - num < 0 and 0 or resource_display.arcane_num - num
        elseif card_type == CardTypes.hemo then
            resource_display.hemo_num = resource_display.hemo_num - num < 0 and 0 or resource_display.hemo_num - num
        elseif card_type == CardTypes.holy then
            resource_display.holy_num = resource_display.holy_num - num < 0 and 0 or resource_display.holy_num - num
        elseif card_type == CardTypes.unholy then
            resource_display.unholy_num = resource_display.unholy_num - num < 0 and 0 or resource_display.unholy_num - num
        end
    end

    resource_display.draw = function()
        love.graphics.setColor(Colors.white)
        local font = resource_display.font
        local resource_scale = resource_display.scale
        local offset_x = RESOURCE_DISPLAY_WIDTH / NUM_OF_CARD_TYPES
        local resource_x = resource_display.x
        local resource_y = resource_display.y
        local text_x = resource_display.x + offset_x / 2 - font:getWidth(""..resource_display.arcane_num) / 2
        local text_y = CARD_TYPE_HEIGHT * scale * 1.2

        love.graphics.draw(ARCANE_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.arcane_num == RESOURCE_CAP then
            love.graphics.setColor(Colors.red)
            love.graphics.print(""..resource_display.arcane_num, font, text_x, text_y)
            love.graphics.setColor(Colors.white)
        else love.graphics.print(""..resource_display.arcane_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        love.graphics.draw(HEMO_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.hemo_num == RESOURCE_CAP then
            love.graphics.setColor(Colors.red)
            love.graphics.print(""..resource_display.hemo_num, font, text_x, text_y)
            love.graphics.setColor(Colors.white)
        else love.graphics.print(""..resource_display.hemo_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        love.graphics.draw(HOLY_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.holy_num == RESOURCE_CAP then
            love.graphics.setColor(Colors.red)
            love.graphics.print(""..resource_display.holy_num, font, text_x, text_y)
            love.graphics.setColor(Colors.white)
        else love.graphics.print(""..resource_display.holy_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

        love.graphics.draw(UNHOLY_IMG, resource_x, resource_y, 0, resource_scale, resource_scale)
        if resource_display.unholy_num == RESOURCE_CAP then
            love.graphics.setColor(Colors.red)
            love.graphics.print(""..resource_display.unholy_num, font, text_x, text_y)
            love.graphics.setColor(Colors.white)
        else love.graphics.print(""..resource_display.unholy_num, font, text_x, text_y) end
        resource_x = resource_x + offset_x
        text_x = text_x + offset_x

    end
    return resource_display
end

return resource_display_module