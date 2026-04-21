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
	self.RAYCASTBOOLEAN = true

	Players.PlayerAdded:Connect(self.GATHERPLAYERS)
	Players.PlayerRemoving:Connect(self.REMOVEPLAYERS)

	--> RAYCAST REMOTE EVENT
	RAYCASTEVENT.OnServerEvent:Connect(function(plr, a)
		if not a then
			return
		end
		local character = plr.Character or plr.CharacterAdded:Wait()

		local part = Instance.new("Part")
		part.Name = "HitBOx"
		part.Parent = workspace
		part.Size = Vector3.new(0.01, 0.01, 0.01)
		part.Anchored = true
		part.Shape = "Ball"
		part.Position = a

		local params = OverlapParams.new()
		params.ExcludeInstances = { character }
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.MaxParts = 1000

		local parts = workspace:GetPartBoundsInRadius(part.Position, 3, params)

		for _, instances in parts do
			if instances then
				if self.RAYCASTBOOLEAN then
					self.RAYCASTBOOLEAN = false
					print(self.T_PLRS)
					task.delay(0.2, function()
						self.RAYCASTBOOLEAN = true
					end)
				end
			end
		end
	end)

	return self
end

function GunSystemServer:GatherPlayers(plr)
	table.insert(self.T_PLRS, plr.Name)
end

function GunSystemServer:RemovePlayers(plr)
	for numbers, plrs in self.T_PLRS do
		if plrs == plr.Name then
			print(numbers)
			table.remove(self.T_PLRS, numbers)
		end
	end
end

return GunSystemServer
