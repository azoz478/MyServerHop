-- Essential Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 1. Create Loading UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Loader"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 100)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim2.new(0, 10)

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0, 50)
TextLabel.Text = "Loading Hub..."
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 20
TextLabel.Parent = MainFrame

local BarBack = Instance.new("Frame")
BarBack.Size = UDim2.new(0, 260, 0, 10)
BarBack.Position = UDim2.new(0.5, -130, 0.7, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarBack.Parent = MainFrame

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
Bar.Parent = BarBack

-- Loading Animation (3 Seconds)
local tween = TweenService:Create(Bar, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()

tween.Completed:Connect(function()
    ScreenGui:Destroy() -- حذف شاشة التحميل بعد الانتهاء
    
    -- 2. NOW START ORION LIB (واجهة الأزرار حقك)
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({
        Name = "Server Management", 
        HidePremium = false, 
        SaveConfig = true, 
        ConfigFolder = "OrionSettings"
    })

    local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    MainTab:AddButton({
        Name = "Server Hop (20 Seconds)",
        Callback = function()
            OrionLib:MakeNotification({
                Name = "System Message",
                Content = "Teleporting to a new server in 20 seconds...",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            task.wait(20)
            local ts = game:GetService("TeleportService")
            ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
        end    
    })

    OrionLib:Init()
end)
