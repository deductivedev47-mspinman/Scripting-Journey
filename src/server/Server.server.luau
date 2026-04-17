local ServerScriptService = game:GetService("ServerScriptService")
local zombieAI = require(ServerScriptService.Server.Services.ZombieAI)
local dude = zombieAI.init(workspace)
dude:Print()
