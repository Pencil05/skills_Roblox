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
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= plr.Name then
			--realbomb! (Too strong)
			local explosion = Instance.new("Explosion")
			explosion.Parent = ehe
			explosion.Position = ehe.Position
			explosion.BlastRadius = 20
			explosion.BlastPressure = 1000000000 --fix it if your want to use
          
			--Damage
			hit.Parent.Humanoid:TakeDamage(damage)
		end	
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


