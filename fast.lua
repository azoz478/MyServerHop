-- 1. التأكد من تحميل الماب
if not game:IsLoaded() then game.Loaded:Wait() end
local player = game.Players.LocalPlayer

-- 2. إعداد الواجهة الثابتة
local screenGui = player.PlayerGui:FindFirstChild("AzozHub_Fast") or Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "AzozHub_Fast"
screenGui.ResetOnSpawn = false

local frame = screenGui:FindFirstChild("MainFrame") or Instance.new("Frame", screenGui)
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 220, 0, 70)
frame.Position = UDim2.new(0.5, -110, 0.05, 0) -- مكانها فوق بالوسط
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Draggable = true
frame.Active = true

local status = frame:FindFirstChild("StatusLabel") or Instance.new("TextLabel", frame)
status.Name = "StatusLabel"
status.Size = UDim2.new(1, 0, 1, 0)
status.TextColor3 = Color3.fromRGB(0, 255, 127) -- لون أخضر سريع
status.BackgroundTransparency = 1
status.TextSize = 16
status.Text = "جاري بدء الفرم السريع..."

-- 3. وظيفة السيرفر هوب القوية
local function fastServerHop()
    status.Text = "تغيير السيرفر (فوري)..."
    local ts = game:GetService("TeleportService")
    local http = game:GetService("HttpService")
    
    local success, servers = pcall(function()
        return http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success and servers.data then
        for _, server in pairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                pcall(function() ts:TeleportToPlaceInstance(game.PlaceId, server.id, player) end)
            end
        end
    end
    -- خطة بديلة لو علق
    task.wait(1)
    pcall(function() ts:Teleport(game.PlaceId, player) end)
end

-- 4. وظيفة الفرم (نقطة واحدة فقط)
local function startOnePointFarm()
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart", 10)
    
    if root then
        -- الإحداثي الأول حقك
        local target = CFrame.new(423.992432, -8.54999161, -340)
        
        status.Text = "الانتقال للنقطة الرئيسية..."
        root.CFrame = target
        
        task.wait(1.5) -- وقت لضمان إن اللعبة سجلت إنك أخذت الغرض
        
        fastServerHop()
    end
end

-- تشغيل السكربت فوراً
task.spawn(startOnePointFarm)
