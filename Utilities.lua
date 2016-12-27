local Utilities = {}
Utilities.__index = Utilities

--[[
    summary:
        makes a table read-only
    parameters:
        @t:
            the table to protect
    returns:
        a new table with read-only access. This means nobody can set fields
]]
function Utilities.readOnly(t)
    local tType = type(t)
    assert(tType == "table", "table expected, got " .. tType)
    
    local metatable = {
        __index = t,
        __newindex = function()
            error("Changes to this table are not allowed")
        end,
        __metatable = false
    }
    return setmetatable({}, metatable)
end

return Utilities.readOnly(Utilities)