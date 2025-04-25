local event_queue_module = {}

event_queue_module.newEventQueue = function()
    local queue = {pause = false}
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

    queue.update = function()
        if not queue.pause then queue.triggerEvent() end
    end

    return queue
end


return event_queue_module