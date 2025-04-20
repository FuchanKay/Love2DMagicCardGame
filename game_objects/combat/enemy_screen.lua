local enemy_screen_module = {}

local Colors = require "libraries.luacolors"

-- constants
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 32)

enemy_screen_module.newScreen = function(background_img, x, y, scale, enemy_table)
    local screen = {
        background_img = background_img,
        x = x, y = y, scale = scale
    }
    local BACKGROUND_WIDTH = background_img:getWidth() * scale
    local BACKGROUND_HEIGHT = background_img:getHeight() * scale

    screen.draw = function()
        love.graphics.draw(background_img, x, y, 0, scale, scale)
        local num_of_enemies = #enemy_table
        for i, enemy in ipairs(enemy_table) do
            local enemy_sprite_width = enemy.img:getWidth() * enemy.scale
            local enemy_sprite_height = enemy.img:getHeight() * enemy.scale
            local enemy_x = BACKGROUND_WIDTH / (num_of_enemies + 1) * i + x
            love.graphics.draw(enemy.img, enemy_x - enemy_sprite_width / 2, BACKGROUND_HEIGHT / 2 + y - enemy_sprite_height / 2, 0, enemy.scale, enemy.scale)
            love.graphics.setColor(Colors.red)
            love.graphics.setFont(FONT)
            love.graphics.print(""..enemy.hp, enemy_x - enemy_sprite_width / 2, BACKGROUND_HEIGHT / 2 + y - enemy_sprite_height / 2)
            love.graphics.setColor(Colors.white)
        end
    end

    return screen
end

return enemy_screen_module