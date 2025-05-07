local hemo_card_effects_module = {}
local CardTypes = require "game.cards.card_types"

hemo_card_effects_module.setController = function(controller)
    hemo_card_effects_module.controller = controller
end

hemo_card_effects_module.A = {
    type = CardTypes.hemo,
    letter = "A",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.B = {
    type = CardTypes.hemo,
    letter = "B",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.C = {
    type = CardTypes.hemo,
    letter = "C",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.D = {
    type = CardTypes.hemo,
    letter = "D",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.E = {
    type = CardTypes.hemo,
    letter = "E",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.F = {
    type = CardTypes.hemo,
    letter = "F",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.G = {
    type = CardTypes.hemo,
    letter = "G",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.H = {
    type = CardTypes.hemo,
    letter = "H",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.I = {
    type = CardTypes.hemo,
    letter = "I",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.J = {
    type = CardTypes.hemo,
    letter = "J",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.K = {
    type = CardTypes.hemo,
    letter = "K",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.L = {
    type = CardTypes.hemo,
    letter = "L",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.M = {
    type = CardTypes.hemo,
    letter = "M",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.N = {
    type = CardTypes.hemo,
    letter = "N",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.O = {
    type = CardTypes.hemo,
    letter = "O",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.P = {
    type = CardTypes.hemo,
    letter = "P",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.Q = {
    type = CardTypes.hemo,
    letter = "Q",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.R = {
    type = CardTypes.hemo,
    letter = "R",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = true,
    retain_num = 1,
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.R.when_retained_description = "Gives +"..hemo_card_effects_module.R.retain_num.." hemo. Increased by 1 for every turn retained"
hemo_card_effects_module.R.whenRetained = function(card)
    if not hemo_card_effects_module.controller then error "controller is nil" end
    local controller = hemo_card_effects_module.controller
    hemo_card_effects_module.R.retain_num = hemo_card_effects_module.R.retain_num + 1
    hemo_card_effects_module.R.when_retained_description = "Gives +"..hemo_card_effects_module.R.retain_num.." hemo. Increased by 1 for every turn retained"
    card.updateDescription()
    controller.addResource(CardTypes.hemo, hemo_card_effects_module.R.retain_num)
end
hemo_card_effects_module.S = {
    type = CardTypes.hemo,
    letter = "S",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.T = {
    type = CardTypes.hemo,
    letter = "T",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.U = {
    type = CardTypes.hemo,
    letter = "U",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.V = {
    type = CardTypes.hemo,
    letter = "V",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.W = {
    type = CardTypes.hemo,
    letter = "W",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.X = {
    type = CardTypes.hemo,
    letter = "X",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.Y = {
    type = CardTypes.hemo,
    letter = "Y",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
hemo_card_effects_module.Z = {
    type = CardTypes.hemo,
    letter = "Z",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not hemo_card_effects_module.controller then error "controller is nil" end
        local controller = hemo_card_effects_module.controller
        controller.addResource(CardTypes.hemo, 2)
    end,
    when_drawn_description = "+2 hemo",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}

return hemo_card_effects_module