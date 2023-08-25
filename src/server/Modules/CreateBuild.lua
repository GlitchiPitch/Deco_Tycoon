local ServerStorage = game:GetService('ServerStorage')
local Furniture = require(ServerStorage.Furniture)


local Build = {}

Build.__index = Build

function Build.new(buildFolder)
    local self = setmetatable({}, Build)
    
    -- self.Build = 
    self.Parent = buildFolder
    self.CFrame = buildFolder.baseplate.CFrame

    self.Furniture = self:CreateFurniture()
    -- create build with different floors, wall color and material
    -- create a function which are making square build and wall must be created of many parts
    -- furnitures templates must be include into the build and they are created random
    -- every parts of build must has a tag : "Destroyable"

    return self
end

function Build:PrepareBuild()
    
end

function getCFrameForFurniture(baseplateCFrame)
    -- return random cframe of baseplateCFrame
end

function Build:CreateFurniture()

    local furnitureFolder = Instance.new('Folder')
    furnitureFolder.Name = 'Furniture'
    furnitureFolder.Parent = self.Parent

    -- everyfurniture model has a tag : "Furniture"

    for i = 1, 5 do -- random amount of furniture
        Furniture.new(getCFrameForFurniture(), furnitureFolder)
    end

    return furnitureFolder
end

return Build