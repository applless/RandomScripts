--// by @trans
if (not game:IsLoaded()) then 
	game.Loaded:Wait()
	task.wait(2)
end
	
local Player = game:GetService("Players").LocalPlayer
local Disabled = false

repeat task.wait(0.1) until (Player.Character) and (Player.Character:FindFirstChild("FULLY_LOADED_CHAR")) 

for i = 1, 2 do 
	game:GetService("RunService").Stepped:Connect(function()
		if (Disabled == true) then return end
		if (Player.Character:FindFirstChild("Wallet")) then 
			Player.Character["Wallet"].Parent = Player.Backpack
		else 
			Player.Backpack["Wallet"].Parent = Player.Character
		end
		pcall(function()
			Player.Character.Animate.Disabled = true
		end)
	end)
end

Player.CharacterAdded:Connect(function()
	Disabled = true
end)
