Event = Object:extend()

function Event:init(config)

end

function Event:handle()

end

EventManager = Object:extend()

function EventManager:init()
    self.queues = {
        combat = {}
    }
end