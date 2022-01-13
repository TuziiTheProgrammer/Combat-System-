local player = script.Parent.Parent
player.CharacterAdded:wait()
local char = player.Character
local mouse = player:GetMouse()
local t = os.time()
local events = script.Parent.Events
local anims = script.Parent.Animations.Stun

local folder = Instance.new("Folder", char); folder.Name = "Activations"
local activation = Instance.new("BoolValue"); activation.Name = "WepON"; activation.Value = false
local things = anims:GetChildren()


events.Start:FireServer()

mouse.Button1Down:connect(function()
	if activation.Value == false then
		if os.time() - t >= .5 then
			t = os.time()	
			events.Combat:FireServer("Combat", (char.HumanoidRootPart.CFrame * CFrame.new(0,0, -1)).p)	
		end
	end
end)