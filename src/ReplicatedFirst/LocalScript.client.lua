local player = game:GetService("Players").LocalPlayer
player.CharacterAdded:wait()
local char = player.Character


char:waitForChild("Animate"):findFirstChild("walk").WalkAnim.AnimationId = "rbxassetid://8196768605"
local delete = char:waitForChild("Animate"):findFirstChild("idle").Animation2
game.Debris:AddItem(delete, 0)
char:waitForChild("Animate"):findFirstChild("idle").Animation1.AnimationId = "rbxassetid://8197735214"

---"rbxassetid://8197623201"
