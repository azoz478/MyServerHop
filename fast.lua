local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local ts = game:GetService("TeleportService")
local http = game:GetService("HttpService")

-- 1. قائمة الإحداثيات الثلاثة بالترتيب
local locations = {
    CFrame.new(423.992432, -8.54999161, -340, 1, 0, 0, 0, 1, 0, 0, 0, 1),  -- النقطة الأولى
    CFrame.new(4985, 4.74950027, 532.574951, 1, 0, 0, 0, 1, 0, 0, 0, 1),    -- النقطة الثانية
    CFrame.new(2246.75, -16.9999886, -245.317535, 1, 0, 0, 0, 1, 0, 0, 0, 1) -- النقطة الثالثة
}

-- 2. تنفيذ الأوتو فارم
print("بدء الأوتو فارم...")
for i, target in ipairs(locations) do
    print("الانتقال للمرحلة: " .. i)
    root.CFrame = target
    task.wait(3) -- وقت انتظار (3 ثواني) لضمان تسجيل النقاط
end

-- 3. السيرفر هوب (الانتقال لسيرفر آخر)
print("تمت المهمة! جاري البحث عن سيرفر جديد...")
local function serverHop()
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

serverHop()
