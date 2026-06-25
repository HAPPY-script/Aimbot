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
