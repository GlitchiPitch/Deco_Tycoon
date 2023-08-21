-- work in server side

local ServerStorage = game:GetService('ServerStorage')
local ServerScriptService = game:GetService('ServerScriptService')

local GameSettings = require(ServerScriptService.GameSettings)
local PlayerManager = require(ServerScriptService.PlayerManager)

local shopTemplate = ServerStorage.ShopTemplate
local Tools = ServerStorage.Tools

local Shop = {}


function Shop.new(workspaceFolder)
   -- create a shop build with seller and proximity prompt for each tools in the game
   -- every tool has cost we need detect player cash and clone tool (extactly tool in replicated storage) in player backapck
    local shop = shopTemplate:Clone()
    shop.Parent = workspaceFolder

    return shop
end

function Shop:SetupTools()
    for i, tool in pairs(Tools:GetChildren()) do
        
        local currentTool -- get from tool only models and parts
        
        local prompt = Instance.new('ProximityPrompt')
        prompt.Parent = currentTool -- or attachment

        prompt.Trigger:Connect(function(player)
            local checkMoney = GameSettings.Tools[tool.Name].cost <= PlayerManager.GetMoney(player)
            local checkTool = PlayerManager.GetBackpack(player):FindFirstChild(tool.name)
            if checkMoney and not checkTool then
                -- find current tool in server storage
                currentTool.Parent = PlayerManager.GetBackpack(player)
            end
        end)
    end
end

function Shop:AddSeller()
    local seller = 0
    -- seller must be animated talks simple phrases when player is closed
    return seller
end

return Shop