Game = Object:extend()



-- constants
CARD_SIZE_SCALE = 3 / 17
local HAND_WIDTH = 768
local HAND_SIZE = 8

local COMBAT_BACKGROUND_IMG = love.graphics.newImage("res/images/backgrounds/combat_background_1.png")
local BACKGROUND_IMG_X = 720
local BACKGROUND_IMG_Y = 20
local BACKGROUND_IMG_SCALE = 2.25
local BACKGROUND_IMG_WIDTH = COMBAT_BACKGROUND_IMG:getWidth() * BACKGROUND_IMG_SCALE
local BACKGROUND_IMG_HEIGHT = COMBAT_BACKGROUND_IMG:getHeight() * BACKGROUND_IMG_SCALE

local BLACK_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/skeleton_enemy_black.png")
local WHITE_SKELETON_ENEMY_IMG = love.graphics.newImage("res/images/enemies/skeleton_enemy_white.png")
local SKELETON_SCALE = 0.2
local SKELETON_WIDTH = BLACK_SKELETON_ENEMY_IMG:getWidth() * SKELETON_SCALE
local SKELETON_HEIGHT = BLACK_SKELETON_ENEMY_IMG:getHeight() * SKELETON_SCALE

function Game:init()
    G = self

    -- G:setGlobals()
end

