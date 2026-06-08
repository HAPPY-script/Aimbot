if _G.Aimbot then
    warn("Script đã chạy! Không thể chạy lại.")
    return
end
_G.Aimbot = true

local AimbotScript = Instance.new("ScreenGui")
AimbotScript.Name = "AimbotScript"
AimbotScript.ResetOnSpawn = false
AimbotScript.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AimbotScript.DisplayOrder = 9990
AimbotScript.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 200, 0, 300)
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.BorderSizePixel = 0
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.ZIndex = 2
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Parent = AimbotScript

local UIGradient = Instance.new("UIGradient")
UIGradient.Name = "UIGradient"
UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.0784314, 0.270588, 0.388235)), ColorSequenceKeypoint.new(0.155709, Color3.new(0, 0.0784314, 0.196078)), ColorSequenceKeypoint.new(0.783737, Color3.new(0, 0.0784314, 0.196078)), ColorSequenceKeypoint.new(1, Color3.new(0.0784314, 0.270588, 0.388235))})
UIGradient.Rotation = -100
UIGradient.Parent = Main

local UIDragDetector = Instance.new("UIDragDetector")
UIDragDetector.Name = "UIDragDetector"

UIDragDetector.Parent = Main

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Position = UDim2.new(1, 0, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.BorderSizePixel = 0
Close.BorderColor3 = Color3.new(0, 0, 0)
Close.ZIndex = 2
Close.AnchorPoint = Vector2.new(1, 0)
Close.Transparency = 1
Close.Text = "x"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextSize = 14
Close.FontFace = Font.new("rbxassetid://12187371840", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Close.TextScaled = true
Close.TextWrapped = true
Close.Parent = Main

local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"

UIAspectRatioConstraint.Parent = Close

local Mini = Instance.new("TextButton")
Mini.Name = "Mini"
Mini.Position = UDim2.new(0.85, 0, 0, 0)
Mini.Size = UDim2.new(0, 30, 0, 30)
Mini.BackgroundColor3 = Color3.new(1, 1, 1)
Mini.BackgroundTransparency = 1
Mini.BorderSizePixel = 0
Mini.BorderColor3 = Color3.new(0, 0, 0)
Mini.ZIndex = 2
Mini.AnchorPoint = Vector2.new(1, 0)
Mini.Transparency = 1
Mini.Text = "-"
Mini.TextColor3 = Color3.new(1, 1, 1)
Mini.TextSize = 14
Mini.FontFace = Font.new("rbxassetid://12187371840", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Mini.TextScaled = true
Mini.TextWrapped = true
Mini.Parent = Main

local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint2.Name = "UIAspectRatioConstraint"

UIAspectRatioConstraint2.Parent = Mini

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Size = UDim2.new(0, 125, 0, 35)
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.Transparency = 1
Title.Text = "Aimbot"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Title.TextScaled = true
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local SelectKey = Instance.new("TextButton")
SelectKey.Name = "SelectKey"
SelectKey.Position = UDim2.new(0.4, 0, 0.35, 0)
SelectKey.Size = UDim2.new(0.6, 0, 0.1, 0)
SelectKey.BackgroundColor3 = Color3.new(1, 1, 1)
SelectKey.BackgroundTransparency = 1
SelectKey.BorderSizePixel = 0
SelectKey.BorderColor3 = Color3.new(0, 0, 0)
SelectKey.Transparency = 1
SelectKey.Text = "None"
SelectKey.TextColor3 = Color3.new(1, 1, 1)
SelectKey.TextSize = 14
SelectKey.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SelectKey.TextScaled = true
SelectKey.TextWrapped = true
SelectKey.Parent = Main

local Line = Instance.new("Frame")
Line.Name = "Line"
Line.Position = UDim2.new(0.5, 0, 1, 0)
Line.Size = UDim2.new(0.9, 0, 0.05, 0)
Line.BackgroundColor3 = Color3.new(0, 0.784314, 1)
Line.BorderSizePixel = 0
Line.BorderColor3 = Color3.new(0, 0, 0)
Line.AnchorPoint = Vector2.new(0.5, 0)
Line.Parent = SelectKey

local SelectKeyTitle = Instance.new("TextLabel")
SelectKeyTitle.Name = "SelectKeyTitle"
SelectKeyTitle.Position = UDim2.new(0.1, 0, 0.35, 0)
SelectKeyTitle.Size = UDim2.new(0.9, 0, 0.1, 0)
SelectKeyTitle.BackgroundColor3 = Color3.new(1, 1, 1)
SelectKeyTitle.BackgroundTransparency = 1
SelectKeyTitle.BorderSizePixel = 0
SelectKeyTitle.BorderColor3 = Color3.new(0, 0, 0)
SelectKeyTitle.Transparency = 1
SelectKeyTitle.Text = "Key:"
SelectKeyTitle.TextColor3 = Color3.new(1, 1, 1)
SelectKeyTitle.TextSize = 14
SelectKeyTitle.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SelectKeyTitle.TextScaled = true
SelectKeyTitle.TextWrapped = true
SelectKeyTitle.TextXAlignment = Enum.TextXAlignment.Left
SelectKeyTitle.Parent = Main

local ModeTitle = Instance.new("TextLabel")
ModeTitle.Name = "ModeTitle"
ModeTitle.Position = UDim2.new(0.05, 0, 0.5, 0)
ModeTitle.Size = UDim2.new(0.9, 0, 0.1, 0)
ModeTitle.BackgroundColor3 = Color3.new(1, 1, 1)
ModeTitle.BackgroundTransparency = 1
ModeTitle.BorderSizePixel = 0
ModeTitle.BorderColor3 = Color3.new(0, 0, 0)
ModeTitle.Transparency = 1
ModeTitle.Text = "Mode:"
ModeTitle.TextColor3 = Color3.new(1, 1, 1)
ModeTitle.TextSize = 14
ModeTitle.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ModeTitle.TextScaled = true
ModeTitle.TextWrapped = true
ModeTitle.TextXAlignment = Enum.TextXAlignment.Left
ModeTitle.Parent = Main

local Mode = Instance.new("TextButton")
Mode.Name = "Mode"
Mode.Position = UDim2.new(0.4, 0, 0.5, 0)
Mode.Size = UDim2.new(0.6, 0, 0.1, 0)
Mode.BackgroundColor3 = Color3.new(1, 1, 1)
Mode.BackgroundTransparency = 1
Mode.BorderSizePixel = 0
Mode.BorderColor3 = Color3.new(0, 0, 0)
Mode.Transparency = 1
Mode.Text = "Free"
Mode.TextColor3 = Color3.new(1, 1, 1)
Mode.TextSize = 14
Mode.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Mode.TextScaled = true
Mode.TextWrapped = true
Mode.Parent = Main

local Line2 = Instance.new("Frame")
Line2.Name = "Line"
Line2.Position = UDim2.new(0.5, 0, 1, 0)
Line2.Size = UDim2.new(0.9, 0, 0.05, 0)
Line2.BackgroundColor3 = Color3.new(0, 0.784314, 1)
Line2.BorderSizePixel = 0
Line2.BorderColor3 = Color3.new(0, 0, 0)
Line2.AnchorPoint = Vector2.new(0.5, 0)
Line2.Parent = Mode

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Position = UDim2.new(0.5, 0, 0.225, 0)
Toggle.Size = UDim2.new(0.75, 0, 0.15, 0)
Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundTransparency = 1
Toggle.BorderSizePixel = 0
Toggle.BorderColor3 = Color3.new(0, 0, 0)
Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
Toggle.Transparency = 1
Toggle.Image = "rbxassetid://11509756389"
Toggle.ImageColor3 = Color3.new(0.490196, 0, 0)
Toggle.Parent = Main

local Text = Instance.new("TextLabel")
Text.Name = "Text"
Text.Position = UDim2.new(0.5, 0, 0.5, 0)
Text.Size = UDim2.new(0.75, 0, 0.75, 0)
Text.BackgroundColor3 = Color3.new(1, 1, 1)
Text.BackgroundTransparency = 1
Text.BorderSizePixel = 0
Text.BorderColor3 = Color3.new(0, 0, 0)
Text.AnchorPoint = Vector2.new(0.5, 0.5)
Text.Transparency = 1
Text.Text = "Off"
Text.TextColor3 = Color3.new(1, 1, 1)
Text.TextSize = 14
Text.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Text.TextScaled = true
Text.TextWrapped = true
Text.Parent = Toggle

local AutoShotTitle = Instance.new("TextLabel")
AutoShotTitle.Name = "AutoShotTitle"
AutoShotTitle.Position = UDim2.new(0.025, 0, 0.65, 0)
AutoShotTitle.Size = UDim2.new(0.4, 0, 0.1, 0)
AutoShotTitle.BackgroundColor3 = Color3.new(1, 1, 1)
AutoShotTitle.BackgroundTransparency = 1
AutoShotTitle.BorderSizePixel = 0
AutoShotTitle.BorderColor3 = Color3.new(0, 0, 0)
AutoShotTitle.Transparency = 1
AutoShotTitle.Text = "Auto shot:"
AutoShotTitle.TextColor3 = Color3.new(1, 1, 1)
AutoShotTitle.TextSize = 14
AutoShotTitle.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
AutoShotTitle.TextScaled = true
AutoShotTitle.TextWrapped = true
AutoShotTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoShotTitle.Parent = Main

local ModeAuto = Instance.new("TextButton")
ModeAuto.Name = "ModeAuto"
ModeAuto.Position = UDim2.new(0.45, 0, 0.65, 0)
ModeAuto.Size = UDim2.new(0.25, 0, 0.1, 0)
ModeAuto.BackgroundColor3 = Color3.new(1, 1, 1)
ModeAuto.BackgroundTransparency = 1
ModeAuto.BorderSizePixel = 0
ModeAuto.BorderColor3 = Color3.new(0, 0, 0)
ModeAuto.Transparency = 1
ModeAuto.Text = "Spam"
ModeAuto.TextColor3 = Color3.new(1, 1, 1)
ModeAuto.TextSize = 14
ModeAuto.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ModeAuto.TextScaled = true
ModeAuto.TextWrapped = true
ModeAuto.Parent = Main

local Line3 = Instance.new("Frame")
Line3.Name = "Line"
Line3.Position = UDim2.new(0.5, 0, 1, 0)
Line3.Size = UDim2.new(0.9, 0, 0.05, 0)
Line3.BackgroundColor3 = Color3.new(0, 0.784314, 1)
Line3.BorderSizePixel = 0
Line3.BorderColor3 = Color3.new(0, 0, 0)
Line3.AnchorPoint = Vector2.new(0.5, 0)
Line3.Parent = ModeAuto

local ToggleAuto = Instance.new("ImageButton")
ToggleAuto.Name = "ToggleAuto"
ToggleAuto.Position = UDim2.new(0.85, 0, 0.7, 0)
ToggleAuto.Size = UDim2.new(0.25, 0, 0.125, 0)
ToggleAuto.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleAuto.BackgroundTransparency = 1
ToggleAuto.BorderSizePixel = 0
ToggleAuto.BorderColor3 = Color3.new(0, 0, 0)
ToggleAuto.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleAuto.Transparency = 1
ToggleAuto.Image = "rbxassetid://11509756389"
ToggleAuto.ImageColor3 = Color3.new(0.490196, 0, 0)
ToggleAuto.Parent = Main

local Text2 = Instance.new("TextLabel")
Text2.Name = "Text"
Text2.Position = UDim2.new(0.5, 0, 0.5, 0)
Text2.Size = UDim2.new(0.6, 0, 0.6, 0)
Text2.BackgroundColor3 = Color3.new(1, 1, 1)
Text2.BackgroundTransparency = 1
Text2.BorderSizePixel = 0
Text2.BorderColor3 = Color3.new(0, 0, 0)
Text2.AnchorPoint = Vector2.new(0.5, 0.5)
Text2.Transparency = 1
Text2.Text = "Off"
Text2.TextColor3 = Color3.new(1, 1, 1)
Text2.TextSize = 14
Text2.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Text2.TextScaled = true
Text2.TextWrapped = true
Text2.Parent = ToggleAuto

local SelectTeam = Instance.new("TextButton")
SelectTeam.Name = "SelectTeam"
SelectTeam.Position = UDim2.new(0.5, 0, 0.825, 0)
SelectTeam.Size = UDim2.new(1, 0, 0.125, 0)
SelectTeam.BackgroundColor3 = Color3.new(1, 1, 1)
SelectTeam.BackgroundTransparency = 1
SelectTeam.BorderSizePixel = 0
SelectTeam.BorderColor3 = Color3.new(0, 0, 0)
SelectTeam.AnchorPoint = Vector2.new(0.5, 0)
SelectTeam.Transparency = 1
SelectTeam.Text = "No team"
SelectTeam.TextColor3 = Color3.new(1, 1, 1)
SelectTeam.TextSize = 14
SelectTeam.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SelectTeam.TextScaled = true
SelectTeam.TextWrapped = true
SelectTeam.Parent = Main

local Line4 = Instance.new("Frame")
Line4.Name = "Line"
Line4.Position = UDim2.new(0.5, 0, 1, 0)
Line4.Size = UDim2.new(0.9, 0, 0.05, 0)
Line4.BackgroundColor3 = Color3.new(0, 0.784314, 1)
Line4.BorderSizePixel = 0
Line4.BorderColor3 = Color3.new(0, 0, 0)
Line4.AnchorPoint = Vector2.new(0.5, 0)
Line4.Parent = SelectTeam

local WhiteFrame = Instance.new("Frame")
WhiteFrame.Name = "WhiteFrame"
WhiteFrame.Size = UDim2.new(1, 0, 1, 0)
WhiteFrame.BackgroundColor3 = Color3.new(1, 1, 1)
WhiteFrame.BackgroundTransparency = 1
WhiteFrame.BorderSizePixel = 0
WhiteFrame.BorderColor3 = Color3.new(0, 0, 0)
WhiteFrame.ZIndex = 3
WhiteFrame.Transparency = 1
WhiteFrame.Parent = Main

local SelectTeamFrame = Instance.new("Frame")
SelectTeamFrame.Name = "SelectTeamFrame"
SelectTeamFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
SelectTeamFrame.Size = UDim2.new(0, 200, 0, 300)
SelectTeamFrame.BackgroundColor3 = Color3.new(1, 1, 1)
SelectTeamFrame.BorderSizePixel = 0
SelectTeamFrame.BorderColor3 = Color3.new(0, 0, 0)
SelectTeamFrame.Visible = false
SelectTeamFrame.ZIndex = 2
SelectTeamFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SelectTeamFrame.Parent = AimbotScript

local UIGradient2 = Instance.new("UIGradient")
UIGradient2.Name = "UIGradient"
UIGradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.0784314, 0.270588, 0.388235)), ColorSequenceKeypoint.new(0.155709, Color3.new(0, 0.0784314, 0.196078)), ColorSequenceKeypoint.new(0.783737, Color3.new(0, 0.0784314, 0.196078)), ColorSequenceKeypoint.new(1, Color3.new(0.0784314, 0.270588, 0.388235))})
UIGradient2.Rotation = -100
UIGradient2.Parent = SelectTeamFrame

