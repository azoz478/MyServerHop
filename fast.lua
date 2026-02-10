local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

camera.CameraType = Enum.CameraType.Scriptable

local speed = 2
local moving = {W = false, S = false, A = false, D = false, Q = false, E = false}

-- رصد الأزرار
game:GetService("UserInputService").InputBegan:Connect(function(input)
    local key = input.KeyCode.Name
    if moving[key] ~= nil then moving[key] = true end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    local key = input.KeyCode.Name
    if moving[key] ~= nil then moving[key] = false end
end)

-- تحديث الحركة كل فريم
game:GetService("RunService").RenderStepped:Connect(function()
    local cf = camera.CFrame
    if moving.W then cf = cf * CFrame.new(0, 0, -speed) end
    if moving.S then cf = cf * CFrame.new(0, 0, speed) end
    if moving.A then cf = cf * CFrame.new(-speed, 0, 0) end
    if moving.D then cf = cf * CFrame.new(speed, 0, 0) end
    if moving.E then cf = cf * CFrame.new(0, speed, 0) end
    if moving.Q then cf = cf * CFrame.new(0, -speed, 0) end
    camera.CFrame = cf
end)

print("🎥 طير بالكاميرا الحين.. WASD للمشي والماوس للالتفات!")
