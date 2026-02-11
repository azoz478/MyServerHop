-- 1. استدعاء مكتبة Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 2. إنشاء نافذة السكربت
local Window = OrionLib:MakeWindow({
    Name = "My Custom Script", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest"
})

-- 3. إضافة قسم (Tab)
local MainTab = Window:MakeTab({
	Name = "الرئيسية",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- 4. إضافة زر الانتقال (Teleport) للإحداثيات التي اخترتها أنت
MainTab:AddButton({
	Name = "انتقال للإحداثيات (100, 5, 88)",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 5, 88)
  	end    
})

-- 5. إضافة زر للقفز العالي (Super Jump)
MainTab:AddButton({
	Name = "قفزة خارقة",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
  	end    
})

-- 6. إنهاء السكربت (ضروري لكي تظهر القائمة)
OrionLib:Init()
