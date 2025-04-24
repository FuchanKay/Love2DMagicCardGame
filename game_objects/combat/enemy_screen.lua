local enemy_screen_module = {}

local Colors = require "libraries.luacolors"
local Settings = require "settings"
local SCREEN_WIDTH = Settings.window_dimensions[1]
local SCREEN_HEIGHT = Settings.window_dimensions[2]

-- constants
local FONT = love.graphics.newFont("res/fonts/Roman SD.ttf", 20)
local DIM_COLOR = {0.3, 0.3, 0.3, 0.5}


enemy_screen_module.newScreen = function(background_img, x, y, scale)
    local screen = {
        background_img = background_img,
        x = x, y = y, scale = scale,
        text = "",
        dim = false
    }
    local BACKGROUND_WIDTH = background_img:getWidth() * scale
    local BACKGROUND_HEIGHT = background_img:getHeight() * scale

    screen.setDim = function(enable)
        screen.dim = enable
    end

    screen.setText = function(text)
        screen.text = text
    end

    screen.addEnemy = function(enemy)
        table.insert(screen, enemy)
        enemy.ind = #screen
    end

    screen.draw = function()
        love.graphics.draw(background_img, x, y, 0, scale, scale)
        local num_of_enemies = #screen
        for i, enemy in ipairs(screen) do
            local enemy_sprite_width = enemy.img:getWidth() * enemy.scale
            local enemy_sprite_height = enemy.img:getHeight() * enemy.scale
            local enemy_x = BACKGROUND_WIDTH / (num_of_enemies + 1) * i + screen.x - enemy_sprite_width / 2
            local enemy_y =  BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2
            love.graphics.draw(enemy.img, enemy_x, enemy_y, 0, enemy.scale, enemy.scale)
            love.graphics.setColor(Colors.red)
            love.graphics.setFont(FONT)
            -- TODO: make a working healthbar instead of text
            local hp_text = enemy.hp.."/"..enemy.max_hp
            local hp_x = enemy_x - 15
            local hp_y = BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2 - 20
            love.graphics.print(hp_text, hp_x , hp_y)
            -- TODO: center the enemy name better. text size should scale with sprite width and height
            love.graphics.print(enemy.name, enemy_x, BACKGROUND_HEIGHT / 2 + screen.y - enemy_sprite_height / 2 + 140)
            love.graphics.setColor(Colors.white)
        end
        if screen.dim then
            love.graphics.setColor(DIM_COLOR)
            love.graphics.rectangle("fill", x, y, BACKGROUND_WIDTH, BACKGROUND_HEIGHT)
            love.graphics.setColor(Colors.white)
        end
        local text_width = FONT:getWidth(screen.text)
        local text_x = screen.x + BACKGROUND_WIDTH / 2 - text_width / 2
        local text_y = screen.y + 40
        love.graphics.print(screen.text, text_x, text_y)
    end

    screen.aoeUpdateHp = function(num)
        for i, enemy in ipairs(screen) do
            enemy.updateHp(num)
        end
    end

    screen.updateHp = function(ind, num)
        local enemy = screen[ind]
        enemy.updateHp(num)
    end

    screen.updateRandomHp = function(num)
        local ind = math.random(#screen)
        local enemy = screen[ind]
        enemy.updateHp(num)
    end

    return screen
end

return enemy_screen_module