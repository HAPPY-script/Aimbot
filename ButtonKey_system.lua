local CreateButtonScreen = Instance.new("ScreenGui")
CreateButtonScreen.Name = "CreateButtonScreen"
CreateButtonScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CreateButtonScreen.DisplayOrder = 9991
CreateButtonScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local BlackFrame = Instance.new("Frame")
BlackFrame.Name = "BlackFrame"
BlackFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BlackFrame.Size = UDim2.new(0, 10000, 0, 10000)
BlackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
BlackFrame.BackgroundTransparency = 1
BlackFrame.BorderSizePixel = 0
BlackFrame.BorderColor3 = Color3.new(0, 0, 0)
BlackFrame.ZIndex = 0
BlackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BlackFrame.Transparency = 1
BlackFrame.Parent = CreateButtonScreen

local ButtonKey = Instance.new("ImageButton")
ButtonKey.Name = "ButtonKey"
ButtonKey.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonKey.Size = UDim2.new(0, 50, 0, 50)
ButtonKey.BackgroundColor3 = Color3.new(0.0392157, 0.172549, 0.290196)
ButtonKey.BackgroundTransparency = 0.30000001192092896
ButtonKey.BorderSizePixel = 0
ButtonKey.BorderColor3 = Color3.new(0, 0, 0)
ButtonKey.Visible = false
ButtonKey.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonKey.Transparency = 0.30000001192092896
ButtonKey.Image = "rbxassetid://13298929624"
ButtonKey.Parent = CreateButtonScreen

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ButtonKey

local UIDragDetector = Instance.new("UIDragDetector")
UIDragDetector.Name = "UIDragDetector"

UIDragDetector.Parent = ButtonKey

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.new(1, 1, 1)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = ButtonKey

local SizeBox = Instance.new("TextBox")
SizeBox.Name = "SizeBox"
SizeBox.Size = UDim2.new(1, 0, 1, 0)
SizeBox.BackgroundColor3 = Color3.new(0.00392157, 0.0784314, 0.196078)
SizeBox.BorderSizePixel = 0
SizeBox.BorderColor3 = Color3.new(0, 0, 0)
SizeBox.Visible = false
SizeBox.Text = "50"
SizeBox.TextColor3 = Color3.new(1, 1, 1)
SizeBox.TextSize = 14
SizeBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SizeBox.TextScaled = true
SizeBox.TextWrapped = true
SizeBox.PlaceholderText = "Size"
SizeBox.Parent = ButtonKey

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = SizeBox

local Frame = CreateButtonScreen
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

-- SYSTEM ==========================================================================================================================--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local AimbotGui = playerGui:WaitForChild("AimbotScript")

local function isFromAimbotGui(guiObject)
	return guiObject and guiObject:IsDescendantOf(AimbotGui)
end

-- STATE
local mode = "idle" -- idle / select / create
local selectedObject = nil
local buttonKeySource = nil
-- "create" / "select" / nil

_G.ButtonKey = false

------------------------------------------------
-- UTIL: convert GUI -> Enum-like key
------------------------------------------------
local function resolveKey(obj)
	if not obj then return nil end

	-- giả lập EnumItem từ GUI instance
	-- bạn có thể map custom nếu cần
	return obj
end

------------------------------------------------
-- SELECT MODE (click anywhere UI)
------------------------------------------------
local function startSelectMode()
	mode = "select"
	selectedObject = nil

	-- disable UI input trong AimbotScript
	AimbotGui.Enabled = false
end

local function stopSelectMode()
	mode = "idle"
	AimbotGui.Enabled = true

	_G.SelectButton = false
	_G.CreateButton = false

	-- clear key khi thoát select
	if buttonKeySource == "select" then
		_G.ButtonKey = false
		buttonKeySource = nil
	end
end

------------------------------------------------
-- CREATE MODE
------------------------------------------------
local blackFrame, buttonKeyObj, sizeBox
local dragConn
local lastPos
local stillTime = 0

