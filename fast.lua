print("1. Script Started!") -- بيطلع في الـ F9

-- شاشة التحميل
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local SG = Instance.new("ScreenGui", LP.PlayerGui)
local F = Instance.new("Frame", SG)
F.Size = UDim2.new(0,200,0,50)
F.Position = UDim2.new(0.5,-100,0.5,-25)
F.BackgroundColor3 = Color3.new(0,0,0)
local T = Instance.new("TextLabel", F)
T.Size = UDim2.new(1,0,1,0)
T.Text = "Loading Hub..."
T.TextColor3 = Color3.new(1,1,1)

task.wait(2)
SG:Destroy()
print("2. Loading Finished!")

-- استدعاء المكتبة
local success, err = pcall(function()
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Azoz Hub", HidePremium = false, SaveConfig = true})
    local Tab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998"})
    
    Tab:AddButton({
        Name = "Server Hop",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end    
    })
    
    OrionLib:Init()
end)

if not success then
    print("Error Found: " .. err) -- لو فيه خطأ بيعلمنا هنا
end