local UIDragDetector2 = Instance.new("UIDragDetector")
UIDragDetector2.Name = "UIDragDetector"

UIDragDetector2.Parent = SelectTeamFrame

local Back = Instance.new("TextButton")
Back.Name = "Back"
Back.Position = UDim2.new(1, 0, 0, 0)
Back.Size = UDim2.new(0.175, 0, 0.175, 0)
Back.BackgroundColor3 = Color3.new(1, 1, 1)
Back.BackgroundTransparency = 1
Back.BorderSizePixel = 0
Back.BorderColor3 = Color3.new(0, 0, 0)
Back.ZIndex = 2
Back.AnchorPoint = Vector2.new(1, 0)
Back.Transparency = 1
Back.Text = "<"
Back.TextColor3 = Color3.new(1, 1, 1)
Back.TextSize = 14
Back.FontFace = Font.new("rbxassetid://12187371840", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Back.TextScaled = true
Back.TextWrapped = true
Back.Parent = SelectTeamFrame

local UIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint3.Name = "UIAspectRatioConstraint"

UIAspectRatioConstraint3.Parent = Back

local Title2 = Instance.new("TextLabel")
Title2.Name = "Title"
Title2.Position = UDim2.new(0.05, 0, 0, 0)
Title2.Size = UDim2.new(0.75, 0, 0.125, 0)
Title2.BackgroundColor3 = Color3.new(1, 1, 1)
Title2.BackgroundTransparency = 1
Title2.BorderSizePixel = 0
Title2.BorderColor3 = Color3.new(0, 0, 0)
Title2.Transparency = 1
Title2.Text = "Aimbot"
Title2.TextColor3 = Color3.new(1, 1, 1)
Title2.TextSize = 14
Title2.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Title2.TextScaled = true
Title2.TextWrapped = true
Title2.TextXAlignment = Enum.TextXAlignment.Left
Title2.Parent = SelectTeamFrame

local WhiteFrame2 = Instance.new("Frame")
WhiteFrame2.Name = "WhiteFrame"
WhiteFrame2.Size = UDim2.new(1, 0, 1, 0)
WhiteFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
WhiteFrame2.BackgroundTransparency = 1
WhiteFrame2.BorderSizePixel = 0
WhiteFrame2.BorderColor3 = Color3.new(0, 0, 0)
WhiteFrame2.ZIndex = 3
WhiteFrame2.Transparency = 1
WhiteFrame2.Parent = SelectTeamFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0.5, 0, 0.575, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.85, 0)
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.Transparency = 1
ScrollingFrame.Active = true
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0.784314, 1)
ScrollingFrame.ScrollBarThickness = 7
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Parent = SelectTeamFrame

