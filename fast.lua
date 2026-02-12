local ts = game:GetService("TweenService")
local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

-- الوجهة (حط إحداثياتك الجديدة هنا)
local goal = {CFrame = CFrame.new(905.471802, -11.2686329, -585.484741, 1, 0, 0, 0, 1, 0, 0, 0, 1}

-- السرعة: هنا السرعة الخارقة (نص ثانية فقط!)
local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear)

local flyTween = ts:Create(root, info, goal)
flyTween:Play()

print("انطلقناااا!")
