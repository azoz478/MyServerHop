local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer

-- الرابط اللي يجيب قائمة السيرفرات المتاحة للماب
local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"

local function ServerHop()
    print("جاري البحث عن سيرفر جديد... 🔍")
    
    local Success, Body = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(Api))
    end)

    if Success and Body.data then
        for _, server in pairs(Body.data) do
            -- التأكد أن السيرفر ليس ممتلئاً وأنه ليس السيرفر الحالي
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
                return
            end
        end
    end
end

-- حلقة تكرار كل 20 ثانية
task.spawn(function()
    while true do
        print("تنبيه: سيتم تغيير السيرفر بعد 20 ثانية ⏳")
        task.wait(20)
        ServerHop()
    end
end)
