local UIS = game:GetService("UserInputService")
local Tool = script.Parent
Tool.Activated:Connect(function()
	script.skill:FireServer() --play remote(create remote to be child of this file)
end)
