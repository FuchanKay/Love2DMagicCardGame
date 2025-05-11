-- TODO: add loading scene and be able to construct this
TestScene = Object:extend()

function TestScene:init()
    local scene = {}
    scene.particles = {}
    scene.load = function()

    end

    scene.update = function(dt)
        for i, particle in ipairs(scene.particles) do
            particle.update(dt)
            if not particle.alive then table.remove(scene.particles, i) end
        end
    end
    
    scene.draw = function()
        love.graphics.setBackgroundColor(0.4, 0.4, 0.5)
        for i, particle in ipairs(scene.particles) do
            particle.draw()
        end
    end
    
    scene.keyboardpressed = function(k)
    end
    
    scene.keyboardreleased = function(k)

    end
    
    scene.mousepressed = function(x, y, button)
        local SIZE, COLOR, L, DURATION, DIM = 4, {1.0, 1.0, 1.0, 1}, 200, 1, true
        local count = math.random(40, 80)
        local colors = {
            Colors.yellow,
            Colors.red,
            Colors.black,
            Colors.white,
        }
        for i = 1, count do
            local color = colors[math.random(#colors)]
            local l_var = math.random() + 0.7
            local d_var = math.random() + 0.7
            if l_var > 1 then l_var = 1 end
            if d_var > 1 then d_var = 1 end
            table.insert(scene.particles, Particle(x, y, SIZE, color, L * l_var, math.random() * 2 * math.pi, DURATION * d_var, DIM))
        end
    end
    
    scene.mousereleased = function(x, y, button)
    
    end

    return scene
end