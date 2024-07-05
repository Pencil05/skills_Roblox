--this script have to use with my stats script(Can get in my git)
local eff  = game:GetService("ReplicatedStorage").yoursklleffect
local twr = game:GetService("TweenService")

script.Parent.OnServerEvent:Connect(function(plr)
	--clonestart
	local Rootpart = plr.Character.HumanoidRootPart
	local ehe = eff:Clone()
	ehe.Parent = workspace
	ehe.CanCollide = false
	ehe.Anchored = false
	
	--show
	ehe.CFrame = Rootpart.CFrame*CFrame.new(0,0,-4)
	
	--hit damage
	ehe.Touched:Connect(function(hit)
    --add stats exp
		plr.Statfol.intxp.Value += 3

    --hit
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= plr.Name then
			--Damage = Int Stat Value
			hit.Parent.Humanoid:TakeDamage(plr.Statfol.Intelligence.Value)
		end	
	end)
	
	--shot
	local tween = twr:Create(ehe,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false),
		{
		CFrame = ehe.CFrame*CFrame.new(0,0,-150)
		})
	tween:Play()
	
	--delete
	wait(3)
	ehe:Destroy()
	
end)


