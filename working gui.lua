local ScreenGui = Instance.new("ScreenGui"
screengui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local player = game.Players.LocalPlayer

-- create a frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position 0 UDim2.new(0.5, -140, 0.5, -10)
frame.BackroundColor3 = Color3.fromRGB(200, 200, 200)
frame.Parent = ScreenGui

-- create a text label
local TextLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 280, 0, 40)
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.Text = "Choose An Option:"
textLabel.TextSize = 16
textLabel.Parent = frame

-- create the input for a user
local userInput = Instance.new("UserInput"
local function tp()
    local username = userInput.Text
local messageLabel
if username == "" then
    messageLabel.Text = "Please enter a username
    return
end

-- find the player by input
local targetPlayer = game.Players:FindFirstChild(username)

if targetPlayer then

   local character = targetPlayer.Character
  if character and character:FindFiratChild("HumaniisRootPart") then
      player.Character:MoveTo(character.HumanoidRootPart.Position
      messageLabel.Text = Teleported to " .. username
else
      messageLabel.Text = username .. "is not in the game or has no character."
  end
else
      messageLabel.Text = "Player not found: " .. username
    end
end


button1.MouseButton1Click:Connect(teleportToPlayer)

-- create button1
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 275, 0, 35)
button1.Position = UDim2.new(0, 260, 0, 25)
button1.Text = "Goto User"
button1.Text = 16
button1.Parent = frame
