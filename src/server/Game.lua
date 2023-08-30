local Map = workspace.Map

local Game = {}

Game.CreateGameEvents = function(eventsList)
    local events = Instance.new('Folder')
    for i, e in pairs(eventsList) do
        
        local event = Instance.new('BindableEvent')
        event.Parent = events
        -- event.Name = name
    end
end


Game.__index = Game

function Game.newGame(player)
    local self = setmetatable({}, Game)

    self.Map = Map

    return self
end

function Game:Init()
    
end

return Game