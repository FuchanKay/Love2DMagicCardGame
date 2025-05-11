-- copies table values of tb1 from tb2
-- does not copy reference for values that are tables
-- do NOT have tables whose properties refer to itself
-- EX:
--[[
local tb = {}
tb.x = tb
]]
-- OMG recursion!!! Thank you Software 1!!!
function copyFrom(tb1, tb2)
    for k, v in pairs(tb2) do
        if type(v) == "table" then
            tb1[k] = {}
            copyFrom(tb1[k], v)
        else
            tb1[k] = v
        end
    end
end