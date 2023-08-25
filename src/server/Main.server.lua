local PlayerManager = require(game:GetService('ServerScriptService').Modules.PlayerManager)
local MapSetup = require(game:GetService('ServerScriptService').Modules.MapSetup)


game.Players.PlayerAdded:Connect(function(player)
    local data = PlayerManager.PlayerData(player)
    MapSetup.Setup(player, data)
end)