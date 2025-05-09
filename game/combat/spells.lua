Spell = Object:extend()

function Spell:init()
    return {}
end

Effect = Object:extend()

function Effect:init()
    return {}
end
    function processSpell(spell)
        return function()
            if spell.type == "arcane" and G.resource_display.arcane < spell.cost then return
            elseif spell.type == "hemo" and G.resource_display.hemo < spell.cost then return
            elseif spell.type == "holy" and G.resource_display.holy < spell.cost then return
            elseif spell.type == "unholy" and G.resource_display.unholy < spell.cost then return end

            if spell.type == "arcane" then G.resource_display.arcane = G.resource_display.arcane - spell.cost
            elseif spell.type == "hemo" then G.resource_display.hemo = G.resource_display.hemo - spell.cost
            elseif spell.type == "holy" then G.resource_display.holy = G.resource_display.holy - spell.cost
            elseif spell.type == "unholy" then G.resource_display.unholy = G.resource_display.unholy - spell.cost end
            for i, effect in ipairs(spell.effects) do
                -- TODO: check for trigger
                -- held = {condition = "held", type = "any", num = 1},
                -- draw = {condition = "draw", type = "any", num = 1},
                -- discard = {condition = "discard", type = "any", num = 1},
                -- rand = {condition = "random", prob = 1.0},
                local trigger = true
                if effect.trigger and effect.trigger.condition == "held" then
                    local count = 0
                    if type == "any" then count = G.hand.arcane_cards + G.hand.hemo_cards + G.hand.holy_cards + G.hand.unholy_cards
                    elseif type == "arcane" then count = G.hand.arcane_cards
                    elseif type == "hemo" then count = G.hand.hemo_cards
                    elseif type == "holy" then count = G.hand.holy_cards
                    elseif type == "unholy" then count = G.hand.unholy_cards end
                    if count < effect.trigger.num then trigger = false end
                elseif effect.trigger and effect.trigger.condition == "draw" then
                    
                elseif effect.trigger and effect.trigger.condition == "discard" then

                elseif effect.trigger and effect.trigger.condition == "random" then
                    local event = math.random()
                    print(event)
                    if event >= effect.trigger.prob then trigger = false end
                end
                if effect.set == "damage" and trigger then
                    local dmg = effect.num
                    if effect.effect == "single target damage" then
                        -- TODO: check for extra condition
                        if effect.extra_condition then end
                        G.controller.targetEnemy()
                        local fn = function()
                            G.controller.updateHp(G.controller.enemy_screen.selected_enemy, dmg)
                        end
                        G.controller.addEvent(fn)
                    elseif effect.effect == "aoe damage" then
                        -- TODO: check for extra condition
                        if effect.extra_condition then end
                        G.controller.aoeUpdateHp(dmg)
                    end
                -- draw = {trigger = nil, set = "cards", effect = "draw", type = "any", num = 1, extra_condition = nil, extra = {num = 1}},
                -- discard = {trigger = nil, set = "cards", effect = "discard", type = "any", extra_condition = nil, num = 1, extra = {num = 1}},
                -- swap = {trigger = nil, set = "cards", effect = "swap", type = "any"},
                elseif effect.set == "cards" and trigger then
                    if effect.effect == "draw" then
                        local draw = effect.num
                        if effect.extra_condition then end
                        for j = 1, draw do
                            G.controller.drawCard()
                        end
                    elseif effect.effect == "discard" then
                        local draw = effect.num
                        if effect.extra_condition then end
                        G.controller.forceDiscard(draw)
                    elseif effect.effect == "swap" then
                        -- TODO: implement card swapping
                    end
                end
            end
        end
    end
-- spell_module.fireball = {
--     name = "Fireball",
--     type = CardTypes.arcane,
--     description = "Discard 2 cards.\n\nDo 10 dmg to all enemies.\n\nDeal an additional 10 dmg for every arcane card discarded.",
--     effect = function ()
--         local controller = spell_module.controller
--         if not controller then error "controller is nil" end
--         local ARCANE_COST = 2
--         local DISCARD_NUM = 2
--         if controller.resource_display.arcane >= ARCANE_COST then
--             controller.subtractResource(CardTypes.arcane, ARCANE_COST)
--             controller.forceDiscard(2)
--             local fn = function ()
--                 local dmg = 10
--                 for i = 0, DISCARD_NUM - 1 do
--                     local card = controller.hand.discarded_cards[#controller.hand.discarded_cards - i]
--                     if card and card.type == CardTypes.arcane then dmg = dmg + 10 end
--                 end
--                 controller.aoeUpdateHp(dmg)
--             end
--             controller.addEvent(fn)
--         end
--     end
-- }

-- spell_module.arrows_of_light = {
--     name = "Arrows of Light",
--     type = CardTypes.holy,
--     description = "Do 10 - 30 dmg.\n\nDeal an additional 10 dmg for every holy card in hand",
--     effect = function()
--         local controller = spell_module.controller
--         if not controller then error "controller is nil" end
--         local HOLY_COST = 3
--         local LOWEST = 10
--         local HIGHEST = 30
--         local base_dmg = math.random(LOWEST, HIGHEST)
--         local ADD_DMG = 10
--         if controller.resource_display.holy >= HOLY_COST then
--             controller.subtractResource(CardTypes.holy, HOLY_COST)
--             controller.targetEnemy()
--             local fn = function()
--                 for i, card in ipairs(controller.hand) do
--                     if card.type == CardTypes.holy then controller.updateHp(controller.enemy_screen.selected_enemy, ADD_DMG) end
--                 end
--                 controller.updateHp(controller.enemy_screen.selected_enemy, base_dmg)
--             end
--             controller.addEvent(fn)
--         end
--     end
-- }