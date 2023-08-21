local ServerStorage = game:GetService('ServerStorage')
local FURNITURE_FOLDER = ServerStorage.Furniture:GetChildren()

local Furniture = {}

Furniture.__index = Furniture

function Furniture.new(cframe, parent)
    local furniture = FURNITURE_FOLDER[math.random(#FURNITURE_FOLDER)]:Clone()
    furniture.Parent = parent
    furniture.CFrame = cframe -- random cframe for each furniture

    return furniture
end

return Furniture