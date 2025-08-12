--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local IdFolder = ReplicatedStorage:WaitForChild("IdFolder")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local gui = script.Parent
local tabsFrame = gui:WaitForChild("Tabs")
local genderFrame = gui:WaitForChild("GenderFrame")
local finishButton = gui:WaitForChild("FinishButton")

-- Default customization table
local customizationData = {
	Gender = "Male";
	Shoes = "0";
	-- Add other categories as needed
}

local function resetClothingSelections()
	for _, element in ipairs(tabsFrame:GetDescendants()) do
		if element:IsA("TextLabel") and customizationData[element.Name] ~= nil then
			customizationData[element.Name] = "0"
			local selectedNum = element:FindFirstChild("SelectedNumber")
			local selectedNumLabel = element:FindFirstChild("SelectedNumberTextLabel")
			if selectedNum then selectedNum.Value = 0 end
			if selectedNumLabel then selectedNumLabel.Text = "0" end
			Remotes.UpdateOverviewCharacter:FireServer(element.Name, 0, "Remove")
		end
	end
end

-- Handle gender buttons
genderFrame.MaleButton.MouseButton1Click:Connect(function()
	customizationData.Gender = "Male"
	Remotes.UpdateGender:FireServer("Male")
	resetClothingSelections()
end)

genderFrame.FemaleButton.MouseButton1Click:Connect(function()
	customizationData.Gender = "Female"
	Remotes.UpdateGender:FireServer("Female")
	resetClothingSelections()
end)

-- Clothing category buttons logic (simplified, just for Shoes here)
for _, element in ipairs(tabsFrame:GetDescendants()) do
	if element:IsA("TextLabel") and element.Name == "Shoes" then
		local selectedNum = element:WaitForChild("SelectedNumber")
		local leftBtn = element:WaitForChild("LeftArrowButton")
		local rightBtn = element:WaitForChild("RightArrowButton")

		local function updateClothing(valueChange)
			local genderFolder = IdFolder:FindFirstChild(customizationData.Gender)
			if not genderFolder then return warn("Can't find gender folder") end
			local categoryFolder = genderFolder:FindFirstChild(element.Name)
			if not categoryFolder then return warn("Can't find category folder for "..element.Name) end

			local oldValue = tonumber(customizationData[element.Name]) or 0
			local newValue = oldValue + valueChange

			if newValue < 0 then
				newValue = #categoryFolder:GetChildren()
			elseif newValue > #categoryFolder:GetChildren() then
				newValue = 0
			end

			selectedNum.Value = newValue
			element.SelectedNumberTextLabel.Text = tostring(newValue)
			customizationData[element.Name] = tostring(newValue)

			if newValue == 0 then
				Remotes.UpdateOverviewCharacter:FireServer(element.Name, 0, "Remove")
			else
				Remotes.UpdateOverviewCharacter:FireServer(element.Name, newValue, "Add")
			end
		end

		leftBtn.MouseButton1Click:Connect(function() updateClothing(-1) end)
		rightBtn.MouseButton1Click:Connect(function() updateClothing(1) end)
	end
end

finishButton.MouseButton1Click:Connect(function()
	Remotes.FinishCustomization:FireServer(customizationData)
end)