local No_team = Instance.new("TextButton")
No_team.Name = "No team"
No_team.Size = UDim2.new(1, 0, 0, 35)
No_team.BackgroundColor3 = Color3.new(0, 0.784314, 1)
No_team.BackgroundTransparency = 0.5
No_team.BorderSizePixel = 0
No_team.BorderColor3 = Color3.new(0, 0, 0)
No_team.Transparency = 0.5
No_team.Text = "No team"
No_team.TextColor3 = Color3.new(1, 1, 1)
No_team.TextSize = 14
No_team.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
No_team.TextScaled = true
No_team.TextWrapped = true
No_team.Parent = ScrollingFrame

local Frame = AimbotScript
if not Frame then return end
task.spawn(function()
	while true do
		local allOk = true
		for _, obj in ipairs(Frame:GetDescendants()) do
			if obj:IsA("TextLabel")
			or obj:IsA("TextBox")
			or obj:IsA("TextButton") then
				if obj.TextTransparency ~= 0 then
					obj.TextTransparency = 0
					allOk = false
				end
			end
		end
		if allOk then break end
		task.wait(0.1)
	end
end)

--======================================================================================--
--=== SYSTEM ===========================================================================--
--======================================================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Teams = game:GetService("Teams")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local playerGui = player:WaitForChild("PlayerGui")

