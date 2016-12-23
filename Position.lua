local Utilities = require("Utilities")

local Position = {}
Position.__index = Position

--[[
    summary:
        creates a new instance of the Position class
    parameters:
        @x:
            a number representing the x position of an object, player, item, etc
        @y:
            a number representing the y position of an object, player, item, etc
        @z:
            a number representing the z position of an object, player, item, etc
    returns:
        a new instance of the Position class
]]
function Position.new(x, y, z)
    return setmetatable(
        {
            x = x,
            y = y,
            z = z
        },
        Position
    )
end

--[[
    summary:
        evaluates the horizontal distance between two positions
    parameters:
        @p:
            the other Position to get the horizontal distance
    returns:
        a number greater than or equal to zero
]]
function Position:dx(p)
    return math.abs(p.x - self.x)
end


--[[
    summary:
        evaluates the vertical distance between two positions
    parameters:
        @p:
            the other Position to get the vertical distance
    returns:
        a number greater than or equal to zero
]]
function Position:dy(p)
    return math.abs(p.y - self.y)
end

--[[
    summary:
        evaluates the distance (in floors) between two positions
    parameters:
        @p:
            the other Position to get the distance
    returns:
        a number greater than or equal to zero
]]
function Position:dz(p)
    return math.abs(p.z - self.z)
end

return Utilities.readOnly(Position)