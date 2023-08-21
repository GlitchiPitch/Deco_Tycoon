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

MapSetup.newMap = function()
    
    local shop = Shop.new(WORKSPACE_FOLDER)
    -- create baseplate made of square, size SQUARE_SIZE
    -- after make a function which are making folders for each build, and it includs into squarePlate and build
    for i, buildFolder in pairs(WORKSPACE_FOLDER) do
        CreateBuild.new(buildFolder)
    end
    --[[
        WORKSPACE_FOLDER
            build1
                build : Folder
                plate
            ...
    ]]


end

return MapSetup