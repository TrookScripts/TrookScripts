-- Gui to Lua
-- Version: 3.2
local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "TS",
    Text = "Join Discord for Updates and News",
    Icon = "rbxassetid://10904122868",
    Duration = 10,
    
})

-- Instances:
if game:GetService("CoreGui"):FindFirstChild("ScreenGui") then
	game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()
	_G.loopkill = false
end
local TS = Instance.new("ScreenGui")
local TrookScripts = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Kill = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Loop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local ImageLabel_2 = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Tp = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Discord = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Target = Instance.new("TextBox")
local UICorner_8 = Instance.new("UICorner")
local GamePass = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local DestroyGui = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")

--Properties:

TS.Parent = game.CoreGui
TS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TrookScripts.Name = "TrookScripts"
TrookScripts.Parent = TS
TrookScripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TrookScripts.Position = UDim2.new(0.286496401, 0, 0.224999949, 0)
TrookScripts.Size = UDim2.new(0, 559, 0, 395)
TrookScripts.Active = true
TrookScripts.Draggable = true

UICorner.Parent = TrookScripts

ImageLabel.Parent = TrookScripts
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Size = UDim2.new(0, 559, 0, 395)
ImageLabel.Image = "rbxassetid://10904122868"


local Player = function(Ev)
	if Ev == "" then
		return nil
	elseif Ev == "random" then
		return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
	else
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #Ev) == Ev:lower() or v.DisplayName:lower():sub(1, #Ev) == Ev then
				return v
			end
		end
	end
end

Target.Focused:Connect(function()
	while Target:IsFocused() and wait() do
		local User = Player(Target.Text)
		if User ~= nil then
			ImageLabel_2.Image = game:GetService("Players"):GetUserThumbnailAsync(User.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end
	end
end)

Target.FocusLost:Connect(function()
	while wait() do
		if Target:IsFocused() then break end
		if Target.Text ~= "random" then break end
		ImageLabel_2.Image = game:GetService("Players"):GetUserThumbnailAsync(Player(Target.Text).UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end
end)

UICorner_2.Parent = ImageLabel

Kill.Name = "Kill"
Kill.Parent = ImageLabel
Kill.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
Kill.Position = UDim2.new(0.62432915, 0, 0.721518993, 0)
Kill.Size = UDim2.new(0, 200, 0, 41)
Kill.Font = Enum.Font.SourceSans
Kill.Text = "Kill"
Kill.TextColor3 = Color3.fromRGB(0, 0, 0)
Kill.TextScaled = true
Kill.TextSize = 14.000
Kill.TextWrapped = true
Kill.MouseButton1Down:Connect(function()
 game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

local Humanoid = game.Players.LocalPlayer.Character.Humanoid:Clone()
local Target = Player(Target.Text)
local Tool = game.Players.LocalPlayer.Backpack:FindFirstChild("potion")
game.Players.LocalPlayer.Character.Animate.Disabled = true
game.Players.LocalPlayer.Character.Humanoid:Destroy()
Humanoid.Parent = game.Players.LocalPlayer.Character
Tool.Parent = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0);
end)
UICorner_3.Parent = Kill

Loop.Name = "Loop"
Loop.Parent = ImageLabel
Loop.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
Loop.Position = UDim2.new(0.62432915, 0, 0.860759497, 0)
Loop.Size = UDim2.new(0, 200, 0, 41)
Loop.Font = Enum.Font.SourceSans
Loop.Text = "Loop [Loop Kill Not Working wait until Fix]"
Loop.TextColor3 = Color3.fromRGB(0, 0, 0)
Loop.TextScaled = true
Loop.TextSize = 14.000
Loop.TextWrapped = true
Loop.MouseButton1Down:Connect(function()
	if _G.loopkill then
		_G.loopkill = false
		Loop.Text = "Loop"
	else
		_G.loopkill = true
		Loop.Text = "Unloop"
		local Target = Player(Target.Text)

		repeat
			if not game:GetService("Players"):FindFirstChild(Target.Name) then
				_G.loopkill = false
				game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Notification", Text = Target.Name .. " has left the game"})
			end

			pcall(function()
				 game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

				local Humanoid = plr.Character.Humanoid:Clone()
				local Tool = plr.Backpack:FindFirstChild("potion")

				plr.Character.Animate.Disabled = true
				plr.Character.Humanoid:Destroy()
				Humanoid.Parent = plr.Character
				Tool.Parent = plr.Character
				firetouchinterest(Target.Character.HumanoidRootPart, Tool.Handle, 0); wait(0.1)
				plr.Character.Humanoid.Health = 0
				plr.Character = nil
			end)

			game.Players.LocalPlayer.CharacterAdded:Wait()
			game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		until not _G.loopkill
	end
end)
UICorner_4.Parent = Loop

ImageLabel_2.Parent = ImageLabel
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.Position = UDim2.new(0.62432915, 0, 0.29620254, 0)
ImageLabel_2.Size = UDim2.new(0, 200, 0, 162)
ImageLabel_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_5.Parent = ImageLabel_2

Tp.Name = "Tp"
Tp.Parent = ImageLabel
Tp.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
Tp.Position = UDim2.new(0.237924844, 0, 0.721518993, 0)
Tp.Size = UDim2.new(0, 200, 0, 41)
Tp.Font = Enum.Font.SourceSans
Tp.Text = "Tp"
Tp.TextColor3 = Color3.fromRGB(0, 0, 0)
Tp.TextScaled = true
Tp.TextSize = 14.000
Tp.TextWrapped = true
Tp.MouseButton1Down:Connect(function()
	local Target = Player(Target.Text)
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
end)
UICorner_6.Parent = Tp

Discord.Name = "Discord"
Discord.Parent = ImageLabel
Discord.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
Discord.Position = UDim2.new(0.237924844, 0, 0.860759497, 0)
Discord.Size = UDim2.new(0, 200, 0, 41)
Discord.Font = Enum.Font.SourceSans
Discord.Text = "Discord"
Discord.TextColor3 = Color3.fromRGB(0, 0, 0)
Discord.TextScaled = true
Discord.TextSize = 14.000
Discord.TextWrapped = true
Discord.MouseButton1Down:Connect(function()


	local json = {
		["cmd"] = "INVITE_BROWSER",
		["args"] = {
			["code"] = "ktnZbDkY"
		},
		["nonce"] = 'a'
	}
	spawn(function()
		print(syn.request({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				['Origin'] = 'https://discord.com'
			},
			Body = game:GetService('HttpService'):JSONEncode(json),
		}).Body)
	end)






end)
UICorner_7.Parent = Discord

