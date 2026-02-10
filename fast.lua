local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local part = character:WaitForChild("HumanoidRootPart") -- هذي "البلوكة" حقتك
local tweenservice = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(10, Enum.EasingStyle.Linear)
local target = {CFrame = CFrame.new(649, 10, 0)} -- الرقم 10 للارتفاع عشان ما تنحشر
