local arcane_card_effects_module = {controller = nil}
local CardTypes = require "game_objects.cards.card_types"

arcane_card_effects_module.setController = function(controller)
    arcane_card_effects_module.controller = controller
end
-- general letter ideas
-- the abilities differ from type to type but same letters have similar effects
-- except for item??? not sure yet
-- A:
-- B:
-- C:
-- D:
-- E:
-- F:
-- G:
-- H:
-- I:
-- J:
-- K:
-- L:
-- M:
-- O:
-- P:
-- Q:
-- R:
-- S:
-- T:
-- U:
-- V:
-- W:
-- X:
-- Y:
-- Z:


-- A
arcane_card_effects_module.A = {
    type = CardTypes.arcane,
    letter = "A",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.B = {
    type = CardTypes.arcane,
    letter = "B",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.C = {
    type = CardTypes.arcane,
    letter = "C",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.D = {
    type = CardTypes.arcane,
    letter = "D",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.E = {
    type = CardTypes.arcane,
    letter = "E",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.F = {
    type = CardTypes.arcane,
    letter = "F",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.G = {
    type = CardTypes.arcane,
    letter = "G",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.H = {
    type = CardTypes.arcane,
    letter = "H",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.I = {
    type = CardTypes.arcane,
    letter = "I",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.J = {
    type = CardTypes.arcane,
    letter = "J",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.K = {
    type = CardTypes.arcane,
    letter = "K",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.L = {
    type = CardTypes.arcane,
    letter = "L",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.M = {
    type = CardTypes.arcane,
    letter = "M",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.N = {
    type = CardTypes.arcane,
    letter = "N",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.O = {
    type = CardTypes.arcane,
    letter = "O",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.P = {
    type = CardTypes.arcane,
    letter = "P",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.Q = {
    type = CardTypes.arcane,
    letter = "Q",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.R = {
    type = CardTypes.arcane,
    letter = "R",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = true,
    retain_num = 1,
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.R.when_retained_description = "Gives +"..arcane_card_effects_module.R.retain_num.." arcane. Increased by 1 for every turn retained"
arcane_card_effects_module.R.whenRetained = function(card)
    if not arcane_card_effects_module.controller then error "controller is nil" end
    local controller = arcane_card_effects_module.controller
    arcane_card_effects_module.R.retain_num = arcane_card_effects_module.R.retain_num + 1
    arcane_card_effects_module.R.when_retained_description = "Gives +"..arcane_card_effects_module.R.retain_num.." arcane. Increased by 1 for every turn retained"
    card.updateDescription()
    controller.addResource(CardTypes.arcane, arcane_card_effects_module.R.retain_num)
end
arcane_card_effects_module.S = {
    type = CardTypes.arcane,
    letter = "S",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.T = {
    type = CardTypes.arcane,
    letter = "T",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.U = {
    type = CardTypes.arcane,
    letter = "U",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
        controller.aoeUpdateHp(-3)
    end,
    when_drawn_description = "+2 arcane, deal 3 dmg to all enemies",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.V = {
    type = CardTypes.arcane,
    letter = "V",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.W = {
    type = CardTypes.arcane,
    letter = "W",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.X = {
    type = CardTypes.arcane,
    letter = "X",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.Y = {
    type = CardTypes.arcane,
    letter = "Y",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}
arcane_card_effects_module.Z = {
    type = CardTypes.arcane,
    letter = "Z",
    when_drawn_num = {},
    whenDrawn = function(card)
        if not arcane_card_effects_module.controller then error "controller is nil" end
        local controller = arcane_card_effects_module.controller
        controller.addResource(CardTypes.arcane, 2)
    end,
    when_drawn_description = "+2 arcane",
    retain = false,
    when_retained = {},
    when_retained_description = "",
    discard = false,
    when_discarded = {},
    when_discarded_description = ""
}

return arcane_card_effects_module