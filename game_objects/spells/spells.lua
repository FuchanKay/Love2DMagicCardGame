local spell_module = {}

local CardTypes = require "game_objects.cards.card_types"

spell_module.fireball = {
    name = "Fireball",
    type = CardTypes.unholy,
    description = "Discard 2 cards.\n\nDo 10 dmg to all enemies.\n\nDeal an additional 10 dmg for every arcane card discarded.",
    effect = function ()
        local controller = spell_module.controller
        if not controller then error "controller is nil" end
        local ARCANE_COST = 2
        local DISCARD_NUM = 2
        if controller.resource_display.arcane_num >= ARCANE_COST then
            controller.subtractResource(CardTypes.unholy, ARCANE_COST)
            controller.forceDiscardCard(2)
            local fn = function ()
                local dmg = 10
                for i = 0, DISCARD_NUM - 1 do
                    local card = controller.hand.discarded_cards[#controller.hand.discarded_cards - i]
                    if card and card.type == CardTypes.unholy then dmg = dmg + 10 end
                end
                controller.aoeUpdateHp(dmg)
            end
            controller.addEvent(fn)
        end
    end
}

spell_module.arrows_of_light = {
    name = "Arrows of Light",
    type = CardTypes.unholy,
    description = "Do 10 - 30 dmg.\n\nDeal an additional 10 dmg for every holy card in hand",
    effect = function()
        local controller = spell_module.controller
        if not controller then error "controller is nil" end
        local HOLY_COST = 3
        local LOWEST = 10
        local HIGHEST = 30
        local base_dmg = math.random(LOWEST, HIGHEST)
        local ADD_DMG = 10
        if controller.resource_display.holy_num >= HOLY_COST then
            controller.subtractResource(CardTypes.unholy, HOLY_COST)
            controller.targetEnemy()
            local fn = function()
                for i, card in ipairs(controller.hand) do
                    if card.type == CardTypes.unholy then controller.updateHp(controller.enemy_screen.selected_enemy, ADD_DMG) end
                end
                controller.updateHp(controller.enemy_screen.selected_enemy, base_dmg)
            end
            controller.addEvent(fn)
        end




        
    end

}

return spell_module