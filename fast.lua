-- 1. الخدمات الأساسية
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- 2. إعداد شاشة التحميل (Loading Screen)
local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
ScreenGui.Name = "AzozLoader"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 100)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", MainFrame)

local LoadingText = Instance.new("TextLabel", MainFrame)
LoadingText.Size = UDim2.new(1, 0, 0, 50)
LoadingText.Text = "Azoz Hub Loading..."
LoadingText.TextColor3 = Color3.new(1, 1, 1)
LoadingText.BackgroundTransparency = 1
LoadingText.TextSize = 20
LoadingText.Font = Enum.Font.GothamBold

-- أنيميشن الانتظار (3 ثواني)
task.wait(3)
ScreenGui:Destroy() -- حذف الشاشة وبدء السكربت

-- 3. تشغيل مكتبة التصميم (Orion Lib)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 4. صنع النافذة والقوائم
local Window = OrionLib:MakeWindow({
    Name = "Azoz Hub | V1", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionSettings"
})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- زر الـ Server Hop
MainTab:AddButton({
    Name = "Server Hop (الانتقال لسيرفر آخر)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end    
})

OrionLib:Init()
