-- MyUI.lua
-- واجهة بسيطة قابلة للسحب تحتوي على أزرار تجريبية

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Clean up existing instance if present
local existing = CoreGui:FindFirstChild("MyCustomMenu")
if existing then existing:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyCustomMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main window
local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Size = UDim2.new(0, 360, 0, 200)
Window.Position = UDim2.new(0.5, -180, 0.5, -100)
Window.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Window.BorderSizePixel = 0
Window.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Window)
UICorner.CornerRadius = UDim.new(0, 8)

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 32)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Window

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -64, 1, 0)
Title.Position = UDim2.new(0, 8, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "قائمتي الخاصة"
Title.TextColor3 = Color3.fromRGB(230,230,230)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 48, 1, 0)
CloseBtn.Position = UDim2.new(1, -56, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 75, 75)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Size = UDim2.new(0, 48, 1, 0)
MinBtn.Position = UDim2.new(1, -112, 0, 0)
MinBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinBtn.BorderSizePixel = 0
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.Parent = TitleBar

-- Content area
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -16, 1, -48)
Content.Position = UDim2.new(0, 8, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = Window

local UIList = Instance.new("UIListLayout", Content)
UIList.Padding = UDim.new(0, 8)
UIList.FillDirection = Enum.FillDirection.Vertical
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.VerticalAlignment = Enum.VerticalAlignment.Top

-- helper to create buttons
local function makeButton(text)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.BorderSizePixel = 0
    btn.TextColor3 = Color3.fromRGB(230,230,230)
    btn.Text = text
    btn.AutoButtonColor = true
    btn.Parent = Content
    return btn
end

local btn1 = makeButton("زر تجريبي 1")
local btn2 = makeButton("زر تجريبي 2")
local toggleVisibilityBtn = makeButton("إظهار/إخفاء الواجهة")
local highlightBtn = makeButton("تغيير لون مؤقت")

-- Button behaviors
btn1.MouseButton1Click:Connect(function()
    print("Button 1 clicked")
    btn1.BackgroundColor3 = Color3.fromRGB(60,140,220)
    wait(0.15)
    btn1.BackgroundColor3 = Color3.fromRGB(45,45,45)
end)

btn2.MouseButton1Click:Connect(function()
    print("Button 2 clicked")
    btn2.BackgroundColor3 = Color3.fromRGB(75,200,125)
    wait(0.15)
    btn2.BackgroundColor3 = Color3.fromRGB(45,45,45)
end)

toggleVisibilityBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = not ScreenGui.Enabled
end)

highlightBtn.MouseButton1Click:Connect(function()
    Window.BackgroundColor3 = Color3.fromRGB(80,40,160)
    wait(0.2)
    Window.BackgroundColor3 = Color3.fromRGB(30,30,30)
end)

-- Close/Minimize
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    Window.Size = minimized and UDim2.new(0, 200, 0, 32) or UDim2.new(0, 360, 0, 200)
end)

-- Draggable window via title bar
do
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        Window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
