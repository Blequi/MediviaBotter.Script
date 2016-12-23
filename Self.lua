local Utilities = require("Utilities")
local Position = require("Position")

local Self = {}
Self.__index = Self

--[[
    summary:
        gets the x, y and z Position of the character
    returns:
        a new instance of the Position class
]]
function Self.pos()
    return Position.new(posx(), posy(), posz())
end

--[[
    summary:
        gets the x location of the character
    returns:
        a number
]]
function Self.x()
    return posx()
end


--[[
    summary:
        gets the y location of the character
    returns:
        a number
]]
function Self.y()
    return posy()
end

--[[
    summary:
        gets the z location of the character
    returns:
        a number
]]
function Self.z()
    return posz()
end

--[[
    summary:
        gets the character's id
    returns:
        a number
]]
function Self.id()
    return id()
end

--[[
    summary:
        gets the character's hp
    returns:
        a number
]]
function Self.hp()
    return gethp()
end


--[[
    summary:
        gets the character's maximum hp
    returns:
        a number
]]
function Self.maxhp()
    return getmaxhp()
end


--[[
    summary:
        gets the character's mana
    returns:
        a number
]]
function Self.mp()
    return getmana()
end


--[[
    summary:
        gets the character's maximum mana
    returns:
        a number
]]
function Self.maxmp()
    return getmaxmana()
end

return Utilities.readOnly(Self)