function Game:initItemPrototypes()

    self.arcane_cards = {
        a = {name = "A", type = "arcane", set = "card", level = 1, order = 1, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        b = {name = "B", type = "arcane", set = "card", level = 1, order = 2, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        c = {name = "C", type = "arcane", set = "card", level = 1, order = 3, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        d = {name = "D", type = "arcane", set = "card", level = 1, order = 4, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        e = {name = "E", type = "arcane", set = "card", level = 1, order = 5, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        f = {name = "F", type = "arcane", set = "card", level = 1, order = 6, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        g = {name = "G", type = "arcane", set = "card", level = 1, order = 7, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        h = {name = "H", type = "arcane", set = "card", level = 1, order = 8, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        i = {name = "I", type = "arcane", set = "card", level = 1, order = 9, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        j = {name = "J", type = "arcane", set = "card", level = 1, order = 10, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        k = {name = "K", type = "arcane", set = "card", level = 1, order = 11, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        l = {name = "L", type = "arcane", set = "card", level = 1, order = 12, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        m = {name = "M", type = "arcane", set = "card", level = 1, order = 13, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        n = {name = "N", type = "arcane", set = "card", level = 1, order = 14, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        o = {name = "O", type = "arcane", set = "card", level = 1, order = 15, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        p = {name = "P", type = "arcane", set = "card", level = 1, order = 16, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        q = {name = "Q", type = "arcane", set = "card", level = 1, order = 17, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        r = {name = "R", type = "arcane", set = "card", level = 1, order = 18, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        s = {name = "S", type = "arcane", set = "card", level = 1, order = 19, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        t = {name = "T", type = "arcane", set = "card", level = 1, order = 20, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        u = {name = "U", type = "arcane", set = "card", level = 1, order = 21, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        v = {name = "V", type = "arcane", set = "card", level = 1, order = 22, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        w = {name = "W", type = "arcane", set = "card", level = 1, order = 23, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        x = {name = "X", type = "arcane", set = "card", level = 1, order = 24, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        y = {name = "Y", type = "arcane", set = "card", level = 1, order = 25, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        z = {name = "Z", type = "arcane", set = "card", level = 1, order = 26, config = {drawn = true, retained = false, discarded = false, swapped = false}},
    }

    self.hemo_cards = {
        a = {name = "A", type = "hemo", set = "card", level = 1, order = 1, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        b = {name = "B", type = "hemo", set = "card", level = 1, order = 2, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        c = {name = "C", type = "hemo", set = "card", level = 1, order = 3, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        d = {name = "D", type = "hemo", set = "card", level = 1, order = 4, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        e = {name = "E", type = "hemo", set = "card", level = 1, order = 5, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        f = {name = "F", type = "hemo", set = "card", level = 1, order = 6, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        g = {name = "G", type = "hemo", set = "card", level = 1, order = 7, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        h = {name = "H", type = "hemo", set = "card", level = 1, order = 8, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        i = {name = "I", type = "hemo", set = "card", level = 1, order = 9, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        j = {name = "J", type = "hemo", set = "card", level = 1, order = 10, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        k = {name = "K", type = "hemo", set = "card", level = 1, order = 11, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        l = {name = "L", type = "hemo", set = "card", level = 1, order = 12, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        m = {name = "M", type = "hemo", set = "card", level = 1, order = 13, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        n = {name = "N", type = "hemo", set = "card", level = 1, order = 14, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        o = {name = "O", type = "hemo", set = "card", level = 1, order = 15, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        p = {name = "P", type = "hemo", set = "card", level = 1, order = 16, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        q = {name = "Q", type = "hemo", set = "card", level = 1, order = 17, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        r = {name = "R", type = "hemo", set = "card", level = 1, order = 18, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        s = {name = "S", type = "hemo", set = "card", level = 1, order = 19, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        t = {name = "T", type = "hemo", set = "card", level = 1, order = 20, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        u = {name = "U", type = "hemo", set = "card", level = 1, order = 21, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        v = {name = "V", type = "hemo", set = "card", level = 1, order = 22, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        w = {name = "W", type = "hemo", set = "card", level = 1, order = 23, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        x = {name = "X", type = "hemo", set = "card", level = 1, order = 24, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        y = {name = "Y", type = "hemo", set = "card", level = 1, order = 25, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        z = {name = "Z", type = "hemo", set = "card", level = 1, order = 26, config = {drawn = true, retained = false, discarded = false, swapped = false}},
    }

    self.holy_cards = {
        a = {name = "A", type = "holy", set = "card", level = 1, order = 1, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        b = {name = "B", type = "holy", set = "card", level = 1, order = 2, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        c = {name = "C", type = "holy", set = "card", level = 1, order = 3, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        d = {name = "D", type = "holy", set = "card", level = 1, order = 4, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        e = {name = "E", type = "holy", set = "card", level = 1, order = 5, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        f = {name = "F", type = "holy", set = "card", level = 1, order = 6, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        g = {name = "G", type = "holy", set = "card", level = 1, order = 7, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        h = {name = "H", type = "holy", set = "card", level = 1, order = 8, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        i = {name = "I", type = "holy", set = "card", level = 1, order = 9, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        j = {name = "J", type = "holy", set = "card", level = 1, order = 10, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        k = {name = "K", type = "holy", set = "card", level = 1, order = 11, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        l = {name = "L", type = "holy", set = "card", level = 1, order = 12, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        m = {name = "M", type = "holy", set = "card", level = 1, order = 13, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        n = {name = "N", type = "holy", set = "card", level = 1, order = 14, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        o = {name = "O", type = "holy", set = "card", level = 1, order = 15, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        p = {name = "P", type = "holy", set = "card", level = 1, order = 16, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        q = {name = "Q", type = "holy", set = "card", level = 1, order = 17, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        r = {name = "R", type = "holy", set = "card", level = 1, order = 18, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        s = {name = "S", type = "holy", set = "card", level = 1, order = 19, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        t = {name = "T", type = "holy", set = "card", level = 1, order = 20, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        u = {name = "U", type = "holy", set = "card", level = 1, order = 21, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        v = {name = "V", type = "holy", set = "card", level = 1, order = 22, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        w = {name = "W", type = "holy", set = "card", level = 1, order = 23, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        x = {name = "X", type = "holy", set = "card", level = 1, order = 24, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        y = {name = "Y", type = "holy", set = "card", level = 1, order = 25, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        z = {name = "Z", type = "holy", set = "card", level = 1, order = 26, config = {drawn = true, retained = false, discarded = false, swapped = false}},
    }

    self.unholy_cards = {
        a = {name = "A", type = "unholy", set = "card", level = 1, order = 1, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        b = {name = "B", type = "unholy", set = "card", level = 1, order = 2, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        c = {name = "C", type = "unholy", set = "card", level = 1, order = 3, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        d = {name = "D", type = "unholy", set = "card", level = 1, order = 4, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        e = {name = "E", type = "unholy", set = "card", level = 1, order = 5, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        f = {name = "F", type = "unholy", set = "card", level = 1, order = 6, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        g = {name = "G", type = "unholy", set = "card", level = 1, order = 7, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        h = {name = "H", type = "unholy", set = "card", level = 1, order = 8, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        i = {name = "I", type = "unholy", set = "card", level = 1, order = 9, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        j = {name = "J", type = "unholy", set = "card", level = 1, order = 10, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        k = {name = "K", type = "unholy", set = "card", level = 1, order = 11, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        l = {name = "L", type = "unholy", set = "card", level = 1, order = 12, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        m = {name = "M", type = "unholy", set = "card", level = 1, order = 13, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        n = {name = "N", type = "unholy", set = "card", level = 1, order = 14, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        o = {name = "O", type = "unholy", set = "card", level = 1, order = 15, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        p = {name = "P", type = "unholy", set = "card", level = 1, order = 16, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        q = {name = "Q", type = "unholy", set = "card", level = 1, order = 17, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        r = {name = "R", type = "unholy", set = "card", level = 1, order = 18, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        s = {name = "S", type = "unholy", set = "card", level = 1, order = 19, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        t = {name = "T", type = "unholy", set = "card", level = 1, order = 20, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        u = {name = "U", type = "unholy", set = "card", level = 1, order = 21, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        v = {name = "V", type = "unholy", set = "card", level = 1, order = 22, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        w = {name = "W", type = "unholy", set = "card", level = 1, order = 23, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        x = {name = "X", type = "unholy", set = "card", level = 1, order = 24, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        y = {name = "Y", type = "unholy", set = "card", level = 1, order = 25, config = {drawn = true, retained = false, discarded = false, swapped = false}},
        z = {name = "Z", type = "unholy", set = "card", level = 1, order = 26, config = {drawn = true, retained = false, discarded = false, swapped = false}},
    }

    self.triggers = {
        held = {condition = "held", type = "any", num = 1},
        draw = {condition = "draw", type = "any", num = 1},
        discard = {condition = "discard", type = "any", num = 1},
        rand = {condition = "random", prob = 1.0},
    }

    self.extra_conditions = {
        -- max determines the number of times that the extra effect can trigger. if condition should be infinite, set to 999 to prevent infinite loops (or set to 999 in implementation)
        held = {condition = "held", type = "any", pos = {}, max = 1},
        discard = {condition = "discard", type = "any", max = 1},
        draw = {condition = "draw", type = "any", max = 1},
        res = {condition = "resource", type = "any", max = 1}
    }

    self.spell_effects = {
        draw = {trigger = nil, set = "cards", effect = "draw", type = "any", num = 1, extra_condition = nil, extra = {num = 1}},
        discard = {trigger = nil, set = "cards", effect = "discard", type = "any", extra_condition = nil, num = 1, extra = {num = 1}},
        swap = {trigger = nil, set = "swap", effect = "swap", type = "any"},
        aoe_dmg = {trigger = nil, set = "damage", effect = "aoe damage", num = 1, extra_condition = nil, extra = {num = 1}},
        st_dmg = {trigger = nil, set = "damage", effect = "single target damage", extra_condition = nil, num = 1, extra = {num = 1}},
        shield = {trigger = nil, set = "shield", effect = "shield", num = 1, extra_condition = nil, extra = {num = 1}},
    }

    self.channels = {
        instant = {channel = "instant"},
        standard = {channel = "standard", length = 1},
        channel = {channel = "channel", length = 2},
        plus_one = {channel = "+1", length = 2},
        hold = {channel = "hold", length = 2},
    }

--[[

table formatting for spells:
spell_name = {name = "spell name", type = "type", set = "spell", order = #, pos = {x = #, y = #},
config = {effects = {{effect = "first effect description", other configs}, {effect = "second effect description", other configs}}}
}

this is a very bare-bones description of how the spell will work. treat it more like a table of constants that can be modified and changed.
For common effects such as aoe damage or force-discards, the card effect can be easily implemented. for more complex spell effects, theyre effects will beginning hard coded based on name.
spell descriptions will be externally generated since they are mutable

* means property is optional
OR means an effect cannot have both properties
AND means that both properties must exist or the spell will /set to some default value

every effect has an optional trigger property where the effect will not take place if the trigger condition is not met. 
trigger = {
    condition = "condition",
    config = {
        *configs*
    }
}

triggers: 
- last drawn
    - type = "type" if the last drawn card is not of type, do not trigger
    - prev = # if prev = 1, skips the last drawn card and checks the second to last drawn card. for checking multiple drawn cards

- last discarded
    - type = "type" if the last discarded card is not of type, do not trigger
    - prev = # if prev = 1, skips the last discarded card and checks the second to last discarded card. for checking multiple discarded cards

- random
    - prob = 0.## probability of effect triggering

- held
    - type = "type" type of card held
    - num = # number of cards held in hand for the effect to trigger 

extra_condition and extra properties will increase the effect of the card if the extra_condition is met. depending on spell effect, the extra condition will be a table that includes the configs for the extra effect
the difference between a trigger and an extra condition is that the trigger will decide whether the effect will take place or not, while the extra_condition increases the power of the effect that is about to take place

extra conditions: 
- "last drawn"
    - type = "type" if the last drawn card is not of type, do not trigger
    - prev = # if prev = 1, skips the last drawn card and checks the second to last drawn card. for checking multiple drawn cards

- "last discarded"
    - type = "type" if the last discarded card is not of type, do not trigger
    - prev = # if prev = 1, skips the last discarded card and checks the second to last discarded card. for checking multiple discarded cards

- "+1" this extra condition must be added to a spell of "+1" type. if the spell is casted with +1, then the spell effect will be modified

- cards drawn
    - type = "type" if this type of card is drawn, then the extra is added to the spell effect works while channeling

- "held"
    - pos = {...} or {} checks for certain hand positions. if table is empty, check all hand positions
    - type = "type" if the held hand 
    - max = # max number of times the extra can be added

effects: 
- buff spell
    - WIP
- draw
    - num = # number of cards to force discard OR range = {min = #, max = #} range of random # of cards that it can drawn
    - specific* = "type" draw specific type of card from draw pile, if not in draw pile then dont draw anything
    - save* = bool saves the drawn card(s) to some variable so that it can be accessed in later spell effects

- force discard
    - num = # number of cards to force discard OR range = {min = #, max = #} range of random # of cards that it can discard
    - specific* = "type" discard specific type of card from hand
    - save* = bool saves saves the discarded card(s) to some variable so that it can be accessed in later spell effects

- swap: swaps two cards positions

- aoe damage and single target damage
    - dmg = # amount of damage OR range = {min = #, max = #} range of damage to randomly select

- random target damage
    - dmg = # number of cards to force discard OR range = {min = #, max = #} range of damage to randomly select
    - num* = # number of random enemies that it (cannot trigger multiple times on same enemy) defaults to 1 if nil

- shielding
    - shield = # number of cards to force discard OR range = {min = #, max = #} range of shielding to randomly select

there are different types of channels for spells. This affects the time it takes for a spell to take place in terms of turn numbers

channels:
- instant: the spell will immediately take place without any countdown. Typically a weaker effect but good short-term gain. If drawing/discarding/swapping cards, more satisfying if it is a instant cast so that it can benefit channeled spells
- channel: the spell takes a certain number of turns to take effect
    - cancel* = bool: determines whether a spell can be canceled in the middle of casting
    - length = # number of turns it takes for the spell to take place
- hold: the spell will channel and not cast after the channel has ended. the player now has an opportunity to cancel the held spell whenever they want and trigger its full effect\
    - length = # number of turns it takes for the spell to take place
- +1: the user can decide while casting whether the spell can take one extra turn to take place. this can be for strategic purposes or can increase effectiveness of spell if specified in effect

]]

    self.arcane_dmg_spells = {
        fireball = {name = "Fireball", type = "arcane", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 0, y = 0}, tier = 1, effects = {}},
        lightning_arc = {name = "Lightning Arc", type = "arcane", set = "spell", channel = nil, discovered = false, order = 2, pos = {x = 1, y = 0} , tier = 1, effects = {}},
        mega_laser = {name = "Mega Laser", type = "arcane", set = "spell", channel = nil, discovered = false, order = 3, pos = {x = 2, y = 0}, tier = 3, effects = {}},
    }

    self.arcane_card_spells = {

    }

    self.arcane_buff_spells = {

    }

    self.arcane_shield_spells = {

    }

    self.hemo_dmg_spells = {
        blood_spikes = {name = "Blood Spikes", type = "hemo", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 0, y = 0}, tier = 1, effects = {},},
    }

    self.hemo_card_spells = {
        dash = {name = "Dash", type = "hemo", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 1, y = 0}, tier = 1, effects = {}},
        jump = {name = "Jump", type = "hemo", set = "spell", channel = nil, discovered = false, order = 2, pos = {x = 2, y = 0}, tier = 1, effects = {}},
    }

    self.hemo_buff_spells = {

        harden_blood = {name = "Harden Blood", type = "hemo", set = "spell", channel = nil, discovered = false,  order = 3, pos = {x = 3, y = 0}, tier = 1, effects = {}},
    }

    self.hemo_shield_spells = {

    }

    self.holy_dmg_spells = {
        arrows_of_light = {name = "Arrows of Light", type = "holy", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 0, y = 0}, tier = 1, effects = {}},
    }

    self.holy_card_spells = {

    }

    self.holy_buff_spells = {
        meditate = {name = "Meditate", type = "holy", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 1, y = 0}, tier = 2, effects = {}},
    }

    self.unholy_dmg_spells = {
        brimstone_explosion = {name = "Brimstone Explosion", type = "unholy", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 0, y = 0}, tier = 1, effects = {}},
    }

    self.unholy_card_spells = {

    }

    self.unholy_buff_spells = {

    }

    self.unholy_shield_spells = {

    }
end

function Game:initProfile()

    ArcaneCardEffects = require "game.cards.arcane_card_effects"
    HemoCardEffects = require "game.cards.hemo_card_effects"
    HolyCardEffects = require "game.cards.holy_card_effects"
    UnholyCardEffects = require "game.cards.unholy_card_effects"
    -- TODO: implement seed stuff
    self.seed = os.time()
    print(self.seed)
    math.randomseed(self.seed)
    self.deck = Deck()
    self.draw_pile = DrawPile()
    self.discard_pile = DiscardPile()

    -- TODO: adding cards is very brute-force currently but as more of the game gets programmed it will be more naturally implemented
    self.deck.addCard(Card(ArcaneCardEffects.A, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HemoCardEffects.B, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HolyCardEffects.C, CARD_SIZE_SCALE))
    self.deck.addCard(Card(UnholyCardEffects.D, CARD_SIZE_SCALE))
    self.deck.addCard(Card(ArcaneCardEffects.F, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HemoCardEffects.F, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HolyCardEffects.G, CARD_SIZE_SCALE))
    self.deck.addCard(Card(UnholyCardEffects.H, CARD_SIZE_SCALE))
    self.deck.addCard(Card(ArcaneCardEffects.A, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HemoCardEffects.B, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HolyCardEffects.C, CARD_SIZE_SCALE))
    self.deck.addCard(Card(UnholyCardEffects.D, CARD_SIZE_SCALE))
    self.deck.addCard(Card(ArcaneCardEffects.F, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HemoCardEffects.F, CARD_SIZE_SCALE))
    self.deck.addCard(Card(HolyCardEffects.G, CARD_SIZE_SCALE))
    self.deck.addCard(Card(UnholyCardEffects.H, CARD_SIZE_SCALE))
    self.draw_pile.addDeck(self.deck)

    local hand_x = Settings.window_dimensions[1] - 50 - HAND_WIDTH
    local hand_y = 520
    self.hand = HandDisplay(hand_x, hand_y, HAND_WIDTH, HAND_SIZE, self.draw_pile, self.discard_pile, CARD_SIZE_SCALE)

    local resource_display_x = 30
    local resource_display_y = 30
    self.resource_display = ResourceDisplay(resource_display_x, resource_display_y, 1)

    self.enemy_screen = EnemyScreen(COMBAT_BACKGROUND_IMG, BACKGROUND_IMG_X, BACKGROUND_IMG_Y, BACKGROUND_IMG_SCALE)
    self.enemy_screen.addEnemy(Enemy("skelly 1", WHITE_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))
    self.enemy_screen.addEnemy(Enemy("skelly 2", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {}))

    self.spells = {}
    local new_spell = Spell()
    new_spell:is("adsf")
    new_spell:copyFrom(self.arcane_dmg_spells.fireball)
    for k, v in pairs(self.arcane_dmg_spells.fireball) do
        new_spell[k] = v
    end
    -- fireball = {name = "Fireball", type = "arcane", set = "spell", channel = nil, discovered = false, order = 1, pos = {x = 0, y = 0}, tier = 1, effects = {}},
    new_spell.channel = "instant"
    -- st_dmg = {trigger = nil, set = "damage", effect = "single target damage", extra_condition = nil, num = 1, extra = {num = 1}},

    local e = Effect()
    e:copyFrom(self.spell_effects.aoe_dmg)
    e.num = 30
    table.insert(new_spell.effects, e)
    table.insert(self.spells, new_spell)
    new_spell.description = "hi"
    -- TODO: i dont really know where to move this function it should not be here
    function processSpell(spell)
        return function()
            for i, effect in ipairs(new_spell.effects) do
                -- TODO: check for trigger
                if effect.trigger then end
                if effect.set == "damage" then
                    local dmg = effect.num
                    if effect.effect == "single target damage" then
                        -- TODO: check for extra condition
                        if effect.extra_condition then end
                        self.controller.targetEnemy()
                        local fn = function()
                            self.controller.updateHp(self.controller.enemy_screen.selected_enemy, dmg)
                        end
                        self.controller.addEvent(fn)
                    elseif effect.effect == "aoe damage" then
                        -- TODO: check for extra condition
                        if effect.extra_condition then end
                        self.controller.aoeUpdateHp(dmg)
                    end
                end
            end
        end
    end
    new_spell.fn = processSpell(new_spell)
    -- table.insert(spells, Spells.fireball)
    -- table.insert(spells, Spells.arrows_of_light)
    self.controller = CombatController(self.deck, self.hand, self.draw_pile, self.discard_pile, self.enemy_screen, self.resource_display, self.spells)

end

function Game:startCombat(enemies)

end
