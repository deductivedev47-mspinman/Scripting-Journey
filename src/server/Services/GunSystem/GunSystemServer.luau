local Players = game:GetService("Players")
local RAYCASTEVENT = game.ReplicatedStorage.Assets.Remotes.GunEvent

local GunSystemServer = {}
GunSystemServer.__index = GunSystemServer

function GunSystemServer.new()
	local self = setmetatable({}, GunSystemServer)
	self.T_PLRS = {} --> PLAYERS TABLE

	self.GATHERPLAYERS = function(plr)
		self:GatherPlayers(plr)
	end
	self.REMOVEPLAYERS = function(plr)
		self:RemovePlayers(plr)
	end

	Players.PlayerAdded:Connect(self.GATHERPLAYERS)
	Players.PlayerRemoving:Connect(self.REMOVEPLAYERS)

	return self
end

function GunSystemServer:GatherPlayers(plr)
	table.insert(self.T_PLRS, plr.Name)
end

function GunSystemServer:RemovePlayers(plr)
	for numbers, plrs in self.T_PLRS do
		if plrs == plr.Name then
			table.remove(self.T_PLRS, numbers)
		end
	end
end

return GunSystemServer
