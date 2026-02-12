local ts = game:GetService("TweenService")
local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

-- الوجهة (حط إحداثياتك الجديدة هنا)
local goal = {CFrame = CFrame.new(913, 10, -2.6)}

-- السرعة: هنا السرعة الخارقة (نص ثانية فقط!)
local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear)

local flyTween = ts:Create(root, info, goal)
flyTween:Play()

print("انطلقناااا!")
