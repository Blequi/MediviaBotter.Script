local Utilities = require("Utilities")
local Position = require("Position")
local Self = require("Self")

local Creatures = {}
Creatures.__index = Creatures

local creaturesEnumProc = nil
--[[
    summary:
        enumerate creatures filtering by a given predicate
    parameters:
        @match:
            the predicate to filter creatures
    returns:
        a pair i, list where i is the index that had a match in the list of creatures
]]
creaturesEnumProc = function(match)
    local list = getcreatures()
    local len = #list
    local res = nil
    local i = 1
    while (res == nil and i <= len) do
        if (match(i, list[i])) then
            res = i
        else
            i = i + 1
        end
    end
    return res, list
end

--[[
    summary:
        tries to find a creature by id or name
    parameters:
        @idOrName:
            creature id (number) or name (string) to search for
    returns:
        the first creature that had a match by id or name
]]
function Creatures.find(idOrName)
    local t = type(idOrName)
    
    local result = nil
    local i = nil
    local list = nil

    if (t == "string") then
        local name = idOrName:lower()
        i, list = creaturesEnumProc(
            function(i, c)
                return c.name:lower() == name
            end
        )
    elseif (t == "number") then
        i, list = creaturesEnumProc(
            function(i, c)
                return c.id == idOrName
            end
        )
    else
        error("Unsupported idOrName type: number or string expected, got " .. t)
    end

    if (i ~= nil) then
        result = list[i]
    end

    return result
end

--[[
    summary:
        lists all creatures on the screen
    returns:
        an iterator to loop through all the creatures on the screen
]]
function Creatures.onScreen()
    return coroutine.wrap(
        function()
            local id = Self.id()
            local pos = Self.pos()
            creaturesEnumProc(
                function(i, c)
                    if (c.id ~= id) then
                        local cpos = Position.new(c.x, c.y, c.z)
                        if (pos:dx(cpos) <= 7 and pos:dy(cpos) <= 5 and pos.z == cpos.z) then
                            coroutine.yield(c)
                        end            
                    end
                    return false
                end
            )
        end
    )
end

--[[
    summary:
        counts the number of creatures meeting some criteria
    parameters:
        @match:
            the predicate that a creature needs to satisfy
    returns:
        the number of creatures meeting some criteria
]]
function Creatures.count(match)
    local res = 0
    creaturesEnumProc(
        function(i, c)
            if (match(c)) then
                res = res + 1
            end
            return false
        end
    )
    return res
end

--[[
    summary:
        counts the number of creatures on screen with an optional name
    @name:
        the creature's name to count
    returns:
        the number of creatures on screen
]]
function Creatures.countOnScreen(name)
    local res = nil
    local pos = Self.pos()
    if (name == nil) then
        res = Creatures.count(
            function(c)
                local cpos = Position.new(c.x, c.y, c.z)
                return pos:dx(cpos) <= 7 and pos:dy(cpos) <= 5 and pos.z == c.z
            end
        )
    else
        local nameLower = name:lower()
        res = Creatures.count(
            function(c)
                local cpos = Position.new(c.x, c.y, c.z)
                return pos:dx(cpos) <= 7 and pos:dy(cpos) <= 5 and pos.z == c.z and c.name:lower() == nameLower
            end
        )
    end
    return res
end

return Utilities.readOnly(Creatures)