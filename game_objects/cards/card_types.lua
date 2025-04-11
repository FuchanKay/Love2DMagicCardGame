local card_types_module = {}
-- the lua equivalent of a enum (its scuffed)
-- == in lua evaluates whether both variables are the same object. not the object value.
-- card_types.arcane == card_types.hemo will return false
card_types_module.card_types = {
    arcane = {},
    hemo = {},
    holy = {},
    unholy = {},
    mana = {},
    item = {},
    curse = {}
}
return card_types_module