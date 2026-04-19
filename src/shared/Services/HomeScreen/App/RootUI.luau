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
			Name = "HomeScreenUI",
			Size = UDim2.fromScale(0.2, 0.65),
			Position = UDim2.fromScale(0.2, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,

			UIListLayout({
				Padding = UDim.new(0.1, 0),
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
			}),

			ImageLabel({
				Name = "Title",
				Image = "rbxassetid://82089064031617",
				Size = UDim2.fromScale(1, 0.08),
				Position = UDim2.fromScale(0.5, 0.15),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			}),

			ImageLabel({
				Name = "Play",
				Image = "rbxassetid://87351437959095",
				Size = UDim2.fromScale(0.6, 0.08),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			}),

			ImageLabel({
				Name = "Shop",
				Image = "rbxassetid://82309007576845",
				Size = UDim2.fromScale(0.6, 0.08),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			}),

			ImageLabel({
				Name = "Inventory",
				Image = "rbxassetid://127187451678895",
				Size = UDim2.fromScale(0.6, 0.08),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			}),

			ImageLabel({
				Name = "Credits",
				Image = "rbxassetid://78360608765452",
				Size = UDim2.fromScale(0.6, 0.08),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
			}),
		}),
	}
end

function UI.LoadingAssets()
	local loaded = source(0)
	local total = source(0)
	local skipToggle = source(false)

	local ani = source(1)

	local assets = game:GetDescendants()
	total(#assets)

	task.spawn(function()
		for i, obj in assets do
			ContentProvider:PreloadAsync({ obj })
			loaded(i)
			if i >= 400 then
				skipToggle(true)
			end

			task.wait()
		end

		if
			not Players.LocalPlayer.PlayerGui.HomeScreen:FindFirstChild("SKIP?")
			or not Players.LocalPlayer.PlayerGui.HomeScreen:FindFirstChild("LoadingScreen")
		then
			return
		end
		Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("LoadingScreen"):Destroy()
		Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("SKIP?"):Destroy()
	end)

	local function LOADINGUI()
		local ani_spring = spring(ani, 0.3, 1)

		return {
			ImageLabel({
				Name = "LoadingScreen",
				Image = "rbxassetid://94294209286544",
				Size = UDim2.fromScale(1, 1.25),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,

				TextLabel({
					Size = UDim2.fromScale(0.10, 0.1),
					Position = UDim2.fromScale(0.9, 0.8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Text = function()
						return loaded() .. "/" .. total()
					end,
					TextScaled = true,
					TextColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,

					UIStroke({
						Thickness = 1,
						Color = Color3.fromRGB(255, 255, 255),
					}),
				}),
			}),
			ImageButton({
				Name = "SKIP?",
				Image = "rbxassetid://113357488855196",
				Size = UDim2.fromScale(0.12, 0.07),
				Position = UDim2.fromScale(0.5, 0.8),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Visible = skipToggle,
				Activated = function()
					Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("LoadingScreen"):Destroy()
					Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"):WaitForChild("SKIP?"):Destroy()
				end,
				MouseEnter = function()
					ani(1.25)
				end,
				MouseLeave = function()
					ani(1)
				end,

				UIScale({
					Scale = ani_spring,
				}),
			}),
		}
	end

	mount(LOADINGUI, Players.LocalPlayer.PlayerGui:WaitForChild("HomeScreen"))
end

return UI
