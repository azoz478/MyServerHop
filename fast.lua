local ts = game:GetService("TweenService")
local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

-- إحداثيات الحفرة (الهدف اللي أنت صورته)
local target = {CFrame = CFrame.new(913, -2.99, -2.66, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- سرعة عالية للهرب
local tween = ts:Create(root, info, target)

-- الحساس: ننتظر التسونامي يقرب
-- ملاحظة: لازم تتأكد من اسم التسونامي في الـ Explorer (مثلاً اسمه Wave)
local tsunami = workspace:FindFirstChild("Tsunami") -- غير الاسم للاسم الصحيح

while true do
    task.wait(0.1) -- يشيك كل لحظة
    if tsunami then
        -- إذا كانت المسافة بينك وبين التسونامي أقل من 50 متر مثلاً
        local distance = (root.Position - tsunami.Position).Magnitude
        if distance < 50 then 
            print("التسونامي قرب! انزل للحفرة!")
            tween:Play()
            break -- يوقف التشييك خلاص لأننا وصلنا
        end
    end
end
