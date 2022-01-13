local col_s = game:GetService("CollectionService")
local anims = game:GetService("StarterPack").Animations


for _, thing in pairs(col_s:GetTagged("checkers")) do
	
	print(thing.Name)
	
	if thing:findFirstChild("Deb") == nil  then
		repeat task.wait() until thing:FindFirstChild("Ded") == true
	
		local stuff = anims.Stun:GetChildren()
		local stun = thing:findFirstChild("Humanoid"):waitForChild("Animator"):LoadAnimation(anims.Stun[stuff[math.random(1, #stuff)]])
		stun:Play()
		thing.Humanoid.WalkSpeed = 0
		task.wait(stun.Length)
		stun:Stop()
		thing.Humanoid.WalkSpeed = 16
	end
end