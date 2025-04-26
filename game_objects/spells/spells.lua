local spell_module = {}

local CardTypes = require "game_objects.cards.card_types"

spell_module.fire_ball = {
    name = "Fireball",
    description = "Discard 2 cards.\n\nDo 10 dmg to all enemies.\n\nDeal additional 10 dmg for every arcane card discarded.",
    effect = function ()
        local controller = spell_module.controller
        if not controller then error "controller is nil" end
        local ARCANE_COST = 2
        local DISCARD_NUM = 2
        if controller.resource_display.arcane_num >= ARCANE_COST then
            controller.subtractResource(CardTypes.arcane, ARCANE_COST)
            controller.forceDiscardCard(2)
            local fn = function ()
                local dmg = -10
                for i = 0, DISCARD_NUM - 1 do
                    local card = controller.hand.discarded_cards[#controller.hand.discarded_cards - i]
                    if card.type == CardTypes.arcane then dmg = dmg - 10 end
                end
                controller.aoeUpdateHp(dmg)
            end
            controller.addEvent(fn)
        end
    end
}

return spell_module