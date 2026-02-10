-- هذي قائمة أهدافك
local myPoints = {
    Vector3.new(96, 151, 60),   -- النقطة الأولى
    Vector3.new(115, 151, 60),  -- النقطة الثانية
    Vector3.new(163, 162, 165)  -- النقطة الثالثة
}-- 1. قائمة إحداثياتك اللي طلعتها بيدك
local myPoints = {
    Vector3.new(96, 151, 60),
    Vector3.new(115, 151, 60),
    Vector3.new(163, 162, 165)
}

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- 2. تنفيذ الجولة مع انتظار 5 ثواني بين كل نقطة
for i, pos in ipairs(myPoints) do
    print("الانتقال للنقطة: " .. i)
    root.CFrame = CFrame.new(pos)
    
    task.wait(5) -- هنا الانتظار اللي طلبته (5 ثواني)
end

-- 3. بعد ما يخلص النقاط، يسوي Server Hop تلقائياً
print("خلصت الجولة.. جاري البحث عن سيرفر جديد")

local function serverHop()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local PlaceId = game.PlaceId
    
    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
                return
            end
        end
    end
end

serverHop()
local part = game.Players.LocalPlayer.Character.HumanoidRootPart
local tweenservice = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(5)
local target = {CFrame = CFrame.new(649, 10, 0)} -- حط إحداثيات DEX هنا
local create = tweenservice:Create(part, tweeninfo, target) -- صنع الحركة
create:Play() -- انطلق!
