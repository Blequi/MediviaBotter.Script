# Script

Adding OO to MediviaBotter scripting API

# Creatures Module

This module eases the process to deal with creatures allowing you to search, sort and much more

## How to find a creature by id

```lua
-- print your own name
local id = Self.id()
local c = Creatures.find(id)
if (c == nil) then
    print("creature with id " .. id .. " was not found"))
else
    print(c.name)
end
```

## How to find a creature by name

```lua
-- tries to find a 'bug'
local c = Creatures.find("bug")
if (c == nil) then
    print("creature with name 'bug' was not found"))
else
    print(c.name)
end
```

## How to loop through all the creatures on the screen

```lua
for creature in Creatures.onScreen() do
    print(creature.name)
end
```

## How to count creatures containing name starting with 'GM '

```lua
print(
    Creatures.count(
        function(c)
            return c.name:find("GM ") == 1
        end
    )
)
```

## How to count creatures on the screen with a given name

```lua
print(Creatures.countOnScreen("rat"))
```
