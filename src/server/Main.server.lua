local PlayerManager = require(game:GetService('ReplicatedStorage').PlayerManager)


game.Players.PlayerAdded:Connect(function(player)
    PlayerManager.newPlayer(player)
end)