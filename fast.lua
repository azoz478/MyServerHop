-- 1. تعريف المحركات واللاعب
local ts = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- 2. إعدادات الوجهة (الحفرة) والسرعة
local target = {CFrame = CFrame.new(913, -2.99, -2.66, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
local tween = ts:Create(root, info, target)

-- 3. نظام الحساس (يراقب الموب في الورك سبيس)
-- ملاحظة: تأكد أن اسم "Tsunami" مطابق للاسم في DEX
print("نظام الدفاع شغال.. بانتظار الموجة!")

while true do
    task.wait(0.1)
    
    -- البحث عن التسونامي في كل مكان داخل الـ Workspace
    local tsunami = workspace:FindFirstChild("Tsunami", true)
    
    if tsunami and tsunami:IsA("BasePart") then
        local distance = (root.Position - tsunami.Position).Magnitude
        
        -- إذا قرب التسونامي (أقل من 50 متر) ينزلك فوراً
        if distance < 50 then 
            print("خطر! الموجة قريبة، جاري الهروب للحفرة!")
            tween:Play()
            break -- يوقف السكربت بعد ما يوصلك بسلام
        end
    end
end
