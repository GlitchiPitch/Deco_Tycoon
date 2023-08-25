-- work in server side

local PlayerManager = {}

function PlayerManager.PalyerData()
    -- get player data
end


function PlayerManager.GetMoney(player)
    local leaderstats = player:FindFirstChild('leaderstats')
    -- get money
    return 0 -- player money 
end

function PlayerManager.SetMoney(player, value)
    local leaderstats = player:FindFirstChild('leaderstats')
    local money = leaderstats:FindFirstChild('Money')
    money.Value = value
end

function PlayerManager.GetBackpack(player)
    local backpack = player.Backpack
    return backpack
end

return PlayerManager