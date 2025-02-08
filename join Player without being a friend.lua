-- Setup the GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "JoinPlayerGUI"

-- Create Frame to hold TextBox and Button
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 2

-- Create TextBox for user input
local textBox = Instance.new("TextBox")
textBox.Parent = frame
textBox.Size = UDim2.new(0, 250, 0, 50)
textBox.Position = UDim2.new(0, 25, 0, 25)
textBox.PlaceholderText = "Enter username to join"
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 24

-- Create TextButton to join the user
local joinButton = Instance.new("TextButton")
joinButton.Parent = frame
joinButton.Size = UDim2.new(0, 250, 0, 50)
joinButton.Position = UDim2.new(0, 25, 0, 100)
joinButton.Text = "Join User"
joinButton.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
joinButton.Font = Enum.Font.SourceSans
joinButton.TextSize = 24

-- Function to join the user entered in the TextBox
local function joinUser()
    local username = textBox.Text
    local targetPlayer = game.Players:FindFirstChild(username)
    
    if targetPlayer then
        -- If the player is found, move the local player to the target player's position
        player.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        print("Joined player: " .. username)
    else
        -- If no player found, show an error message
        print("Player not found: " .. username)
    end
end

-- Connect the button click event
joinButton.MouseButton1Click:Connect(function()
    joinUser()
end)
