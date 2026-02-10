local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local flying = false
local speed = 100 -- تقدر تغير السرعة من هنا (100 تعتبر سريعة للاكتشاف)
local bv = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")

mouse.KeyDown:connect(function(key)
    if key:lower() == "e" then -- اضغط حرف (E) عشان تشغل أو تطفي الطيران
        flying = not flying
        if flying then
            bv.Parent = player.Character.HumanoidRootPart
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bg.Parent = player.Character.HumanoidRootPart
            bg.MaxGuiAngle = 400000
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            
            while flying do
                -- يخليك تطير باتجاه الكاميرا (وين ما تلتفت يروح)
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * speed
                bg.CFrame = workspace.CurrentCamera.CFrame
                task.wait()
            end
        else
            bv.Parent = nil
            bg.Parent = nil
        end
    end
end)

print("🚀 اضغط حرف E للطيران!")
