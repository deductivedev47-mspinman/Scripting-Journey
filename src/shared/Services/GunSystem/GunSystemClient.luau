local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GunSystemClient = {}
GunSystemClient.__index = GunSystemClient

function GunSystemClient.init(player: Player)
	local self = setmetatable({}, GunSystemClient)

	self.Character = player.Character or player.CharacterAdded:Wait()
	self.Player = player
	self.VMContainer = game.ReplicatedStorage.Assets.Gun
	self.CurCamera = workspace.CurrentCamera

	return self
end

function GunSystemClient:ArmModel(toggle: boolean) end

function GunSystemClient:MonitorCamera(player) end

GunSystemClient.init(Players.LocalPlayer)

return GunSystemClient