local function startCreateMode()
	mode = "create"

	AimbotGui.Enabled = false

	local createGui = playerGui:WaitForChild("CreateButtonScreen")
	blackFrame = createGui:WaitForChild("BlackFrame")

	blackFrame.Visible = true
	blackFrame.BackgroundTransparency = 1

	-- fade in
	task.spawn(function()
		for i = 1, 10 do
			task.wait(0.03)
			blackFrame.BackgroundTransparency = 1 - (i * 0.08)
		end
		blackFrame.BackgroundTransparency = 0.2
	end)

	-- tìm ButtonKey trong UI
	buttonKeyObj = blackFrame:FindFirstChild("ButtonKey", true)
	if not buttonKeyObj then return end

	local drag = buttonKeyObj:FindFirstChildWhichIsA("UIDragDetector", true)
	if drag then
		drag.Enabled = true
	end

	lastPos = buttonKeyObj.AbsolutePosition
	stillTime = 0

	-- detect movement
	dragConn = RunService.RenderStepped:Connect(function(dt)
		if not buttonKeyObj then return end

		local pos = buttonKeyObj.AbsolutePosition

		if (pos - lastPos).Magnitude > 1 then
			stillTime = 0
			lastPos = pos
		else
			stillTime += dt
		end

		-- đứng yên 3s
		if stillTime >= 3 then
			if drag then
				drag.Enabled = false
			end

			-- size box
			sizeBox = buttonKeyObj:FindFirstChild("SizeBox")
			if sizeBox then
				sizeBox.Visible = true
			end

			-- chờ user input size (mock)
			task.spawn(function()
				-- giả lập input số
				local size = 50
				task.wait(2)

				buttonKeyObj.Size = UDim2.new(0, size, 0, size)

				if sizeBox then
					sizeBox.Visible = false
				end

				-- fade out blackframe
				for i = 1, 10 do
					task.wait(0.03)
					blackFrame.BackgroundTransparency = 0.2 + (i * 0.08)
				end

				blackFrame.Visible = false
				AimbotGui.Enabled = true

				_G.ButtonKey = resolveKey(buttonKeyObj)
				buttonKeySource = "create"

				stopCreateMode()
			end)

			if dragConn then
				dragConn:Disconnect()
			end
		end
	end)
end

function stopCreateMode()
	mode = "idle"
	_G.SelectButton = false
	_G.CreateButton = false

	-- clear UI state
	local gui = playerGui:FindFirstChild("CreateButtonScreen")
	if gui then
		local btn = gui:FindFirstChild("ButtonKey", true)
		if btn then
			btn.Visible = false
		end
	end

	if buttonKeySource == "create" then
		_G.ButtonKey = false
		buttonKeySource = nil
	end
end

local function cleanupButtonKeyIfInvalid()
	if not _G.ButtonKey then return end

	-- CASE 1: đang ở select nhưng key đến từ create
	if buttonKeySource == "create" and _G.SelectButton == "waiting" then
		return
	end

	-- CASE 2: đang ở create nhưng key từ select
	if buttonKeySource == "select" and _G.CreateButton == "waiting" then
		return
	end

	-- CASE 3: chuyển mode → reset UI create screen
	if buttonKeySource == "create" and mode ~= "create" then

		local gui = playerGui:FindFirstChild("CreateButtonScreen")
		if gui then
			local btn = gui:FindFirstChild("ButtonKey", true)
			if btn then
				btn.Visible = false
			end

			local black = gui:FindFirstChild("BlackFrame")
			if black then
				black.Visible = false
			end
		end

		_G.ButtonKey = false
		buttonKeySource = nil
	end

	-- CASE 4: chuyển ra ngoài select → clear
	if buttonKeySource == "select" and mode ~= "select" then
		_G.ButtonKey = false
		buttonKeySource = nil
	end
end

------------------------------------------------
-- INPUT LISTENER (global click catcher)
------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end

	------------------------------------------------
	-- SELECT MODE
	------------------------------------------------
	if _G.SelectButton == "waiting" then

		local target = UserInputService:GetMouseLocation()

		local guiObjects = playerGui:GetGuiObjectsAtPosition(target.X, target.Y)

		for _, obj in ipairs(guiObjects) do
			if not isFromAimbotGui(obj) then
				selectedObject = obj
				_G.ButtonKey = resolveKey(obj)
				buttonKeySource = "select"

				stopSelectMode()
				return
			end
		end
	end

	------------------------------------------------
	-- CREATE MODE trigger handled externally
	------------------------------------------------
end)

------------------------------------------------
-- WATCH STATE LOOP
------------------------------------------------
RunService.RenderStepped:Connect(function()

	cleanupButtonKeyIfInvalid()

	-- WAIT SELECT
	if _G.SelectButton == "waiting" and mode ~= "select" then
		startSelectMode()
	end

	-- WAIT CREATE
	if _G.CreateButton == "waiting" and mode ~= "create" then
		startCreateMode()
	end

end)
