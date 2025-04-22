local unholy_card_effects_module = {}
local CardTypes = require "game_objects.cards.card_types"

unholy_card_effects_module.setController = function(controller)
    unholy_card_effects_module.controller = controller
end

unholy_card_effects_module.A = {
    type = CardTypes.unholy,
    letter = "A",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.B = {
    type = CardTypes.unholy,
    letter = "B",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.C = {
    type = CardTypes.unholy,
    letter = "C",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.D = {
    type = CardTypes.unholy,
    letter = "D",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.E = {
    type = CardTypes.unholy,
    letter = "E",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.F = {
    type = CardTypes.unholy,
    letter = "F",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.G = {
    type = CardTypes.unholy,
    letter = "G",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.H = {
    type = CardTypes.unholy,
    letter = "H",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.I = {
    type = CardTypes.unholy,
    letter = "I",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.J = {
    type = CardTypes.unholy,
    letter = "J",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.K = {
    type = CardTypes.unholy,
    letter = "K",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.L = {
    type = CardTypes.unholy,
    letter = "L",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.M = {
    type = CardTypes.unholy,
    letter = "M",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.N = {
    type = CardTypes.unholy,
    letter = "N",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.O = {
    type = CardTypes.unholy,
    letter = "O",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.P = {
    type = CardTypes.unholy,
    letter = "P",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.Q = {
    type = CardTypes.unholy,
    letter = "Q",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.R = {
    type = CardTypes.unholy,
    letter = "R",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.S = {
    type = CardTypes.unholy,
    letter = "S",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.T = {
    type = CardTypes.unholy,
    letter = "T",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.U = {
    type = CardTypes.unholy,
    letter = "U",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.V = {
    type = CardTypes.unholy,
    letter = "V",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.W = {
    type = CardTypes.unholy,
    letter = "W",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.X = {
    type = CardTypes.unholy,
    letter = "X",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.Y = {
    type = CardTypes.unholy,
    letter = "Y",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.Z = {
    type = CardTypes.unholy,
    letter = "Z",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource(CardTypes.unholy, 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}


return unholy_card_effects_module