local ts = game:GetService("TweenService")
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local target = {CFrame = CFrame.new(913, -2.99, -2.66, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
local info = TweenInfo.new(10, Enum.EasingStyle.Linear)
local tween = ts:Create(root, info, target)
tween:Play()