local visibilityCache = {}
local VISIBILITY_DELAY = 0.1
local lastESPUpdate = 0
local ESP_RATE = 0.05

local MAX_GREEN_LINES = 20
local MAX_RED_LINES = 20

local aimLine = Drawing.new("Line")
local greenLines = {}
local redLines = {}

local mainConnection
local crosshairConnection

local selectedTeam = nil
local silentAimEnabled = false
local selectedKey = nil
local currentTarget = nil
local aimMode = "free" -- free / obscure / dis free / dis obscure

local autoClickEnabled = false
local autoClickMode = "Spam" -- "Spam" / "Hold"
local autoClickDownAt = 0
local spamCooldown = 0.03

local settingKey = false
local settingKeyToken = 0
local isKeyHeld = false
local autoClickPressed = false
local lastClick = 0
local clickDelay = 0.03
local holding = false

VirtualUser:CaptureController()

local uiRoot = playerGui:WaitForChild("AimbotScript")
local Main = uiRoot:WaitForChild("Main")
local SelectTeamFrame = uiRoot:WaitForChild("SelectTeamFrame")

local CloseButton = Main:WaitForChild("Close")
local MiniButton = Main:WaitForChild("Mini")

local MainWhiteFrame = Main:WaitForChild("WhiteFrame")
local SelectWhiteFrame = SelectTeamFrame:WaitForChild("WhiteFrame")

local ToggleButton = Main:WaitForChild("Toggle")
local ToggleText = ToggleButton:WaitForChild("Text")

local SelectKeyButton = Main:WaitForChild("SelectKey")
local ModeButton = Main:WaitForChild("Mode")
local ModeAutoButton = Main:WaitForChild("ModeAuto")
local ToggleAutoButton = Main:WaitForChild("ToggleAuto")
local ToggleAutoText = ToggleAutoButton:WaitForChild("Text")
local SelectTeamButton = Main:WaitForChild("SelectTeam")