Target.Parent = ImageLabel
Target.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
Target.Position = UDim2.new(0.237924859, 0, 0.541772187, 0)
Target.Size = UDim2.new(0, 200, 0, 59)
Target.Font = Enum.Font.SourceSans
Target.Text = "Target"
Target.TextColor3 = Color3.fromRGB(0, 0, 0)
Target.TextScaled = true
Target.TextSize = 14.000
Target.TextWrapped = true

UICorner_8.Parent = Target

GamePass.Name = "GamePass"
GamePass.Parent = ImageLabel
GamePass.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
GamePass.Position = UDim2.new(0.62432915, 0, 0.0405063219, 0)
GamePass.Size = UDim2.new(0, 200, 0, 87)
GamePass.Font = Enum.Font.SourceSans
GamePass.Text = "Buy GamePass"
GamePass.TextColor3 = Color3.fromRGB(0, 0, 0)
GamePass.TextScaled = true
GamePass.TextSize = 14.000
GamePass.TextWrapped = true
GamePass.MouseButton1Down:Connect(function()
	setclipboard("https://www.roblox.com/game-pass/85119609/TrookScripts-Premium")
	local CoreGui = game:GetService("StarterGui")

	CoreGui:SetCore("SendNotification", {
		Title = "TS",
		Text = "Clipped to KeyBoard Pate in Broswer and buy afte ur buy u will be Premium automatic",
		Icon = "rbxassetid://10904122868",
		Duration = 10,

	})
end)
UICorner_9.Parent = GamePass

DestroyGui.Name = "DestroyGui"
DestroyGui.Parent = ImageLabel
DestroyGui.BackgroundColor3 = Color3.fromRGB(229, 229, 229)
DestroyGui.Position = UDim2.new(0.250447214, 0, 0.0405063294, 0)
DestroyGui.Size = UDim2.new(0, 186, 0, 54)
DestroyGui.Font = Enum.Font.SourceSans
DestroyGui.Text = "Destroy Gui"
DestroyGui.TextColor3 = Color3.fromRGB(0, 0, 0)
DestroyGui.TextScaled = true
DestroyGui.TextSize = 14.000
DestroyGui.TextWrapped = true
DestroyGui.MouseButton1Down:Connect(function()
if game:GetService("CoreGui"):FindFirstChild("ScreenGui") then
	game:GetService("CoreGui"):FindFirstChild("ScreenGui"):Destroy()
	_G.loopkill = false
end
end)
UICorner_10.Parent = DestroyGui

TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Position = UDim2.new(0.237924859, 0, 0.29620254, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Rank : None"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
UICorner_11.Parent = TextLabel



local UserInputService = game:GetService("UserInputService")





function onKeyPress(inputObject, gameProcessedEvent)


	if not gameProcessedEvent then


		if inputObject.KeyCode == Enum.KeyCode.V then 


			if TrookScripts.Visible == false then


				TrookScripts.Visible = true


			else


				TrookScripts.Visible = false


			end


		end


	end


end
UserInputService.InputBegan:connect(onKeyPress)
