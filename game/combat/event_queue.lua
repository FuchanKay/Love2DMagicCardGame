EventQueue = Object:extend()

local DELAY = 0.05

function EventQueue:init()
    local queue = {pause = false, closed = false, t = 0}
    -- TODO: make event an config table with more properties such as whether event should be delayed or not
    queue.addEvent = function(event)
        if not queue.closed then table.insert(queue, event) end
    end

    queue.addEventAndPause = function(event)
        if queue.closed then table.insert(queue, event) end
        queue.pause = true
    end

    queue.setPause = function(pause)
        queue.pause = pause
    end
    
    queue.setClosed = function(closed)
        queue.closed = closed
    end

    queue.triggerEvent = function()
        if #queue > 0 then
            local event = table.remove(queue, 1)
            event()
        end
    end

    queue.update = function(dt)
        queue.t = queue.t + dt
        if queue.t >= DELAY then
            queue.t = 0
            if not queue.pause then queue.triggerEvent() end
        end
    end

    return queue
end