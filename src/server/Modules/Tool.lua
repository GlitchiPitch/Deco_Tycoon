-- need setup tools for client side 

local ServerStorage = game:GetService('ServerStorage')
local ServerScriptService = game:GetService('ServerScriptService')
local CollectionService = game:GetService('CollectionService')

local PlayerManager = require(ServerScriptService.Modules.PlayerManager)

local GameSettings = require(ServerScriptService.GameSettings)

local Tools = ServerStorage.Tools:GetChildren()

local Tool = {}

Tool.__index = Tool

function Tool:SetupClientSide(player)
    for i, tool in pairs(Tools) do
        tool.Equipped:Connect(function(mouse)
            mouse.Button1Up:Connect(function()
                local target = mouse.Target
                if Tool:CheckTarget(target) == 'Destroyable' then
                    DestroyPart(target)
                    PlayerManager.SetMoney(PlayerManager.GetMoney(player) - 10)
                elseif Tool:CheckTarget(target) == 'Furniture' then
                    UnanchoredFurniture(target)
                    PlayerManager.SetMoney(PlayerManager.GetMoney(player) - 10)
                end
            end)
        end)
    end
    
end

function UnanchoredFurniture(target)
    for _, item in pairs(target:GetChildren()) do
        item.Anchored = false
        SetDebris(item)
    end
end

function DestroyPart(target)
    -- here we need to chech health of target
    
end

function SetDebris(item)
    game:GetService('Debris'):AddItem(item, 10)
end

function Tool:CheckTarget(target)
    return 'Destroyable' and CollectionService:HasTag(target, GameSettings.Tags.Destroyable) or 'Furniture' and CollectionService:HasTag(target, 'Furniture')
end

return Tool