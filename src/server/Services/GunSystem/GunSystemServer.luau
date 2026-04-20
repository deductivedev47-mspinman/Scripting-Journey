local RAYCASTEVENT = game.ReplicatedStorage.Assets.Remotes.GunEvent

local GunSystemServer = {}
GunSystemServer.__index = GunSystemServer

--> RAYCAST REMOTE EVENT
RAYCASTEVENT.OnServerEvent:Connect(function(plr, a)
	local part = Instance.new("Part", workspace)
	part.Position = a
	part.Size = Vector3.new(2, 2, 2)
	part.Anchored = true
	print(a)
end)

function GunSystemServer.new()
	local self = setmetatable({}, GunSystemServer)

	return self
end

return GunSystemServer