local TeamScroll = SelectTeamFrame:FindFirstChildWhichIsA("ScrollingFrame", true)
local BackButton = SelectTeamFrame:WaitForChild("Back")
local NoTeamTemplate = TeamScroll and TeamScroll:WaitForChild("No team")

local crosshairGui

local function tween(obj, time, props)
	local t = TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
	t:Play()
	return t
end

local function Cleanup()
	for _, line in pairs(redLines) do
		if line then
			line:Remove()
		end
	end
	table.clear(redLines)

    for i = 1, MAX_GREEN_LINES do
        if greenLines[i] then
            greenLines[i]:Remove()
            greenLines[i] = nil
        end
    end

    for i = 1, MAX_RED_LINES do
        if redLines[i] then
            redLines[i]:Remove()
            redLines[i] = nil
        end
    end

	if mainConnection then
		mainConnection:Disconnect()
		mainConnection = nil
	end

	if crosshairConnection then
		crosshairConnection:Disconnect()
		crosshairConnection = nil
	end

	if aimLine then
		aimLine:Remove()
		aimLine = nil
	end

	for _, line in pairs(greenLines) do
		if line then
			line:Remove()
		end
	end
	table.clear(greenLines)

	if holding then
		local m = UserInputService:GetMouseLocation()
		VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, false, game, 0)
		holding = false
	end

    if crosshairGui then
        crosshairGui:Destroy()
        crosshairGui = nil
    end

    _G.Aimbot = nil
end

local function closeUI()
	-- reset flag TRƯỚC
	_G.Aimbot = nil

	-- Tắt trạng thái
	silentAimEnabled = false
	autoClickEnabled = false
	isKeyHeld = false
	settingKey = false

	-- Cleanup
	Cleanup()

	-- Xoá UI
	if uiRoot then
		uiRoot:Destroy()
	end
end

CloseButton.MouseButton1Click:Connect(function()
	closeUI()
end)

local minimized = false
local hiddenObjects = {}

local function setMini(state)
    if SelectTeamFrame.Visible then
        returnToMainFrame()
    end

	if minimized == state then return end
	minimized = state

	if state then
		-- Lưu + ẩn
		for _, obj in ipairs(Main:GetDescendants()) do
			if obj:IsA("TextButton") or obj:IsA("ImageButton") or obj:IsA("TextLabel") then
				
				if obj == CloseButton or obj == MiniButton then
					continue
				end

				if obj:IsA("TextLabel") and obj.Name == "Title" then
					continue
				end

				if obj.Visible then
					hiddenObjects[obj] = true
					obj.Visible = false
				end
			end
		end

		-- Resize nhỏ
		tween(Main, 0.3, {
			Size = UDim2.new(0, 200, 0, 35)
		})

	else
		-- Restore visible
		for obj, _ in pairs(hiddenObjects) do
			if obj and obj.Parent then
				obj.Visible = true
			end
		end
		table.clear(hiddenObjects)

		-- Resize lại
		tween(Main, 0.3, {
			Size = UDim2.new(0, 200, 0, 300)
		})
	end
end

MiniButton.MouseButton1Click:Connect(function()
	setMini(not minimized)
end)

local function fadeWhiteSync(to, time)
	local t1 = tween(MainWhiteFrame, time, {BackgroundTransparency = to})
	local t2 = tween(SelectWhiteFrame, time, {BackgroundTransparency = to})
	t1.Completed:Wait()
end

local function fadeSwapText(obj, newText, totalTime)
	if not obj then return end
	local half = totalTime * 0.3

	tween(obj, half, {TextTransparency = 1})

	task.delay(half, function()
		obj.Text = newText
		tween(obj, half, {TextTransparency = 0})
	end)
end

local function fadeImageButtonState(btn, label, isOn, onColor, offColor, totalTime)
	if not btn then return end
	local targetColor = isOn and onColor or offColor
	local currentText = isOn and "On" or "Off"
	local oldText = label and label.Text or (isOn and "On" or "Off")

	if label then
		local t1 = tween(label, (totalTime or 1) * 0.3, {TextTransparency = 1})
		local c1 = tween(btn, (totalTime or 1), {ImageColor3 = targetColor})
		t1.Completed:Wait()
		label.Text = currentText
		local t2 = tween(label, (totalTime or 1) * 0.3, {TextTransparency = 0})
		t2.Completed:Wait()
	else
		tween(btn, totalTime or 1, {ImageColor3 = targetColor})
	end
end

local function setToggleVisual(state)
	fadeImageButtonState(
		ToggleButton,
		ToggleText,
		state,
		Color3.fromRGB(0, 125, 0),
		Color3.fromRGB(125, 0, 0),
		0.3
	)
end

local function setToggleAutoVisual(state)
	fadeImageButtonState(
		ToggleAutoButton,
		ToggleAutoText,
		state,
		Color3.fromRGB(0, 125, 0),
		Color3.fromRGB(125, 0, 0),
		0.3
	)
end

local function updateModeText()
	fadeSwapText(ModeButton, aimMode, 1)
end

local function updateModeAutoText()
	fadeSwapText(ModeAutoButton, autoClickMode, 1)
end

