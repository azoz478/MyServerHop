-- 1. التأكد من أن الماب واللاعب محملين تماماً قبل أي شيء
if not game:IsLoaded() then game.Loaded:Wait() end
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- 2. إعداد الواجهة (Azoz Hub) - ResetOnSpawn عشان ما تروح
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "AzozHub_Auto"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 80)
frame.Position = UDim2.new(0.5, -110, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Draggable = true
frame.Active = true

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 1, 0)
status.Text = "Azoz Hubجاري الفارم ."
status.TextColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.TextSize = 18

-- 3. وظيفة التجميع الذاتي (تشتغل فوراً)
local function startInstantFarm()
    -- قائمة الإحداثيات
    local locations = {
        CFrame.new(423.992432, -8.54999161, -340, 1, 0, 0, 0, 1, 0, 0, 0, 1),
        CFrame.new(4985, 4.74950027, 532.574951, 1, 0, 0, 0, 1, 0, 0, 0, 1),
        CFrame.new(2246.75, -16.9999886, -245.317535, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    }

    -- تنفيذ الانتقال
    for i, target in ipairs(locations) do
        if root then
            root.CFrame = target
            task.wait(0.5) -- تأخير بسيط عشان اللعبة تلحق تسجل
        end
    end

    -- 4. السيرفر هوب التلقائي بعد النقاط الثلاث
    status.Text = "تم! جاري تبديل السيرفر..."
    task.wait(3) -- انتظار أمان قبل الخروج
    
    local ts = game:GetService("TeleportService")
    local http = game:GetService("HttpService")
    
    local success, servers = pcall(function()
        return http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success then
        for _, server in pairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                ts:TeleportToPlaceInstance(game.PlaceId, server.id, player)
                break
            end
        end
    end
end

-- تشغيل الفانكشن فوراً بمجرد عمل Execute للسكربت
task.spawn(startInstantFarm)
