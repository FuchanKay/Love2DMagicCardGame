Particle = Object:extend()

function Particle:init(x, y, size, color, length, theta, duration, diminish, config)
    local particle = {
        x = x or 0, y = y or 0,
        color = color or {0, 0, 0, 1},
        size = size or 2,
        length = length or 5,
        theta = theta or 0,
        duration = duration or 1,
        diminish = diminish or false,
        alive = true
    }
    if config then
        
    end
    particle.vel = {
        x = math.cos(particle.theta) * particle.length / particle.duration,
        y = math.sin(particle.theta) * particle.length / particle.duration,
        size = particle.size / particle.duration
    }
    particle.update = function(dt)
        duration = duration - dt
        particle.x = particle.x + dt * particle.vel.x
        particle.y = particle.y + dt * particle.vel.y
        if particle.diminish then particle.size = particle.size - dt * particle.vel.size end
        if duration < 0 or particle.size < 1 then particle.alive = false end
    end

    particle.draw = function()
        love.graphics.push()
        love.graphics.setColor(particle.color)
        love.graphics.circle("fill", particle.x, particle.y, particle.size)
        love.graphics.pop()
    end


    return particle
end


