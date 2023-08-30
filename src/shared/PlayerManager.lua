local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerEvents = ReplicatedStorage:WaitForChild('PlayerEvents')
local GameEvents = ReplicatedStorage:WaitForChild('GameEvents')

local PlayerManager = {}

PlayerManager.__index = PlayerManager

function PlayerManager.newPlayer(player)
    local self = setmetatable({}, PlayerManager)

    self.Player = player

    self.Events = PlayerEvents
    
    return self
end

function PlayerManager:GetPlayerData()
    
end

function PlayerManager:Init()

    self.Data = self:GetPlayerData()
    self.Gui = self:SetupGui()
    self.UserInterface = self:SetupUserInterface()

end

function PlayerManager:SetupGui()
    
end

function PlayerManager:SetupUserInterface()
    
end

function PlayerManager:StartGame()
    
end



return PlayerManager