local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CustomVide = require(ReplicatedStorage.Packages.CustomVide)
local TextLabel = CustomVide.TextLabel
local ImageButton = CustomVide.ImageButton
local ImageLabel = CustomVide.ImageLabel
local UIStroke = CustomVide.UIStroke
local UICorner = CustomVide.UICorner
local UIScale = CustomVide.UIScale
local UIListLayout = CustomVide.UIListLayout
local Frame = CustomVide.Frame

local Vide = require(ReplicatedStorage.Packages.Vide)
local spring = Vide.spring
local source = Vide.source
local root = Vide.root
local mount = Vide.mount

local UI = {}

function UI.MainUI()
	return {
		Frame({
			Name = "Nate",
		}),
	}
end

function UI.LoadingAssets()
	local animation = source(0)
	local spring = spring(animation, 0.5, 1)
	local loaded = source(0)
	local total = source(0)

	local assets = game:GetDescendants()
	total(#assets)

	task.spawn(function()
		for i, obj in assets do
			ContentProvider:PreloadAsync({ obj })
			loaded(i)
			task.wait()
		end
		local des = Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("LoadingScreen")
		des:Destroy()
	end)

	local function LOADINGUI()
		return {
			ImageLabel({
				Name = "LoadingScreen",
				Image = "rbxassetid://78042065722560",
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),

				TextLabel({
					Size = UDim2.fromScale(0.10, 0.1),
					Position = UDim2.fromScale(0.9, 0.9),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Text = function()
						return loaded() .. "/" .. total()
					end,
					TextScaled = true,
					TextColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,

					UIStroke({
						Thickness = 1,
						Color = Color3.fromRGB(175, 255, 164),
					}),
				}),
			}),
			ImageButton({
				Name = "SKIP?",
				Image = "rbxassetid://82079270614432",
				Size = UDim2.fromOffset(120, 40),
				Position = UDim2.fromScale(0.5, 0.9),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Visible = function()
					return loaded() >= 500
				end,
				Activated = function()
					Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("LoadingScreen"):Destroy()
					Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("SKIP?"):Destroy()
				end,
			}),
		}
	end

	mount(LOADINGUI, Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"))
end

return UI
