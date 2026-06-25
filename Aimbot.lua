if _G.Aimbot then
    warn("Script đã chạy! Không thể chạy lại.")
    return
end
_G.Aimbot = true

-- Load UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/HAPPY-script/Aimbot/refs/heads/main/UI.lua"))()

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

local function HideObstacleLines()
	for _, line in pairs(greenLines) do
		if line then
			line.Visible = false
		end
	end

	for _, line in pairs(redLines) do
		if line then
			line.Visible = false
		end
	end
end

local AUTO_TEAM = "Auto"

local function shouldIncludePlayer(otherPlayer)
	if selectedTeam == AUTO_TEAM then
		local myTeam = player.Team
		if not myTeam then
			return true
		end
		return otherPlayer.Team ~= myTeam
	end

	if selectedTeam then
		return otherPlayer.Team == selectedTeam
	end

	return true
end

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
	local text
	if selectedTeam == AUTO_TEAM then
		text = "Auto"
	else
		text = selectedTeam and selectedTeam.Name or "No team"
	end

	fadeSwapText(SelectTeamButton, text, 1)
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
	if not silentAimEnabled then
		HideObstacleLines()
		return
	end

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
			if shouldIncludePlayer(otherPlayer) then
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

	local function createTeamButton(text, color, teamObj, template)
		local btn = template and template:Clone() or NoTeamTemplate:Clone()
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

		return btn
	end

	-- dùng luôn template gốc cho No team, không clone thêm
	do
		local btn = NoTeamTemplate
		btn.Visible = true
		btn.Text = "No team"
		btn.BackgroundColor3 = btn.BackgroundColor3
		btn.Position = UDim2.new(0, 0, 0, y)
		btn.LayoutOrder = order
		btn.Parent = TeamScroll

		btn.MouseButton1Click:Connect(function()
			selectedTeam = nil
			updateSelectTeamText()
			returnToMainFrame()
		end)

		y += 40
		order += 1
	end

	createTeamButton("Auto", Color3.fromRGB(120, 120, 120), AUTO_TEAM)

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

        if not silentAimEnabled then
            HideObstacleLines()
        end
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

			if not shouldIncludePlayer(otherPlayer) then
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

			if not shouldIncludePlayer(otherPlayer) then
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

        if silentAimEnabled and now - lastESPUpdate >= ESP_RATE then
            lastESPUpdate = now
            UpdateObstacleLine()
        elseif not silentAimEnabled then
            HideObstacleLines()
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
