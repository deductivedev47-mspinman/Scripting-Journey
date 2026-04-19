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

	self:MonitorCamera(player)

	return self
end

function GunSystemClient:ArmModel(toggle: boolean)
	if toggle then
		if workspace.Camera:FindFirstChild("ViewModel") then
			return
		end

		local vm = self.VMContainer.ViewModel:Clone()
		vm.Parent = self.CurCamera
		local ofCam = CFrame.new(0, 0, 0)

		local function VMFOLLOWCAMERA()
			if not workspace.Camera:FindFirstChild("ViewModel") or not vm:FindFirstChild("HumanoidRootPart") then
				return
			end
			vm.HumanoidRootPart.CFrame = self.CurCamera.CFrame * ofCam + Vector3.new(0, -0.9, 0)
		end
		RunService.RenderStepped:Connect(VMFOLLOWCAMERA)
	else
		if workspace.Camera:FindFirstChild("ViewModel") then
			workspace.Camera.ViewModel:Destroy()
		end
	end
end

function GunSystemClient:MonitorCamera(player)
	local camera = workspace.Camera

	local function ToggleArmModel()
		local attribute = camera:GetAttribute("Enabled")
		if attribute then
			self:ArmModel(true)
		else
			self:ArmModel(false)
		end
	end

	camera:GetAttributeChangedSignal("Enabled"):Connect(ToggleArmModel)

	RunService.RenderStepped:Connect(function()
		self.Character = player.Character or player.CharacterAdded:Wait()
		self.CameraPos = (self.CurCamera.CFrame.Position - self.Character.Head.Position).Magnitude
		if self.CameraPos >= 0.9 then
			camera:SetAttribute("Enabled", false)
			return
		end
		camera:SetAttribute("Enabled", true)
	end)
end

GunSystemClient.init(Players.LocalPlayer)

return GunSystemClient