local function updateSelectKeyText(textValue)
	fadeSwapText(SelectKeyButton, textValue, 1)
end

local function updateSelectTeamText()
	fadeSwapText(SelectTeamButton, selectedTeam and selectedTeam.Name or "No team", 1)
end

local function setMainVisible(showMain)
	Main.Visible = showMain
	SelectTeamFrame.Visible = not showMain
end

local switching = false

local function openSelectTeamFrame()
	if switching then return end
	switching = true

	-- BẮT BUỘC bật lên
	MainWhiteFrame.Visible = true
	SelectWhiteFrame.Visible = true

	MainWhiteFrame.BackgroundTransparency = 1
	SelectWhiteFrame.BackgroundTransparency = 1

	-- Fade IN (0 → trắng)
	fadeWhiteSync(0, 0.25)

	-- Swap
	SelectTeamFrame.Position = Main.Position
	Main.Visible = false
	SelectTeamFrame.Visible = true

	-- Fade OUT (trắng → ẩn)
	fadeWhiteSync(1, 0.25)

	switching = false
end

local function returnToMainFrame()
	if switching then return end
	switching = true

	MainWhiteFrame.Visible = true
	SelectWhiteFrame.Visible = true

	MainWhiteFrame.BackgroundTransparency = 1
	SelectWhiteFrame.BackgroundTransparency = 1

	-- Fade IN
	fadeWhiteSync(0, 0.25)

	-- Swap
	Main.Position = SelectTeamFrame.Position
	SelectTeamFrame.Visible = false
	Main.Visible = true

	-- Fade OUT
	fadeWhiteSync(1, 0.25)

	switching = false
end

local function shouldIgnoreRayPart(part)
	if not part or not part:IsA("BasePart") then
		return true
	end

	if part == camera or (player.Character and part:IsDescendantOf(player.Character)) then
		return true
	end

	if part.CanQuery == false then
		return true
	end

	-- part vô hình + không va chạm => cho xuyên qua
	if part.CanCollide == false and part.Transparency >= 1 then
		return true
	end

	return false
end

local function IsHeadVisible(character, head)
	if not character or not head then
		return false
	end

	local origin = camera.CFrame.Position
	local targetPos = head.Position
	local delta = targetPos - origin
	local remaining = delta.Magnitude

	if remaining <= 1e-6 then
		return true
	end

	local dir = delta.Unit
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = { player.Character, camera }
	params.IgnoreWater = true

	local currentOrigin = origin

	for _ = 1, 20 do
		local result = workspace:Raycast(currentOrigin, dir * remaining, params)
		if not result then
			return true
		end

		local hit = result.Instance
		if hit and hit:IsDescendantOf(character) then
			return true
		end

		if shouldIgnoreRayPart(hit) then
			local advance = (result.Position - currentOrigin).Magnitude + 0.05
			currentOrigin += dir * advance
			remaining = (targetPos - currentOrigin).Magnitude
			if remaining <= 1e-3 then
				return true
			end
		else
			return false
		end
	end

	return false
end

local function UpdateObstacleLine()
	for i = 1, MAX_GREEN_LINES do
		if greenLines[i] then
			greenLines[i].Visible = false
		end
	end

	for i = 1, MAX_RED_LINES do
		if redLines[i] then
			redLines[i].Visible = false
		end
	end

	local mouseLocation = UserInputService:GetMouseLocation()
	local fromPos = Vector2.new(mouseLocation.X, mouseLocation.Y)

	local greenCandidates = {}
	local redCandidates = {}
	local seenChars = {}

	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= player then
			if not selectedTeam or otherPlayer.Team == selectedTeam then
				local char = otherPlayer.Character
				if char and not seenChars[char] then
					seenChars[char] = true

					local head = char:FindFirstChild("Head")
					local humanoid = char:FindFirstChild("Humanoid")
					if head and humanoid and humanoid.Health > 0 then
						local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)
						if onScreen then
							local visible = IsHeadVisible(char, head)
							local toPos = Vector2.new(screenPoint.X, screenPoint.Y)
							local dist = (toPos - fromPos).Magnitude

							if visible then
								greenCandidates[#greenCandidates + 1] = {
									dist = dist,
									toPos = toPos,
								}
							else
								redCandidates[#redCandidates + 1] = {
									dist = dist,
									toPos = toPos,
								}
							end
						end
					end
				end
			end
		end
	end

	table.sort(greenCandidates, function(a, b)
		return a.dist < b.dist
	end)

	table.sort(redCandidates, function(a, b)
		return a.dist < b.dist
	end)

	for i = 1, math.min(#greenCandidates, MAX_GREEN_LINES) do
		local data = greenCandidates[i]
		local line = greenLines[i] or Drawing.new("Line")
		greenLines[i] = line

		line.From = fromPos
		line.To = data.toPos
		line.Color = Color3.fromRGB(0, 255, 0)
		line.Thickness = 1
		line.Transparency = 0.5
		line.Visible = true
		line.ZIndex = 1001
	end

	for i = 1, math.min(#redCandidates, MAX_RED_LINES) do
		local data = redCandidates[i]
		local line = redLines[i] or Drawing.new("Line")
		redLines[i] = line

		line.From = fromPos
		line.To = data.toPos
		line.Color = Color3.fromRGB(255, 0, 0)
		line.Thickness = 1
		line.Transparency = 0.5
		line.Visible = true
		line.ZIndex = 1001
	end
end

local function DoClick()
	local m = UserInputService:GetMouseLocation()
	VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, true, game, 0)
	VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, false, game, 0)
