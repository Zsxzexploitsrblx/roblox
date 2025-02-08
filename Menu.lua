local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("Menu")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "MyCustomGUI"

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 300, 0, 500)
frame.Position = UDim2.new(0.5, -150, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0

-- Function to create buttons
local function createButton(name, position, action)
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.Size = UDim2.new(0, 250, 0, 50)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(0, 123, 255)  -- Blue button
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24
    
    button.MouseButton1Click:Connect(function()
        action()
    end)
end

-- Actions for buttons

local flying = false
local speed = 50
local noclip = false

-- Fly action
local function toggleFly()
    if flying then
        -- Stop flying (clear BodyVelocity)
        local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("BodyVelocity") then
                v:Destroy()
            end
        end
        flying = false
        print("Fly Disabled")
    else
        -- Start flying
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(500000, 500000, 500000)
        bodyVelocity.Velocity = Vector3.new(0, speed, 0)
        bodyVelocity.Parent = player.Character:WaitForChild("HumanoidRootPart")
        flying = true
        print("Fly Enabled")
    end
end

-- Noclip action
local function toggleNoclip()
    if noclip then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        noclip = false
        print("Noclip Disabled")
    else
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        noclip = true
        print("Noclip Enabled")
    end
end

-- Speed Gui (default is 16)

local player1 = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local userInput = Instance.new("TextBox")
userInput.Size = UDim2.new(0, 250, 0, 50)
userInput.Position = UDim2.new(0, 25, 0, 25)
userInput.PlaceholderText = "Enter Speed"
userInput.Text = ""
userInput.Parent = frame

local applyButton = Instance.new("TextButton")
applyButton.Size = UDim2.new(0, 250, 0, 50)
applyButton.Position = UDim2.new(0, 25, 0, 85)
applyButton.Text = "Apply Speed"
applyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
applyButton.Parent = frame

local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(0, 250, 0, 25)
messageLabel.Position = UDim2.new(0, 25, 0, 120)
messageLabel.Text = ""
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.BackgroundTransparency = 1
messageLabel.Parent = frame

-- Function to apply speed change
local function changeSpeed()
    local speed = tonumber(userInput.Text)
    
    -- Check if the input is a valid number
    if speed and speed > 0 then
        humanoid.WalkSpeed = speed
        messageLabel.Text = "Speed set to: " .. speed
    else
        messageLabel.Text = "Invalid speed! Please enter a positive number."
    end
end

-- Connect button click to the changeSpeed function
applyButton.MouseButton1Click:Connect(changeSpeed)

-- Make the frame draggable
local dragging = false
local dragInput = nil
local dragStartPos = nil
local dragStart = nil

-- Function to start dragging
local function onDragStart(input)
    dragging = true
    dragInput = input
    dragStartPos = frame.Position
    dragStart = input.Position
end

-- Function to update the position while dragging
local function onDragMove(input)
    if dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(dragStartPos.X.Scale, dragStartPos.X.Offset + delta.X, dragStartPos.Y.Scale, dragStartPos.Y.Offset + delta.Y)
    end
end

-- Function to stop dragging
local function onDragEnd()
    dragging = false
end

-- Connect drag events to the frame
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        onDragStart(input)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        onDragMove(input)
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        onDragEnd()
    end
end)
