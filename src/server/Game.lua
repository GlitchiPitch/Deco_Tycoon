local Map = workspace.Map

local Game = {}

Game.__index = Game

function Game.newGame(player)
    local self = setmetatable({}, Game)

    self.Map = Map

    return self
end

function Game:Init()
    
end

return Game