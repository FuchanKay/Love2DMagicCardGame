local event_queue_module = {}

local DELAY = 0.05

event_queue_module.newEventQueue = function()
    local queue = {pause = false, t = 0}
    -- TODO: make event an config table with more properties such as whether event should be delayed or not
    queue.addEvent = function(event)
        table.insert(queue, event)
    end

    queue.addEventAndPause = function(event)
        table.insert(queue, event)
        queue.pause = true
    end

    queue.setPause = function(pause)
        queue.pause = pause
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


return event_queue_module