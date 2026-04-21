local RAYCASTEVENT = game.ReplicatedStorage.Assets.Remotes.GunEvent

local GunSystemServer = {}
GunSystemServer.__index = GunSystemServer

--> RAYCAST REMOTE EVENT
RAYCASTEVENT.OnServerEvent:Connect(function(plr, a)
	if not a then
		return
	end
	local character = plr.Character or plr.CharacterAdded:Wait()

	local part = Instance.new("Part")
	part.Parent = workspace
	part.Size = Vector3.new(3, 3, 3)
	part.Shape = "Ball"
	part.Position = a

	local params = OverlapParams.new()
	params.ExcludeInstances = { character }
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.MaxParts = 1000

	local parts = workspace:GetPartBoundsInRadius(part.Position, 1.5, params)

	for _, instances in parts do
		print(instances.Name)
	end
end)

function GunSystemServer.new()
	local self = setmetatable({}, GunSystemServer)

	return self
end

return GunSystemServer
