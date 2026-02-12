local ts = game:GetService("TweenService")
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local target = {CFrame = CFrame.new(905.471802, -11.2686329, -585.484741, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
local info = TweenInfo.new(100, Enum.EasingStyle.Linear)
local tween = ts:Create(root, info, target)
tween:Play()
