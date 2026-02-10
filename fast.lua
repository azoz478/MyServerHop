-- 1. انتظر تحميل الشخصية
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- 2. تحديد مكان النقاط (المسار اللي صوره في Dex)
local moneyMap = game:GetService("ReplicatedStorage").Assets.MapVariants.MoneyMap
local indicators = moneyMap:GetChildren() -- بيجيب الثلاثة كلهم

print("🏁 بدأنا العملية.. عندنا " .. #indicators .. " نقاط لازم نمر عليها.")

-- 3. حلقة تكرار تمر على كل نقطة
for i, part in ipairs(indicators) do
    if part:IsA("BasePart") or part:IsA("Model") then
        print("📍 ننتقل للنقطة رقم: " .. i)
        
        -- النقل السريع
        if part:IsA("Model") then
            rootPart.CFrame = part:GetModelCFrame()
        else
            rootPart.CFrame = part.CFrame
        end
        
        task.wait(1.5) -- ننتظر ثانية ونص عشان السيرفر يسجل إنك لمستها
    end
end

print("✅ كفو! خلصنا الثلاثة. الحين بننحاش لسيرفر ثاني...")

-- 4. كود الـ Server Hop (تغيير السيرفر)
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local function Jump()
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
    local success, result = pcall(function()
        local body = HttpService:JSONDecode(game:HttpGet(url))
        for _, server in pairs(body.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
                return
            end
        end
    end)
    
    if not success then
        warn("⚠️ فشل النقل، بحاول مرة ثانية...")
        task.wait(2)
        Jump()
    end
end

Jump()
