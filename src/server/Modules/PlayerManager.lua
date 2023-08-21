-- work in server side

local PlayerManager = {}

function PlayerManager.GetMoney(player)
    local leaderstats = player:FindFirstChild('leaderstats')
    -- get money
    return 0 -- player money 
end

function PlayerManager.GetBackpack(player)
    local backpack = player.Backpack
    return backpack
end

return PlayerManager