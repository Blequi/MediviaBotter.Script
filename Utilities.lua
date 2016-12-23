local Utilities = {}
Utilities.__index = Utilities

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