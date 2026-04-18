local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RootUI = require(script.Parent.RootUI)
local Vide = require(ReplicatedStorage.Packages.Vide)
local mount = Vide.mount

return function()
	local container = Instance.new("ScreenGui")
	container.Name = "HomeScreen"
	container.Parent = Players.LocalPlayer.PlayerGui
	container.IgnoreGuiInset = true
	container.ResetOnSpawn = false
	container.ClipToDeviceSafeArea = false
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	mount(RootUI.MainUI, container)
end

--> 16, 32, 17062
