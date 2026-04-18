local Players = game:GetService("Players")
local Zombie = {}
Zombie.__index = Zombie -- This is gonna make the metatable put like module:health()

function Zombie.init(Model)
	local self = setmetatable({}, Zombie)

	self:Move(Model.Humanoid, workspace:WaitForChild("Spawnpoint").Position)
	self:HitboxPlr(true)

	return self
end

function Zombie:HitboxPlr(toggle)
	self.Enable_1 = toggle

	local function hitbox(pos, character)
		local part = Instance.new("Part")
		part.Parent = workspace
		part.Size = Vector3.new(6, 6, 6)
		part.Shape = "Ball"
		part.Anchored = true
		part.CanCollide = false
		part.Color = Color3.fromRGB(255, 0, 0)
		part.Transparency = 0.5
		part.Position = pos

		local params = OverlapParams.new()
		params.ExcludeInstances = { character }
		params.MaxParts = 100
		params.FilterType = Enum.RaycastFilterType.Exclude

		local touchedParts = workspace:GetPartBoundsInRadius(pos, 3, params)

		for _, instances in touchedParts do
			if instances.Name == "Torso" then
				print(instances.Parent)
			end
		end

		task.wait(0.2)
		part:Destroy()
	end

	task.spawn(function()
		Players.PlayerAdded:Connect(function(plr)
			while self.Enable_1 do
				local Char = plr.Character or plr.CharacterAdded:Wait()
				local HRP = Char.HumanoidRootPart
				local LookVectorPos = HRP.CFrame.LookVector * 3

				hitbox(HRP.Position + LookVectorPos, Char)

				task.wait(0.01)
			end
		end)
	end)
end

function Zombie:Move(HM: Humanoid, pos: Vector3)
	HM:MoveTo(pos)
end

return Zombie
