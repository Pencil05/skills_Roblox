local eff  = game:GetService("ReplicatedStorage").yourEffectskill
local twr = game:GetService("TweenService")

script.Parent.OnServerEvent:Connect(function(plr)
	--cloneEffectfromStorage
	local Rootpart = plr.Character.HumanoidRootPart --crate skill from rootpart(can change)
	local ehe = eff:Clone()
	ehe.Parent = workspace
	ehe.CanCollide = false
	ehe.Anchored = false
	
	--show
	ehe.CFrame = Rootpart.CFrame*CFrame.new(0,0,-7)
	
	--hit damage
  	local damage = 20
	ehe.Touched:Connect(function(hit)
		--Damage
		hit.Parent.Humanoid:TakeDamage(damage)
	end)
	
	--shot
	local tween = twr:Create(ehe,TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false),
		{
		CFrame = ehe.CFrame*CFrame.new(0,0,-150)
		})
	tween:Play()
	
	--delete
	wait(2)
	ehe:Destroy()
	
end)


