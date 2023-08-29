local ServerStorage = game:GetService('ServerStorage')
local CollectionService = game:GetService('CollectionService')
local Furniture = require(ServerStorage.Furniture)


local Build = {}

Build.__index = Build

function Build.new(buildFolder) -- build
    local self = setmetatable({}, Build)
    
    -- self.Build = 
    self.Parent = buildFolder
    self.CFrame = buildFolder.baseplate.CFrame
    
    self.Model = self:CreateBuild()  --build
    self.Furniture = self:GetFurniture()
    


    -- create a function which are making square build and wall must be created of many parts
    -- furnitures templates must be include into the build and they are created random
    -- every parts of build must has a tag : "Destroyable"

    return self
end

function Build:CreateBuild()
    local build = Instance.new('Model')
    -- create build with different floors, wall color and material
    local furnitureAttachmentList = Instance.new('Folder')
    furnitureAttachmentList.Parent = build
    for index = 1,math.random(5) do
        local furnitureAttachment = Instance.new('Part')
        furnitureAttachment.Size = Vector3.new(.5,.5,.5)
        furnitureAttachment.Anchored = true
        -- furnitureAttachment.CFrame = 
        furnitureAttachment.Parent = furnitureAttachmentList
    end
    return build
end

function Build:PrepareBuild()
    for _, item in pairs(self.Model:GetDescendants()) do
        if item:IsA('Part') or item:IsA('UnionOperation') then
            -- возможно сделать список и там их указывать через индекс
            CollectionService:AddTag('Destroy')
        end
    end
end

function getCFrameForFurniture(baseplateCFrame)
    -- return random cframe of baseplateCFrame
end

function Build:GetFurniture()

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