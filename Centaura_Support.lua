_G.SupportModeBot = false

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

local DamagerRemote = ReplicatedStorage
	:WaitForChild("TREKRemotes")
	:WaitForChild("DamagerRemote")

while task.wait() do

	local target = _G.SupportModeBot

	if target
		and target ~= false
		and typeof(target) == "Instance"
		and target:IsA("Player")
	then

		local character = LocalPlayer.Character
		if not character then
			continue
		end

		local tool = character:FindFirstChildWhichIsA("Tool")
		if not tool then
			continue
		end

		local gun = tool:FindFirstChild("Gun")
		if not gun then
			continue
		end

		local targetCharacter = target.Character
		local targetHead = targetCharacter and targetCharacter:FindFirstChild("Head")

		if not targetCharacter or not targetHead then
			_G.SupportModeBot = false
			continue
		end

		DamagerRemote:FireServer(
			gun,
			Vector3.new(0, 0, 0),
			targetCharacter,
			200,
			targetHead
		)

		_G.SupportModeBot = false
	end
end
