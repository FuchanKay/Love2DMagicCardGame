local spell_module = {}

local CardTypes = require "game_objects.cards.card_types"

spell_module.fireBall = {
    name = "FireBall",
    description = "Discard 1 card.\nDo 10 dmg to all enemies.\nDouble if discarded card is arcane type",
    effect = function ()
        local controller = spell_module.controller
        if not controller then error "controller is nil" end
        local arcane_spell_cost = 2
        if controller.resource_display.arcane_num >= arcane_spell_cost then
            controller.subtractResource(CardTypes.arcane, arcane_spell_cost)
            controller.forceDiscardCard(1)
            local fn = function ()
                local card = controller.hand.discarded_cards[#controller.hand.discarded_cards]
                if card.type == CardTypes.arcane then controller.aoeUpdateHp(-20)
                else controller.aoeUpdateHp(-10) end
            end
            controller.addEvent(fn)
        end
    end,
}

return spell_module