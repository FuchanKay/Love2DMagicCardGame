local enemy_module = {}

enemy_module.newEnemy = function(name, img, scale, hp, behavior)
    local enemy = {
        name = name,
        img = img,
        scale = scale,
        max_hp = hp,
        hp = hp,
        width = img:getWidth() * scale,
        height = img:getHeight() * scale,
        isAlive = true,
        description = "",
        behavior = behavior,
    }

    enemy.update = function()
        local mouse_x, mouse_y = love.mouse.getPosition()
        enemy.hot = mouse_x > enemy.x and mouse_x < enemy.x + enemy.width and
            mouse_y > enemy.y and mouse_y < enemy.y + enemy.height
    end

    enemy.updateHp = function(num)
        enemy.hp = enemy.hp + num
        if enemy.hp < 0 then
            enemy.hp = 0
            enemy.isAlive = false
        end
        if enemy.hp > enemy.max_hp then enemy.hp = enemy.max_hp end
    end
    return enemy
end

return enemy_module