-- work in server side

local ServerScriptService = game:GetService('ServerScriptService')
local ServerStorage = game:GetService('ServerStorage')
local CreateBuild = require(ServerScriptService.CreateBuild)
local Shop = require(ServerScriptService.Shop)

local MapSetup = {}

SQUARE_SIZE = 0
BASEPLATE_SIZE = 0

WORKSPACE_FOLDER = Instance.new('Folder')
WORKSPACE_FOLDER.Name = 'WORKSPACE_FOLDER'
WORKSPACE_FOLDER.Parent = workspace

-- maybe map will be huge map with buildings 
-- every things wil be destroyable and have index
-- 

MapSetup.Setup = function()
    
    -- create baseplate made of square, size SQUARE_SIZE
    -- after make a function which are making folders for each build, and it includs into squarePlate and build

    local index = 0
    for i = 1, 10 do
        for j = 1, 10 do
            local folder = Instance.new('Folder')
            folder.Parent = WORKSPACE_FOLDER
            folder.Name = 'Build' .. index + 1
            local part = Instance.new('Part')
            part.Parent = folder
        end
    end

    for i, buildFolder in pairs(WORKSPACE_FOLDER) do
        CreateBuild.new(buildFolder)
    end
    local shop = Shop.new(WORKSPACE_FOLDER)
    --[[
        WORKSPACE_FOLDER
            build1
                build : Folder
                plate
            ...
    ]]


end

return MapSetup