Game = Object:extend()

function Game:init()
    G = self

    G:setGlobals()
end

function Game:init_item_prototypes()

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

--[[

table formatting for spells:
spell_name = {name = "spell name", type = "type", set = "spell", order = #, pos = {x = #, y = #},
config = {effects = {{effect = "first effect description", other configs}, {effect = "second effect description", other configs}}}
}

this is a very bare-bones description of how the spell will work. treat it more like a table of constants that can be modified and changed.
For common effects such as aoe damage or force-discards, the card effect can be easily implemented. for more complex spell effects, theyre effects will beginning hard coded based on name.
spell descriptions will be externally generated since they are mutable

effect types:

* means property is optional
OR means an effect cannot have both properties

every effect has an optional trigger property where the effect will not take place if the trigger condition is not met. 
trigger = {
    condition = "last drawn cards",
    config = {
        num = 1,
        type = "arcane"
    }
}

- "draw"
    - num = # number of cards to force discard OR range = {min = #, max = #} range of random # of cards that it can drawn
    - specific* = "type" draw specific type of card from draw pile, if not in draw pile then dont draw anything
    - save* = bool saves the drawn card(s) to some variable so that it can be accessed in later spell effects

- "force discard"
    - num = # number of cards to force discard OR range = {min = #, max = #} range of random # of cards that it can discard
    - specific* = "type" discard specific type of card from hand
    - save* = bool saves saves the discarded card(s) to some variable so that it can be accessed in later spell effects

- aoe damage and single target damage
    - dmg = # amount of damage OR range = {min = #, max = #} range of damage to randomly select

- random target damage
    - dmg = # number of cards to force discard OR range = {min = #, max = #} range of damage to randomly select
    - num = # number of random enemies that it (cannot trigger multiple times on same enemy)

- aoe shielding and single target shielding
    - shield = # number of cards to force discard OR range = {min = #, max = #} range of shielding to randomly select

- random target shielding
    - shield = # number of cards to force discard OR range = {min = #, max = #} range of shielding to randomly select
    - num = # number of random enemies that it (cannot trigger multiple times on same enemy)

]]

    self.arcame_spells = {
        fireball = {
            name = "Fireball", type = "arcane", set = "spell", order = 1, pos = {x = 0, y = 0},
            effects = {
                {effect = "force discard", type = "any", discard = 2},
                {effect = "aoe damage", dmg = 10, extra_condition = "discarded cards", extra = {dmg = 10, type = "arcane", max = 2}},
            }
        },
        lightning_arc = {
            name = "Lightning Arc", type = "arcane", set = "spell", order = 2, pos = {x = 1, y = 0},
            effects = {
                {effect = "single target damage", aoe = true, dmg = 10, extra_condition = "discarded cards", extra = {dmg = 10, type = "arcane", max_held = 2}},
            }
        },
    }
    
    self.hemo_spells = {
        -- 
        blood_spikes = {name = "Blood Spikes", type = "hemo", set = "spell", order = 1, pos = {x = 0, y = 0}, config = {effects = {effect = "single target damage extra when held", aoe = true, dmg = 10, extra = {dmg = 10, type = "hemo", max_held = 2}}}},


    }

end