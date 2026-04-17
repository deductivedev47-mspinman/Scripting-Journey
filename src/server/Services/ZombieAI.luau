local Zombie = {}
Zombie.__index = Zombie -- This is gonna make the metatable put like module:health()

function Zombie.init(model)
	local self = setmetatable({}, Zombie)
	self.PRINTME = model.Name
	return self
end

function Zombie:Print()
	print(self.PRINTME)
end

return Zombie
