local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 1. صنع الواجهة
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MyCustomMenu" -- اسم السكربت في النظام

-- 2. إطار القائمة (المربع)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- لون الخلفية
Instance.new("UICorner", MainFrame) -- عشان الزوايا تكون دائرية

-- 3. العنوان (هنا حط اسمك!)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "قائمة عزوز" -- اكتب اسمك هنا
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- 4. زر تجريبي (تقدر تسميه بكيفك)
local MyButton = Instance.new("TextButton", MainFrame)
MyButton.Size = UDim2.new(0, 200, 0, 45)
MyButton.Position = UDim2.new(0.5, -100, 0.5, 10)
MyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
MyButton.Text = "اضغط هنا يا وحش" -- سمِّ الزر هنا
MyButton.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", MyButton)

print("قائمتك الجديدة جاهزة!")
