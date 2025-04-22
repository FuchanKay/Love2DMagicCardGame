local holy_card_effects_module = {}
local CardTypes = require "game_objects.cards.card_types"

holy_card_effects_module.setController = function(controller)
    holy_card_effects_module.controller = controller
end

holy_card_effects_module.A = {
    type = CardTypes.holy,
    letter = "A",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.B = {
    type = CardTypes.holy,
    letter = "B",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.C = {
    type = CardTypes.holy,
    letter = "C",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.D = {
    type = CardTypes.holy,
    letter = "D",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.E = {
    type = CardTypes.holy,
    letter = "E",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.F = {
    type = CardTypes.holy,
    letter = "F",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.G = {
    type = CardTypes.holy,
    letter = "G",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.H = {
    type = CardTypes.holy,
    letter = "H",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.I = {
    type = CardTypes.holy,
    letter = "I",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.J = {
    type = CardTypes.holy,
    letter = "J",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.K = {
    type = CardTypes.holy,
    letter = "K",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.L = {
    type = CardTypes.holy,
    letter = "L",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.M = {
    type = CardTypes.holy,
    letter = "M",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.N = {
    type = CardTypes.holy,
    letter = "N",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.O = {
    type = CardTypes.holy,
    letter = "O",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.P = {
    type = CardTypes.holy,
    letter = "P",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.Q = {
    type = CardTypes.holy,
    letter = "Q",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.R = {
    type = CardTypes.holy,
    letter = "R",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.S = {
    type = CardTypes.holy,
    letter = "S",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.T = {
    type = CardTypes.holy,
    letter = "T",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.U = {
    type = CardTypes.holy,
    letter = "U",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.V = {
    type = CardTypes.holy,
    letter = "V",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.W = {
    type = CardTypes.holy,
    letter = "W",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.X = {
    type = CardTypes.holy,
    letter = "X",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.Y = {
    type = CardTypes.holy,
    letter = "Y",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
holy_card_effects_module.Z = {
    type = CardTypes.holy,
    letter = "Z",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not holy_card_effects_module.controller then error "controller is nil" end
        local controller = holy_card_effects_module.controller
        controller.addResource(CardTypes.holy, 2)
    end,
    when_drawn_description = "+2 holy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}


return holy_card_effects_module