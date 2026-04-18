local SpawnPoint = workspace.Lobby.SpawnPoint
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		plr.Character:MoveTo(SpawnPoint.Position)
	end)
end)
