-- the lua equivalent of a enum (its scuffed)
-- == in lua evaluates whether both variables are the same object. not the object value.
-- card_types.arcane == card_types.hemo will return false
local card_types_module = {
    unholy = {},
    hemo = {},
    unholy = {},
    unholy = {},
    mana = {},
    item = {},
    curse = {}
}
return card_types_module