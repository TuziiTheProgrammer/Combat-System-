local events = script.Parent.Parent
local anims = game:GetService("StarterPack").Animations
local SFX = game:GetService("StarterPack").SFX

combo = 1
local stuns = {"Hit"; "Hit2"; "Hit3"}


events.Start.OnServerEvent:Connect(function(plr)
	local char = plr.Character
	--------------------------
	local folder = Instance.new("Folder", char); folder.Name = "Stuff"
	--------------------------
	local wep_part = Instance.new("Part", folder); wep_part.Size = Vector3.new(.5,.5,.5); wep_part.Position = char["Right Arm"].Position
	wep_part.Transparency = 1
	wep_part.CanCollide = false
	wep_part.Anchored = false
	local wep_motor = Instance.new("Motor6D", wep_part); wep_motor.Part0 = wep_part; wep_motor.Part1 = char["Right Arm"]; wep_motor.C0 = CFrame.new(0, -1, 0)
	--------------------------
	
end)


script.Parent.OnServerEvent:Connect(function(plr, v1, v2, v3)
	local char = plr.Character
		
	if v1 == "Combat" then
				
		local swing = SFX.Swining:Clone()
		swing.Parent = char.Head
		swing.PlaybackSpeed = 3
		game.Debris:AddItem(swing, 0.5)
		swing:Play()
		
		local things = stuns[math.random(1, #stuns)]
		
		
		if combo == 1 and char.Stuff:findFirstChild("Acti") == nil then
			combo = 2
			local bounce = Instance.new("StringValue", char.Stuff); bounce.Name = "Acti"
			
			local pun1 = char.Humanoid:waitForChild("Animator"):LoadAnimation(anims["Punch1"])
			char.Humanoid.WalkSpeed = 0
			pun1:Play()
			task.wait(pun1.Length)
			pun1:Stop()
			char.Humanoid.WalkSpeed = 16
						
			game.Debris:AddItem(bounce, 0)
			
		elseif combo == 2 and char.Stuff:findFirstChild("Acti") == nil then
			combo = 3
			local bounce = Instance.new("StringValue", char.Stuff); bounce.Name = "Acti"
			
			local pun1 = char.Humanoid:waitForChild("Animator"):LoadAnimation(anims["Punch2"])
			char.Humanoid.WalkSpeed = 0
			pun1:Play()	
			task.wait(pun1.Length)
			pun1:Stop()	
			char.Humanoid.WalkSpeed = 16
									
			game.Debris:AddItem(bounce, 0)
			
		elseif combo == 3 and char.Stuff:findFirstChild("Acti") == nil then
			combo = 4
			local bounce = Instance.new("StringValue", char.Stuff); bounce.Name = "Acti"
			
			local pun1 = char.Humanoid:waitForChild("Animator"):LoadAnimation(anims["Punch3"])
			char.Humanoid.WalkSpeed = 0
			pun1:Play()
			task.wait(pun1.Length)
			pun1:Stop()
			char.Humanoid.WalkSpeed = 16
			
			game.Debris:AddItem(bounce, 0)
			
		elseif combo == 4 and char.Stuff:findFirstChild("Acti") == nil then
			combo = 1
			local bounce = Instance.new("StringValue", char.Stuff); bounce.Name = "Acti"
			
			local pun1 = char.Humanoid:waitForChild("Animator"):LoadAnimation(anims["Punch4"])		
			char.Humanoid.WalkSpeed = 0
			pun1:Play()
			task.wait(pun1.Length)
			pun1:Stop()		
			char.Humanoid.WalkSpeed = 16
			
			game.Debris:AddItem(bounce, 0)
		
		end
		------------------------------------------------------------------------------------------------
		local region = Region3.new(v2 - (Vector3.new(1.5, 1.5, 1.5)), v2 + (Vector3.new(1.5, 1.5, 1.5)))
		local register = workspace:FindPartsInRegion3WithIgnoreList(region, {char}, 20)
		for _, thing in pairs(register) do
			if thing.Parent:findFirstChild("Humanoid") and thing.Parent:FindFirstChild("Deb") == nil then
				local deb = Instance.new("BoolValue", thing.Parent)
				local hit = SFX.Hit:Clone()
				hit.Parent = char.Head
				hit.PlaybackSpeed = 3
				thing.Parent["Humanoid"]:TakeDamage(.5)
				game.Debris:AddItem(deb, 0)
				game.Debris:AddItem(hit, 0.5)
				hit:Play()
			end
		end
	end
end)