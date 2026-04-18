local Zombie = {}
Zombie.__index = Zombie -- This is gonna make the metatable put like module:health()

function Zombie.init(Model)
	local self = setmetatable({}, Zombie)

	--> The place for changing values. EXAMPLE: Model.HumanoidRootPart.Position Changes, if you print the position here it would print the currentvalue
	self.Print = function()
		print(Model.Name, Model.HumanoidRootPart.Position)

		if self.plrHRP then
			print(self.plrHRP.Parent.Name, self.plrHRP.Position)
		end
	end

	self:Move(Model.Humanoid, workspace:WaitForChild("Spawnpoint").Position)
	self:Run(true)

	return self
end

function Zombie:FindPlayers(plrHRP)
	self.plrHRP = plrHRP
end

function Zombie:Run(toggle)
	self.Toggle = toggle
	task.spawn(function()
		while self.Toggle do
			self.Print()
			task.wait(2)
		end
	end)
end

function Zombie:Move(HM: Humanoid, pos: Vector3)
	HM:MoveTo(pos)
end

return Zombie
