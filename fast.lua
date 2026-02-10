local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local camera = workspace.CurrentCamera
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local speed = 2 -- سرعة الكاميرا
local active = true

-- فصل الكاميرا عن اللاعب
camera.CameraType = Enum.CameraType.Scriptable

RunService.RenderStepped:Connect(function()
    if not active then return end
    
    local lookVector = camera.CFrame.LookVector
    local rightVector = camera.CFrame.RightVector
    
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        camera.CFrame = camera.CFrame + (lookVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        camera.CFrame = camera.CFrame - (lookVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        camera.CFrame = camera.CFrame - (rightVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        camera.CFrame = camera.CFrame + (rightVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.E) then
        camera.CFrame = camera.CFrame + Vector3.new(0, speed, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
        camera.CFrame = camera.CFrame - Vector3.new(0, speed, 0)
    end
end)

print("🎥 الكاميرا شغالة! استخدم WASD و Q-E للطيران")
