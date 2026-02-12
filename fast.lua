-- 1. إعداد الواجهة مع خاصية الثبات عند الموت
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AzozHubGui"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false -- هذا السطر يخلي القائمة ما تختفي إذا مت

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Draggable = true
frame.Active = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Azoz Hub"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextSize = 20

local farmBtn = Instance.new("TextButton", frame)
farmBtn.Size = UDim2.new(0.8, 0, 0, 50)
farmBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
farmBtn.Text = "بدء التجميع 🚀"
farmBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
farmBtn.TextColor3 = Color3.new(1, 1, 1)

-- 2. وظيفة السيرفر هوب مع إعادة المحاولة الذكية
local function serverHop()
    local ts = game:GetService("TeleportService")
    local http = game:GetService("HttpService")
    
    farmBtn.Text = "بحث عن سيرفر..."
    
    while true do -- حلقة تكرار لين يلقى سيرفر ويدخلك
        local success, servers = pcall(function()
            return http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        end)
        
        if success then
            for _, server in pairs(servers.data) do
