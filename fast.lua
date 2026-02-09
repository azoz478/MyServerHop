local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer

-- وظيفة البحث عن سيرفر جديد
local function ServerHop()
    local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
    
    local Success, Body = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(Api))
    end)

    if Success and Body.data then
        for _, server in pairs(Body.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
                return
            end
        end
    end
end

-- حلقة التكرار (كل 10 ثوانٍ)
task.spawn(function()
    while true do
        print("⏳ جاري الانتظار 10 ثوانٍ قبل القفز للسيرفر التالي...")
        task.wait(10)
        ServerHop()
    end
end)
