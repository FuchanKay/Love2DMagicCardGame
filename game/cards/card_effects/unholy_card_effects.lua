local unholy_card_effects_module = {}

unholy_card_effects_module.setController = function(controller)
    unholy_card_effects_module.controller = controller
end

unholy_card_effects_module.A = {
    type = "unholy",
    letter = "A",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "B",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "C",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "D",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "E",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "F",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "G",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "H",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "I",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "J",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "K",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "L",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "M",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "N",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "O",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "P",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "Q",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "R",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
    end,
    when_drawn_description = "+2 unholy",
    retain = true,
    retain_num = 1,
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
unholy_card_effects_module.R.when_retained_description = "Gives +"..unholy_card_effects_module.R.retain_num.." unholy. Increased by 1 for every turn retained"
unholy_card_effects_module.R.whenRetained = function(card)
    if not unholy_card_effects_module.controller then error "controller is nil" end
    local controller = unholy_card_effects_module.controller
    unholy_card_effects_module.R.retain_num = unholy_card_effects_module.R.retain_num + 1
    unholy_card_effects_module.R.when_retained_description = "Gives +"..unholy_card_effects_module.R.retain_num.." unholy. Increased by 1 for every turn retained"
    card.updateDescription()
    controller.addResource("unholy", unholy_card_effects_module.R.retain_num)
end
unholy_card_effects_module.S = {
    type = "unholy",
    letter = "S",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "T",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "U",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "V",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "W",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "X",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "Y",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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
    type = "unholy",
    letter = "Z",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not unholy_card_effects_module.controller then error "controller is nil" end
        local controller = unholy_card_effects_module.controller
        controller.addResource("unholy", 2)
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