end

local spamState = false

local function UpdateAutoClick(target)
	if not autoClickEnabled then
		local m = UserInputService:GetMouseLocation()
	
		if holding or spamState then
			local m = UserInputService:GetMouseLocation()
		
			VirtualInputManager:SendMouseButtonEvent(
				m.X,
				m.Y,
				0,
				false,
				game,
				0
			)
		
			holding = false
			spamState = false
		end
	
		if spamState then
			VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, false, game, 0)
			spamState = false
		end
	
		return
	end

	local isAiming = silentAimEnabled and isKeyHeld and target and target.Character
	local m = UserInputService:GetMouseLocation()

	if autoClickMode == "Hold" then
		if isAiming and not holding then
			VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, true, game, 0)
			holding = true
		elseif not isAiming and holding then
			VirtualInputManager:SendMouseButtonEvent(m.X, m.Y, 0, false, game, 0)
			holding = false
		end
	else
		if isAiming then
			if tick() - lastClick >= clickDelay then
				lastClick = tick()
	
				local m = UserInputService:GetMouseLocation()
	
				spamState = not spamState
	
				VirtualInputManager:SendMouseButtonEvent(
					m.X,
					m.Y,
					0,
					spamState,
					game,
					0
				)
			end
		else
			if spamState then
				local m = UserInputService:GetMouseLocation()
	
				VirtualInputManager:SendMouseButtonEvent(
					m.X,
					m.Y,
					0,
					false,
					game,
					0
				)
	
				spamState = false
			end
		end
	end
end

local function AimAtPlayerHead(targetPlayer)
	if not silentAimEnabled or not isKeyHeld then
		return
	end

	if not targetPlayer or not targetPlayer.Character then
		return
	end

	local head = targetPlayer.Character:FindFirstChild("Head")
	if head then
		camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
	end
end

local function UpdateAimLine(targetPlayer)
	if not aimLine then return end

	if not silentAimEnabled or not targetPlayer or not targetPlayer.Character then
		aimLine.Visible = false
		return
	end

	local head = targetPlayer.Character:FindFirstChild("Head")
	if not head then
		aimLine.Visible = false
		return
	end

	local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)
	if not onScreen then
		aimLine.Visible = false
		return
	end

	if isKeyHeld then
		aimLine.Visible = false
		return
	end

	local m = UserInputService:GetMouseLocation()
	aimLine.From = Vector2.new(m.X, m.Y)
	aimLine.To = Vector2.new(screenPoint.X, screenPoint.Y)
	aimLine.Color = Color3.fromRGB(255, 0, 0)
	aimLine.Thickness = 1
	aimLine.Transparency = 0.5
	aimLine.Visible = true
	aimLine.ZIndex = 1001
end

local function RefreshTeams()
	if not TeamScroll or not NoTeamTemplate then
		return
	end

	for _, v in ipairs(TeamScroll:GetChildren()) do
		if v:IsA("TextButton") and v ~= NoTeamTemplate then
			v:Destroy()
		end
	end

	local y = 0
	local order = 1

	local function createTeamButton(text, color, teamObj)
		local btn = NoTeamTemplate:Clone()
		btn.Visible = true
		btn.Text = text
		btn.BackgroundColor3 = color
		btn.Position = UDim2.new(0, 0, 0, y)
		btn.LayoutOrder = order
		btn.Parent = TeamScroll

		btn.MouseButton1Click:Connect(function()
			selectedTeam = teamObj
			updateSelectTeamText()
			returnToMainFrame()
		end)

		y += 40
		order += 1
	end

	createTeamButton("No team", NoTeamTemplate.BackgroundColor3, nil)

	for _, team in ipairs(Teams:GetChildren()) do
		if team:IsA("Team") then
			createTeamButton(team.Name, team.TeamColor.Color, team)
		end
	end

	TeamScroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

local function beginKeySelect()
	if settingKey then return end

	settingKey = true
	settingKeyToken += 1
	local token = settingKeyToken

	fadeSwapText(SelectKeyButton, "...", 0.3)

	task.delay(3, function()
		if settingKey and settingKeyToken == token then
			settingKey = false
			selectedKey = nil
			fadeSwapText(SelectKeyButton, "None", 0.3)
		end
	end)
end

