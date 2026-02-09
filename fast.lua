-- كود عزوز: قفز تلقائي كل 10 ثواني بدون توقف
repeat task.wait() until game:IsLoaded() -- انتظر الماب يفتح

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local function Jump()
    local success, result = pcall(function()
        -- يجيب قائمة بـ 100 سيرفر
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
        
        for _, s in pairs(servers.data) do
            -- يختار سيرفر مو ممتلئ ومو سيرفرك الحالي
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, game.Players.LocalPlayer)
                return true
            end
        end
    end)
    
    if not success then
        warn("⚠️ فشل النقل، بحاول ثانية...")
        task.wait(2)
        Jump()
    end
end

-- انتظر 10 ثواني بالضبط قبل ما تنتقل
task.wait(10)
Jump()
