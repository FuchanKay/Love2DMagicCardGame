local data = {}
-- the lua equivalent of a enum (its scuffed)
-- == in lua evaluates whether both variables are the same object. not the object value.
-- card_types.arcane == card_types.hemo will return false

data.card_types = {
    arcane = {},
    hemo = {},
    holy = {},
    unholy = {},
    mana = {},
    item = {},
    curse = {}
}
data.card_letter = {
    A = {},
    B = {},
    C = {},
    D = {},
    E = {},
    F = {},
    G = {},
    H = {},
    I = {},
    J = {},
    K = {},
    L = {},
    M = {},
    N = {},
    O = {},
    P = {},
    Q = {},
    R = {},
    S = {},
    T = {},
    U = {},
    V = {},
    W = {},
    X = {},
    Y = {},
    Z = {},
}

return data