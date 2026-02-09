local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Creating the Main Window
local Window = OrionLib:MakeWindow({
    Name = "Server Management", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionSettings"
})

-- Adding a Tab
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Adding the Server Hop Button
MainTab:AddButton({
	Name = "Server Hop (20 Seconds)",
	Callback = function()
        -- Notification for the user
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
