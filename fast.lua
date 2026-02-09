local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId
local JobId = game.JobId

local function teleportToNewServer()
    -- الرابط المخصص لجلب قائمة السيرفرات المتاحة للعبة
    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success and result.data then
        for _, server in ipairs(result.data) do
            -- التأكد من أن السيرفر ليس هو السيرفر الحالي وأن فيه مكاناً شاغراً
            if server.id ~= JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id)
                return -- توقف بمجرد إيجاد سيرفر
            end
        end
    else
        warn("فشل في جلب قائمة السيرفرات، سأحاول مرة أخرى...")
    end
end

-- تكرار العملية كل 10 ثوانٍ
while true do
    task.wait(10) 
    print("جاري البحث عن سيرفر جديد...")
    teleportToNewServer()
end