local function bindUI()
	setToggleVisual(false)
	setToggleAutoVisual(false)
	updateModeText()
	updateModeAutoText()
	updateSelectKeyText("None")
	updateSelectTeamText()

	Main.Visible = true
	SelectTeamFrame.Visible = false

	SelectKeyButton.MouseButton1Click:Connect(function()
		beginKeySelect()
	end)

    ModeButton.MouseButton1Click:Connect(function()

        if aimMode == "free" then
            aimMode = "obscure"

        elseif aimMode == "obscure" then
            aimMode = "dis free"

        elseif aimMode == "dis free" then
            aimMode = "dis obscure"

        else
            aimMode = "free"
        end

        updateModeText()
    end)

	ModeAutoButton.MouseButton1Click:Connect(function()
		autoClickMode = (autoClickMode == "Spam") and "Hold" or "Spam"
		updateModeAutoText()
	end)

	ToggleButton.MouseButton1Click:Connect(function()
		silentAimEnabled = not silentAimEnabled
		setToggleVisual(silentAimEnabled)
	end)

	ToggleAutoButton.MouseButton1Click:Connect(function()
		autoClickEnabled = not autoClickEnabled
		setToggleAutoVisual(autoClickEnabled)
	end)

    SelectTeamButton.MouseButton1Click:Connect(function()
        if switching then return end
        RefreshTeams()
        openSelectTeamFrame()
    end)

    BackButton.MouseButton1Click:Connect(function()
        if switching then return end
        returnToMainFrame()
    end)

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if settingKey then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				selectedKey = input.KeyCode
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
				selectedKey = input.UserInputType
			else
				return
			end

			settingKey = false
			updateSelectKeyText(selectedKey.Name)
			return
		end

		if selectedKey and (input.KeyCode == selectedKey or input.UserInputType == selectedKey) then
			isKeyHeld = true
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if selectedKey and (input.KeyCode == selectedKey or input.UserInputType == selectedKey) then
			isKeyHeld = false
		end
	end)

	local function GetClosestPlayerHeadInRange()
		local closestPlayer = nil
		local closestScreenDistance = math.huge
		local crosshairPosition = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		local maxRadius = 200

		for _, otherPlayer in pairs(Players:GetPlayers()) do
			if otherPlayer == player then
				continue
			end

			if selectedTeam and otherPlayer.Team ~= selectedTeam then
				continue
			end

			local character = otherPlayer.Character
			if not character then
				continue
			end

			local head = character:FindFirstChild("Head")
			local humanoid = character:FindFirstChild("Humanoid")
			if not head or not humanoid or humanoid.Health <= 0 then
				continue
			end

			local screenPoint, onScreen = camera:WorldToViewportPoint(head.Position)
			if onScreen then
				local screenPosition = Vector2.new(screenPoint.X, screenPoint.Y)
				local screenDistance = (screenPosition - crosshairPosition).Magnitude

				if screenDistance <= maxRadius then
                    if (aimMode == "obscure") and not IsHeadVisible(character, head) then
                        continue
                    end

					if screenDistance < closestScreenDistance then
						closestScreenDistance = screenDistance
						closestPlayer = otherPlayer
					end
				end
			end
		end

		return closestPlayer
	end

    local function GetClosestPlayerByDistance()

        local myChar = player.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

        if not myRoot then
            return nil
        end

        local closestPlayer = nil
        local closestDistance = math.huge

        for _, otherPlayer in ipairs(Players:GetPlayers()) do

            if otherPlayer == player then
                continue
            end

            if selectedTeam and otherPlayer.Team ~= selectedTeam then
                continue
            end

            local character = otherPlayer.Character
            if not character then
                continue
            end

            local humanoid = character:FindFirstChild("Humanoid")
            local head = character:FindFirstChild("Head")
            local root = character:FindFirstChild("HumanoidRootPart")

            if not humanoid or humanoid.Health <= 0 then
                continue
            end

            if not head or not root then
                continue
            end

            if aimMode == "dis obscure" and not IsHeadVisible(character, head) then
                continue
            end

            local distance = (root.Position - myRoot.Position).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = otherPlayer
            end
        end

        return closestPlayer
    end

    local function GetClosestTarget()

        if aimMode == "dis free" or aimMode == "dis obscure" then
            return GetClosestPlayerByDistance()
        end

        return GetClosestPlayerHeadInRange()
    end

	crosshairGui = Instance.new("ScreenGui")
    local screenGui = crosshairGui
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 9991
	screenGui.Parent = playerGui

	local horizontalBar = Instance.new("Frame")
	horizontalBar.Size = UDim2.new(0, 12, 0, 2)
	horizontalBar.AnchorPoint = Vector2.new(0.5, 0.5)
	horizontalBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	horizontalBar.BorderSizePixel = 0
	horizontalBar.ZIndex = 9999
	horizontalBar.Parent = screenGui

	local verticalBar = Instance.new("Frame")
	verticalBar.Size = UDim2.new(0, 2, 0, 12)
	verticalBar.AnchorPoint = Vector2.new(0.5, 0.5)
	verticalBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	verticalBar.BorderSizePixel = 0
	verticalBar.ZIndex = 9999
	verticalBar.Parent = screenGui

	local function updateCrosshairPosition()
		local mousePosition = UserInputService:GetMouseLocation()
		horizontalBar.Position = UDim2.new(0, mousePosition.X, 0, mousePosition.Y)
		verticalBar.Position = UDim2.new(0, mousePosition.X, 0, mousePosition.Y)
	end

	mainConnection = RunService.RenderStepped:Connect(function()
		local now = tick()

		if now - lastESPUpdate >= ESP_RATE then
			lastESPUpdate = now
			UpdateObstacleLine()
		end

		currentTarget = GetClosestTarget()
		local isAiming = silentAimEnabled and isKeyHeld and currentTarget ~= nil

		AimAtPlayerHead(currentTarget)
		UpdateAutoClick(currentTarget)
		UpdateAimLine(currentTarget)
		updateCrosshairPosition()

		if isAiming then
			horizontalBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			verticalBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		else
			horizontalBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			verticalBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
	end)
end

bindUI()
frame = Main
frame.Visible = true
