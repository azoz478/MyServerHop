local ts = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local root = player.Character:WaitForChild("HumanoidRootPart")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

-- 1. قائمة الإحداثيات (غير الأرقام حسب مابك)
local locations = {
    CFrame.new(423.992432, -8.54999161, -340, 1, 0, 0, 0, 1, 0, 0, 0, 1
,  -- المرحلة 1
    CFrame.new(1132.34985, 4.74950027, 532.574951, 1, 0, 0, 0, 1, 0, 0, 0, 1
),        -- المرحلة 2
    CFrame.new(2246.75, -16.9999886, -245.317535, 1, 0, 0, 0, 1, 0, 0, 0, 1)       -- المرحلة 3
}

-- 2. وظيفة السيرفر هوب (Server Hop)
local function serverHop()
    print("جاري البحث عن سيرفر جديد...")
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local PlaceId = game.PlaceId
    
    -- فنكشن بسيط يجيب سيرفرات عشوائية
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    for _, server in pairs(servers.data) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
            break
        end
    end
end

-- 3. تشغيل الخطة
for i, targetCFrame in ipairs(locations) do
    print("الانتقال للمرحلة: " .. i)
    root.CFrame = targetCFrame
    task.wait(3) -- انتظر 3 ثواني بكل مرحلة
end

-- بعد ما يخلص كل النقاط
print("تم الانتهاء! جاري تغيير السيرفر...")
task.wait(1)
serverHop()
