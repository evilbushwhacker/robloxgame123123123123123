-- Juice for step 1: a "+$X" pop when you sell, and a camera shake when a meteor lands near you.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local remotes = ReplicatedStorage:WaitForChild("Remotes")

local gui = Instance.new("ScreenGui")
gui.Name = "Feedback"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

remotes:WaitForChild("CashPop").OnClientEvent:Connect(function(amount: number)
	local label = Instance.new("TextLabel")
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.Position = UDim2.fromScale(0.5, 0.45)
	label.Size = UDim2.fromScale(0.4, 0.12)
	label.BackgroundTransparency = 1
	label.Text = "+$" .. amount
	label.TextScaled = true
	label.Font = Enum.Font.FredokaOne
	label.TextColor3 = Color3.fromRGB(120, 255, 120)
	label.TextStrokeTransparency = 0
	label.Parent = gui
	local info = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(label, info, { Position = UDim2.fromScale(0.5, 0.3), TextTransparency = 1, TextStrokeTransparency = 1 }):Play()
	task.delay(1.2, label.Destroy, label)
end)

local SHAKE_RANGE = 60

remotes:WaitForChild("Impact").OnClientEvent:Connect(function(position: Vector3)
	local char = player.Character
	local humanoid = char and char:FindFirstChildOfClass("Humanoid")
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not humanoid or not root then
		return
	end
	local strength = 1 - (root.Position - position).Magnitude / SHAKE_RANGE
	if strength <= 0 then
		return
	end
	for _ = 1, 8 do
		humanoid.CameraOffset = Vector3.new(math.random() - 0.5, math.random() - 0.5, 0) * strength * 2
		task.wait(0.03)
	end
	humanoid.CameraOffset = Vector3.zero
end)
