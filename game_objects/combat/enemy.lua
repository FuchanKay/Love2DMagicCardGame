local enemy_module = {}

enemy_module.newEnemy = function(name, img, scale, hp, behavior)
    local enemy = {
        name = name,
        img = img,
        scale = scale,
        max_hp = hp,
        hp = hp,
        isAlive = true,
        description = "",
        behavior = behavior,
    }
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