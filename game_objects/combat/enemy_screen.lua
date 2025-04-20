local enemy_screen_module = {}

local Colors = require "libraries.luacolors"

-- constants
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 20)

enemy_screen_module.newScreen = function(background_img, x, y, scale, enemy_table)
    local screen = {
        background_img = background_img,
        x = x, y = y, scale = scale,
        enemy_table = enemy_table
    }
    local BACKGROUND_WIDTH = background_img:getWidth() * scale
    local BACKGROUND_HEIGHT = background_img:getHeight() * scale

    screen.draw = function()
        love.graphics.draw(background_img, x, y, 0, scale, scale)
        local num_of_enemies = #screen.enemy_table
        for i, enemy in ipairs(screen.enemy_table) do
            local enemy_sprite_width = enemy.img:getWidth() * enemy.scale
            local enemy_sprite_height = enemy.img:getHeight() * enemy.scale
            local enemy_x = BACKGROUND_WIDTH / (num_of_enemies + 1) * i + screen.x - enemy_sprite_width / 2
            love.graphics.draw(enemy.img, enemy_x, BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2, 0, enemy.scale, enemy.scale)
            love.graphics.setColor(Colors.red)
            love.graphics.setFont(FONT)
            -- TODO: make a working healthbar instead of text
            love.graphics.print(""..enemy.hp.."/"..enemy.max_hp, enemy_x, BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2)

            -- TODO: center the enemy name better. text size should scale with sprite width and height
            love.graphics.print(enemy.name, enemy_x, BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2 + 140)
            love.graphics.setColor(Colors.white)
        end
    end

    screen.aoeUpdateHp = function(num)
        for i, enemy in ipairs(screen.enemy_table) do
            enemy.updateHp(num)
        end
    end

    screen.updateHp = function(ind, num)
        local enemy = screen[ind]
        enemy.updateHp(num)
    end

    return screen
end

return enemy_screen_module