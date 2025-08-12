end
	local SlotSelector_2_upvr = script.Parent.SlotSelector
	local CharacterEditor_upvr = script.Parent.CharacterEditor
	local CharacterInfo_upvr = script.Parent.CharacterInfo
	local CC_Values_upvr = script.Parent["CC Values"]
	LocalPlayer_upvr:RequestStreamAroundAsync(Vector3.new(393.007, 24.1110, -721.82))
	local var16_upvw = false
	local var17_upvw
	local var18_upvw
	local var19_upvw
	local var20_upvw
	local var21_upvw
	RunService.RenderStepped:Connect(function() -- Line 48
		--[[ Upvalues[7]:
			[1]: var18_upvw (read and write)
			[2]: var17_upvw (read and write)
			[3]: CC_Values_upvr (readonly)
			[4]: CharacterEditor_upvr (readonly)
			[5]: var20_upvw (read and write)
			[6]: var19_upvw (read and write)
			[7]: var21_upvw (read and write)
		]]
		if script.Parent.Enabled == true then
			game.Workspace.CurrentCamera.CFrame = game.Workspace.MenuAssets.Cameras.MovementCam.CFrame
			if var18_upvw ~= nil and var17_upvw ~= nil then
				CharacterEditor_upvr.Body.HairList.Hair.Content.CurrentHairStyle.Text = CC_Values_upvr.Hair.Value.." <font color=\"rgb(149, 149, 149)\">/ "..var18_upvw.."</font>"
			end
			if var20_upvw ~= nil and var19_upvw ~= nil then
				CharacterEditor_upvr.Body.HairList.FacialHair.Content.CurrentHairStyle.Text = CC_Values_upvr.FacialHair.Value.." <font color=\"rgb(149, 149, 149)\">/ "..var20_upvw.."</font>"
			end
			local var27
			if var21_upvw ~= nil then
				var27 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).BodyTypes:GetChildren()
				var27 = 1
				for _, v in pairs(var21_upvw) do
					if v.BodyName == CC_Values_upvr.BodyType.Value then
						var27 = v.BodyId
					end
				end
				CharacterEditor_upvr.Body.BodyList.BodyType.Content.CurrentBodyType.Text = var27.." <font color=\"rgb(149, 149, 149)\">/"..(#var27).."</font>"
			end
		end
	end)
	local var31_upvw
	local var32_upvw
	local TweenInfo_new_result1_2_upvr = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
	function TweenCamera(arg1) -- Line 96
		--[[ Upvalues[5]:
			[1]: var31_upvw (read and write)
			[2]: var32_upvw (read and write)
			[3]: TweenService_2_upvr (readonly)
			[4]: TweenInfo_new_result1_2_upvr (readonly)
			[5]: LocalPlayer_upvr (readonly)
		]]
		local MovementCam = game.Workspace.MenuAssets.Cameras.MovementCam
		if var31_upvw then
			var31_upvw:Pause()
		end
		if var32_upvw then
			var32_upvw:Pause()
		end
		var31_upvw = TweenService_2_upvr:Create(MovementCam, TweenInfo_new_result1_2_upvr, {
			Position = arg1.Position;
		})
		LocalPlayer_upvr:RequestStreamAroundAsync(arg1.Position)
		var32_upvw = TweenService_2_upvr:Create(MovementCam, TweenInfo_new_result1_2_upvr, {
			Orientation = arg1.Orientation;
		})
		var31_upvw:Play()
		var32_upvw:Play()
	end
	function LoadChar(arg1, arg2) -- Line 119
		local clone_7 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(arg1).BodyTypes:FindFirstChild(arg2):Clone()
		if game.Workspace.MenuAssets:FindFirstChild("CC Char") then
			game.Workspace.MenuAssets:FindFirstChild("CC Char"):Destroy()
		end
		clone_7.Parent = game.Workspace.MenuAssets
		clone_7.Name = "CC Char"
		clone_7.LowerTorso.CFrame = game.Workspace.MenuAssets.Landing.CFrame
	end
	for _, v_2 in pairs(CC_Values_upvr:GetChildren()) do
		if v_2.Name == "Shirt" then
			local MenuAssets_upvr = game.Workspace.MenuAssets
			v_2.Changed:Connect(function(arg1) -- Line 133
				--[[ Upvalues[2]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char:FindFirstChildOfClass("Shirt") then
						CC_Char:FindFirstChildOfClass("Shirt"):Destroy()
					end
					local clone_2 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Shirt:FindFirstChild(arg1):Clone()
					clone_2.Name = "Shirt"
					clone_2.Parent = CC_Char
				end
			end)
		elseif v_2.Name == "BodyType" then
			v_2.Changed:Connect(function(arg1) -- Line 150
				--[[ Upvalues[2]:
					[1]: CharacterEditor_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if CharacterEditor_upvr.Visible == false then
				else
					LoadChar(CC_Values_upvr.Gender.Value, arg1)
					wait(1)
					CC_Values_upvr.Shirt.Value = "[TEMP]"
					CC_Values_upvr.Shirt.Value = CC_Values_upvr.Shirt.Value
					CC_Values_upvr.Pants.Value = "[TEMP]"
					CC_Values_upvr.Pants.Value = CC_Values_upvr.Pants.Value
					CC_Values_upvr.Shoes.Value = "[TEMP]"
					CC_Values_upvr.Shoes.Value = CC_Values_upvr.Shoes.Value
					CC_Values_upvr.Hat.Value = "[TEMP]"
					CC_Values_upvr.Hat.Value = CC_Values_upvr.Hat.Value
					CC_Values_upvr.Accessory.Value = "[TEMP]"
					CC_Values_upvr.Accessory.Value = CC_Values_upvr.Accessory.Value
					CC_Values_upvr.Race.Value = "[TEMP]"
					CC_Values_upvr.Race.Value = CC_Values_upvr.Race.Value
					CC_Values_upvr.FacialHairColor.Value = "[TEMP]"
					CC_Values_upvr.FacialHairColor.Value = CC_Values_upvr.FacialHairColor.Value
					CC_Values_upvr.HairColor.Value = "[TEMP]"
					CC_Values_upvr.HairColor.Value = CC_Values_upvr.HairColor.Value
					CC_Values_upvr.Hair.Value = 0
					wait(0.1)
					CC_Values_upvr.Hair.Value = CC_Values_upvr.Hair.Value
					CC_Values_upvr.FacialHair.Value = 0
					wait(0.1)
					CC_Values_upvr.FacialHair.Value = CC_Values_upvr.FacialHair.Value
				end
			end)
		elseif v_2.Name == "Pants" then
			v_2.Changed:Connect(function(arg1) -- Line 198
				--[[ Upvalues[2]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_7 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_7:FindFirstChildOfClass("Pants") then
						CC_Char_7:FindFirstChildOfClass("Pants"):Destroy()
					end
					local clone_6 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Pants:FindFirstChild(arg1):Clone()
					clone_6.Name = "Pants"
					clone_6.Parent = CC_Char_7
				end
			end)
		elseif v_2.Name == "Shoes" then
			v_2.Changed:Connect(function(arg1) -- Line 214
				--[[ Upvalues[3]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
					[3]: CharacterEditor_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_4 = MenuAssets_upvr:FindFirstChild("CC Char")
					local SOME = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Shoes:FindFirstChild(arg1)
					if not SOME then
						warn("Shoe folder not found for value:", arg1)
						return
					end
					for i_35, v_35 in pairs(CC_Char_4:GetChildren()) do
						if v_35:IsA("Accessory") and v_35.Name:match("^Shoes_") then
							v_35:Destroy()
						end
					end
					if arg1 ~= "" then
						v_35 = CharacterEditor_upvr
						i_35 = v_35.Clothing
						i_35.BottomOrder.Shoes.RemoveButton.Visible = true
					else
						v_35 = CharacterEditor_upvr
						i_35 = v_35.Clothing
						i_35.BottomOrder.Shoes.RemoveButton.Visible = false
						return
					end
					for _, v_36 in pairs(SOME:GetChildren()) do
						if v_36:IsA("Accessory") then
							local clone_3 = v_36:Clone()
							clone_3.Name = "Shoes_"..clone_3.Name
							clone_3.Parent = CC_Char_4
							local BodyHeightScale_4 = CC_Char_4.Humanoid.BodyHeightScale
							BodyHeightScale_4.Value += 0.01
							wait(0.1)
							local BodyHeightScale = CC_Char_4.Humanoid.BodyHeightScale
							BodyHeightScale.Value -= 0.01
						end
					end
				end
			end)
		elseif v_2.Name == "Hat" then
			v_2.Changed:Connect(function(arg1) -- Line 260
				--[[ Upvalues[3]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CharacterEditor_upvr (readonly)
					[3]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_3 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_3:FindFirstChild("Hat") then
						CC_Char_3:FindFirstChild("Hat"):Destroy()
					end
					if arg1 ~= "" then
						CharacterEditor_upvr.Clothing.BottomOrder.Head.RemoveButton.Visible = true
					else
						CharacterEditor_upvr.Clothing.BottomOrder.Head.RemoveButton.Visible = false
						return
					end
					local clone_5 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Hat:FindFirstChild(arg1):Clone()
					clone_5.Name = "Hat"
					clone_5.Parent = CC_Char_3
					local BodyHeightScale_10 = CC_Char_3.Humanoid.BodyHeightScale
					BodyHeightScale_10.Value += 0.01
					wait(0.1)
					local BodyHeightScale_2 = CC_Char_3.Humanoid.BodyHeightScale
					BodyHeightScale_2.Value -= 0.01
				end
			end)
		elseif v_2.Name == "Accessory" then
			v_2.Changed:Connect(function(arg1) -- Line 287
				--[[ Upvalues[3]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CharacterEditor_upvr (readonly)
					[3]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_2 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_2:FindFirstChild("Accessory") then
						CC_Char_2:FindFirstChild("Accessory"):Destroy()
					end
					if arg1 ~= "" then
						CharacterEditor_upvr.Clothing.BottomOrder.Accessories.RemoveButton.Visible = true
					else
						CharacterEditor_upvr.Clothing.BottomOrder.Accessories.RemoveButton.Visible = false
						return
					end
					local clone_14 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Accessory:FindFirstChild(arg1):Clone()
					clone_14.Name = "Accessory"
					clone_14.Parent = CC_Char_2
					local BodyHeightScale_7 = CC_Char_2.Humanoid.BodyHeightScale
					BodyHeightScale_7.Value += 0.01
					wait(0.1)
					local BodyHeightScale_9 = CC_Char_2.Humanoid.BodyHeightScale
					BodyHeightScale_9.Value -= 0.01
				end
			end)
		elseif v_2.Name == "Race" then
			v_2.Changed:Connect(function(arg1) -- Line 314
				--[[ Upvalues[2]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if game.Workspace.MenuAssets:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_10 = MenuAssets_upvr:FindFirstChild("CC Char")
					local string_split_result1_6 = string.split(CC_Values_upvr.Race.Value, ',')
					local Color3_new_result1 = Color3.new(tonumber(string_split_result1_6[1]), tonumber(string_split_result1_6[2]), tonumber(string_split_result1_6[3]))
					for _, v_37 in pairs(CC_Char_10.Head:GetChildren()) do
						if v_37.ClassName == "Part" then
							v_37.Color = Color3_new_result1
						end
					end
					CC_Char_10:FindFirstChild("Ears").Handle.Color = Color3_new_result1
					CC_Char_10:FindFirstChild("Nose").Handle.Color = Color3_new_result1
					for _, v_38 in pairs(CC_Char_10:GetChildren()) do
						if v_38.ClassName == "MeshPart" or v_38.ClassName == "Part" then
							v_38.Color = Color3_new_result1
						end
					end
				end
			end)
		elseif v_2.Name == "Hair" then
			v_2.Changed:Connect(function(arg1) -- Line 345
				--[[ Upvalues[3]:
					[1]: MenuAssets_upvr (readonly)
					[2]: var17_upvw (read and write)
					[3]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					local CC_Char_6 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_6:FindFirstChild("Hair") then
						CC_Char_6:FindFirstChild("Hair"):Destroy()
					end
					if arg1 == 0 then return end
					local var95 = ""
					if var17_upvw ~= nil then
						for _, v_39 in pairs(var17_upvw) do
							if v_39.HairId == arg1 then
								var95 = v_39.HairName
							end
						end
					else
						warn("Error when changing hair style!")
						return
					end
					local clone_11 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).Hair:FindFirstChild(var95):Clone()
					clone_11.Name = "Hair"
					if clone_11:FindFirstChild("Handle") and clone_11.Handle:FindFirstChildOfClass("SpecialMesh") then
						clone_11.Handle:FindFirstChildOfClass("SpecialMesh").TextureId = ""
						local string_split_result1 = string.split(CC_Values_upvr.HairColor.Value, ',')
						clone_11.Handle.Color = Color3.new(tonumber(string_split_result1[1]), tonumber(string_split_result1[2]), tonumber(string_split_result1[3]))
					end
					clone_11.Parent = CC_Char_6
					local BodyHeightScale_6 = CC_Char_6.Humanoid.BodyHeightScale
					BodyHeightScale_6.Value += 0.01
					wait(0.1)
					local BodyHeightScale_3 = CC_Char_6.Humanoid.BodyHeightScale
					BodyHeightScale_3.Value -= 0.01
				end
			end)
		elseif v_2.Name == "FacialHairColor" then
			v_2.Changed:Connect(function(arg1) -- Line 392
				--[[ Upvalues[2]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_5 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_5:FindFirstChild("FacialHair") then
						local FacialHair_3 = CC_Char_5:FindFirstChild("FacialHair")
						if FacialHair_3:FindFirstChild("Handle") and FacialHair_3.Handle:FindFirstChildOfClass("SpecialMesh") then
							FacialHair_3.Handle:FindFirstChildOfClass("SpecialMesh").TextureId = ""
							local string_split_result1_2 = string.split(CC_Values_upvr.FacialHairColor.Value, ',')
							FacialHair_3.Handle.Color = Color3.new(tonumber(string_split_result1_2[1]), tonumber(string_split_result1_2[2]), tonumber(string_split_result1_2[3]))
						end
					end
				end
			end)
		elseif v_2.Name == "HairColor" then
			v_2.Changed:Connect(function(arg1) -- Line 415
				--[[ Upvalues[2]:
					[1]: MenuAssets_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					if arg1 == "[TEMP]" then return end
					local CC_Char_8 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_8:FindFirstChild("Hair") then
						local Hair = CC_Char_8:FindFirstChild("Hair")
						if Hair:FindFirstChild("Handle") and Hair.Handle:FindFirstChildOfClass("SpecialMesh") then
							Hair.Handle:FindFirstChildOfClass("SpecialMesh").TextureId = ""
							local string_split_result1_3 = string.split(CC_Values_upvr.HairColor.Value, ',')
							Hair.Handle.Color = Color3.new(tonumber(string_split_result1_3[1]), tonumber(string_split_result1_3[2]), tonumber(string_split_result1_3[3]))
						end
					end
				end
			end)
		elseif v_2.Name == "FacialHair" then
			v_2.Changed:Connect(function(arg1) -- Line 438
				--[[ Upvalues[3]:
					[1]: MenuAssets_upvr (readonly)
					[2]: var19_upvw (read and write)
					[3]: CC_Values_upvr (readonly)
				]]
				if MenuAssets_upvr:FindFirstChild("CC Char") then
					local CC_Char_9 = MenuAssets_upvr:FindFirstChild("CC Char")
					if CC_Char_9:FindFirstChild("FacialHair") then
						CC_Char_9:FindFirstChild("FacialHair"):Destroy()
					end
					if arg1 == 0 then return end
					local var120 = ""
					if var19_upvw ~= nil then
						for _, v_40 in pairs(var19_upvw) do
							if v_40.HairId == arg1 then
								var120 = v_40.HairName
							end
						end
					else
						warn("Error when changing face hair style!")
						return
					end
					local clone_10 = game.ReplicatedStorage.CharacterAssets:FindFirstChild("Male").FacialHair:FindFirstChild(var120):Clone()
					clone_10.Name = "FacialHair"
					if clone_10:FindFirstChild("Handle") and clone_10.Handle:FindFirstChildOfClass("SpecialMesh") then
						clone_10.Handle:FindFirstChildOfClass("SpecialMesh").TextureId = ""
						local string_split_result1_4 = string.split(CC_Values_upvr.FacialHairColor.Value, ',')
						clone_10.Handle.Color = Color3.new(tonumber(string_split_result1_4[1]), tonumber(string_split_result1_4[2]), tonumber(string_split_result1_4[3]))
					end
					clone_10.Parent = CC_Char_9
					local BodyHeightScale_8 = CC_Char_9.Humanoid.BodyHeightScale
					BodyHeightScale_8.Value += 0.01
					wait(0.1)
					local BodyHeightScale_5 = CC_Char_9.Humanoid.BodyHeightScale
					BodyHeightScale_5.Value -= 0.01
				end
			end)
		end
	end
	local MarketplaceService_upvr = game:GetService("MarketplaceService")
	function LoadSlotUIs() -- Line 490
		--[[ Upvalues[7]:
			[1]: SlotSelector_2_upvr (readonly)
			[2]: LocalPlayer_upvr (readonly)
			[3]: var16_upvw (read and write)
			[4]: MarketplaceService_upvr (readonly)
			[5]: CharacterInfo_upvr (readonly)
			[6]: CC_Values_upvr (readonly)
			[7]: TweenService_2_upvr (readonly)
		]]
		for _, v_3_upvr in pairs(SlotSelector_2_upvr:GetChildren()) do
			if v_3_upvr:IsA("Frame") and v_3_upvr:FindFirstChild("CharacterName") and v_3_upvr.Name ~= "CharacterThree" then
				local SOME_upvr = LocalPlayer_upvr.PlayerData:FindFirstChild(v_3_upvr.Name)
				local var145
				if SOME_upvr.Perks.Value ~= "" and string.find(SOME_upvr.Perks.Value, '#') then
					for _, v_4 in pairs(string.split(SOME_upvr.Perks.Value, '#')) do
						if v_4 == "Dead" then
							var145 = true
						end
					end
				end
				if v_3_upvr.Name == "CharacterOne" then
					local InfoChar1_2 = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector.InfoChar1
					InfoChar1_2.Dirty.Text = '$'..SOME_upvr.MuddyMoney.Value
					InfoChar1_2.Cash.Text = '$'..SOME_upvr.Cash.Value
					InfoChar1_2.Bank.Text = '$'..SOME_upvr.Bank.Value
					InfoChar1_2.Police.Text = "unemployed"
				end
				if v_3_upvr.Name == "CharacterTwo" then
					local InfoChar2 = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector.InfoChar2
					InfoChar2.Dirty.Text = '$'..SOME_upvr.MuddyMoney.Value
					InfoChar2.Cash.Text = '$'..SOME_upvr.Cash.Value
					InfoChar2.Bank.Text = '$'..SOME_upvr.Bank.Value
					InfoChar2.Police.Text = " unemployed"
				end
				if var145 then
					v_3_upvr.CharacterName.TextColor3 = Color3.fromRGB(255, 0, 0)
					if not v_3_upvr:FindFirstChild("Dead") then
						local BoolValue = Instance.new("BoolValue")
						BoolValue.Name = "Dead"
						BoolValue.Parent = v_3_upvr
						-- KONSTANTWARNING: GOTO [206] #133
					end
				else
					v_3_upvr.CharacterName.TextColor3 = Color3.fromRGB(255, 255, 255)
					if v_3_upvr:FindFirstChild("Dead") then
						v_3_upvr.Dead:Destroy()
					end
				end
				if v_3_upvr.Name == "CharacterTwo" then
					if SOME_upvr.CharName.Value ~= "No Character" and not var145 then
						if v_3_upvr:FindFirstChild("Locked") then
							v_3_upvr.Locked.Visible = false
							v_3_upvr.Locked.Active = false
						end
						v_3_upvr.Create.Visible = false
						v_3_upvr.Create.Active = false
					elseif SOME_upvr.CharName.Value == "No Character" or var145 then
						if v_3_upvr:FindFirstChild("Locked") then
							v_3_upvr.Locked.Visible = true
							v_3_upvr.Locked.Active = true
						end
						v_3_upvr.Create.Visible = false
						v_3_upvr.Create.Active = false
					end
				end
				if SOME_upvr.CharName.Value ~= "No Character" then
					v_3_upvr.Create.Visible = false
					v_3_upvr.Load.Visible = true
					v_3_upvr.CharacterName.Visible = true
					v_3_upvr.CharacterName.Text = SOME_upvr.CharName.Value
					v_3_upvr.RemoveButton.Visible = true
				else
					if v_3_upvr.Name == "CharacterOne" then
						v_3_upvr.Create.Visible = true
						v_3_upvr.Create.Active = true
					end
					v_3_upvr.Load.Visible = false
					v_3_upvr.CharacterName.Visible = true
					v_3_upvr.CharacterName.Text = "No Character"
					v_3_upvr.CharacterName.TextColor3 = Color3.fromRGB(255, 255, 255)
					v_3_upvr.RemoveButton.Visible = false
				end
				if v_3_upvr.Name == "CharacterTwo" and v_3_upvr:FindFirstChild("Locked") then
					v_3_upvr.Locked.MouseButton1Click:Connect(function() -- Line 579
						--[[ Upvalues[3]:
							[1]: var16_upvw (copied, read and write)
							[2]: MarketplaceService_upvr (copied, readonly)
							[3]: LocalPlayer_upvr (copied, readonly)
						]]
						if not var16_upvw then
							var16_upvw = true
							MarketplaceService_upvr:PromptProductPurchase(LocalPlayer_upvr, 3271339019)
							wait(1)
							var16_upvw = false
						end
					end)
				end
				v_3_upvr.Create.MouseButton1Click:Connect(function() -- Line 589
					--[[ Upvalues[6]:
						[1]: var16_upvw (copied, read and write)
						[2]: LocalPlayer_upvr (copied, readonly)
						[3]: v_3_upvr (readonly)
						[4]: CharacterInfo_upvr (copied, readonly)
						[5]: SlotSelector_2_upvr (copied, readonly)
						[6]: CC_Values_upvr (copied, readonly)
					]]
					if not var16_upvw then
						var16_upvw = true
						if LocalPlayer_upvr.PlayerData:FindFirstChild(v_3_upvr.Name).CharName.Value == "No Character" then
							CharacterInfo_upvr.Visible = true
							SlotSelector_2_upvr.Visible = false
							CC_Values_upvr.Slot.Value = v_3_upvr.Name
							LoadChar("Male", "StandardBody")
							TweenCamera(game.Workspace.MenuAssets.Cameras.FaceViewCam)
						end
						wait(1)
						var16_upvw = false
					end
				end)
				v_3_upvr.RemoveButton.MouseButton1Click:Connect(function() -- Line 605
					--[[ Upvalues[2]:
						[1]: var16_upvw (copied, read and write)
						[2]: v_3_upvr (readonly)
					]]
					if not var16_upvw then
						var16_upvw = true
						game.ReplicatedStorage.Remotes.LoadChar:FireServer("Delete", {
							Slot = v_3_upvr.Name;
						})
						wait(1)
						LoadSlotUIs()
						wait(1)
						var16_upvw = false
					end
				end)
				v_3_upvr.Load.MouseButton1Click:Connect(function() -- Line 616
					--[[ Upvalues[5]:
						[1]: var16_upvw (copied, read and write)
						[2]: v_3_upvr (readonly)
						[3]: LocalPlayer_upvr (copied, readonly)
						[4]: SOME_upvr (readonly)
						[5]: TweenService_2_upvr (copied, readonly)
					]]
					TweenCamera(game.Workspace.MenuAssets.Cameras.SpawnCam)
					if var16_upvw == false and not v_3_upvr:FindFirstChild("Dead") then
						local var216
						if not script.Parent.Spawns.Visible then
							var16_upvw = true
							var216 = script
							var216.Parent.Spawns.List.DefaultSpawnLocation.Visible = false
							script.Parent.SlotSelector.Visible = false
							var216 = script.Parent
							for _, v_5 in pairs(var216.Spawns.List:GetChildren()) do
								if v_5:IsA("TextButton") and v_5.Name ~= "DefaultSpawnLocation" then
									v_5:Destroy()
								end
							end
							for _, v_6 in pairs(game.Workspace.HouseSystem:GetChildren()) do
								if not v_6:FindFirstChild("HouseInfo") or v_6.HouseInfo.HouseOwner.Value ~= LocalPlayer_upvr.UserId..':'..SOME_upvr.CharName.Value then
								end
							end
							if not SOME_upvr:FindFirstChild("Comms") or not SOME_upvr.Comms.Value then
							end
							for _, var236 in pairs(script.RetrieveSpawns:InvokeServer()) do
								local _1_upvr_3 = var236[1]
								local var227 = false
								if 1 < 0 then
									if _1_upvr_3 ~= "Comms Spawn" then
										var227 = false
									else
										var227 = true
									end
								else
									-- KONSTANTERROR: Expression was reused, decompilation is incorrect
									if 0 == 0 then
										if _1_upvr_3 == "Comms Spawn" then
											var227 = false
										else
											var227 = true
										end
									else
										var227 = true
									end
								end
								if var227 then
									local clone_4_upvr = script.Parent.Spawns.List.DefaultSpawnLocation:Clone()
									clone_4_upvr.Name = _1_upvr_3
									clone_4_upvr.Text = _1_upvr_3
									clone_4_upvr.Visible = true
									clone_4_upvr.Parent = script.Parent.Spawns.List
									local Vector3Value = Instance.new("Vector3Value", clone_4_upvr)
									Vector3Value.Name = "WorldVector"
									Vector3Value.Value = var236[2]
									local var231_upvw
									local var232_upvw
									clone_4_upvr.MouseButton1Click:Connect(function() -- Line 666
										--[[ Upvalues[4]:
											[1]: var231_upvw (read and write)
											[2]: clone_4_upvr (readonly)
											[3]: var232_upvw (read and write)
											[4]: _1_upvr_3 (readonly)
										]]
										if var231_upvw then
											var231_upvw.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
											local class_UIStroke_3 = var231_upvw:FindFirstChildOfClass("UIStroke")
											if class_UIStroke_3 then
												class_UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
											end
										end
										var231_upvw = clone_4_upvr
										var232_upvw = _1_upvr_3
										clone_4_upvr.BackgroundColor3 = Color3.fromRGB(0, 173, 35)
										local class_UIStroke_4 = clone_4_upvr:FindFirstChildOfClass("UIStroke")
										if class_UIStroke_4 then
											class_UIStroke_4.Color = Color3.fromRGB(0, 173, 35)
										end
									end)
								end
							end
							script.Parent.Spawns.Visible = true
							var16_upvw = false
							local Spawn_2 = script.Parent.Spawns:FindFirstChild("Spawn")
							if Spawn_2 then
								local var237_upvw
								function var236() -- Line 691
									--[[ Upvalues[6]:
										[1]: var232_upvw (read and write)
										[2]: TweenService_2_upvr (copied, readonly)
										[3]: v_3_upvr (copied, readonly)
										[4]: LocalPlayer_upvr (copied, readonly)
										[5]: var16_upvw (copied, read and write)
										[6]: var237_upvw (read and write)
									]]
									if var232_upvw then
										script.Parent.Parent.Black.Enabled = true
										script.Parent.Parent.Black.Content.BackgroundTransparency = 1
										TweenService_2_upvr:Create(script.Parent.Parent.Black.Content, TweenInfo.new(3.5), {
											BackgroundTransparency = 0;
										}):Play()
										wait(3)
										game.ReplicatedStorage.Remotes.LoadChar:FireServer("Load", {
											Slot = v_3_upvr.Name;
											SpawnPoint = var232_upvw;
										})
										script.Parent.Parent.StatsUI.Enabled = true
										script.Parent.Enabled = false
										wait(3.5)
										game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
										TweenService_2_upvr:Create(script.Parent.Parent.Black.Content, TweenInfo.new(2.5), {
											BackgroundTransparency = 1;
										}):Play()
										game.Workspace.CurrentCamera.CameraSubject = LocalPlayer_upvr.Character.Humanoid
										local clone = LocalPlayer_upvr.PlayerGui:WaitForChild("InfoService"):WaitForChild("Tempalte").Template:Clone()
										clone.Name = "WelcomePrompt"
										clone.Info.Text = "Welcome Back"
										clone.Text.Text = "Welcome back to Project LA. Please make sure you're familiar with all the roleplay rules.\nEnjoy your stay! - dripzerr"
										clone.Parent = LocalPlayer_upvr.PlayerGui:WaitForChild("InfoService"):WaitForChild("Frame")
										clone.Visible = true
										local Color3_fromRGB_result1_2 = Color3.fromRGB(255, 110, 64)
										clone.Circle.LeftBG.LeftFrame.LeftBG.ImageColor3 = Color3_fromRGB_result1_2
										clone.Circle.RightBG.RightFrame.LeftBG.ImageColor3 = Color3_fromRGB_result1_2
										clone.Circle.CircleHandler.Enabled = true
										local TweenService_3 = game:GetService("TweenService")
										clone.BackgroundTransparency = 1
										clone.Text.TextTransparency = 1
										clone.Info.TextTransparency = 1
										clone.Size = UDim2.new(0, 0, 0, 0)
										local TweenInfo_new_result1_3 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
										TweenService_3:Create(clone, TweenInfo_new_result1_3, {
											BackgroundTransparency = 0.2;
											Size = UDim2.new(0.5, 0, 0.22, 0);
										}):Play()
										TweenService_3:Create(clone.Text, TweenInfo_new_result1_3, {
											TextTransparency = 0;
										}):Play()
										TweenService_3:Create(clone.Info, TweenInfo_new_result1_3, {
											TextTransparency = 0;
										}):Play()
										TweenService_2_upvr:Create(script.Parent.Parent.Black.Content, TweenInfo.new(2.5), {
											BackgroundTransparency = 1;
										}):Play()
										game.Workspace.CurrentCamera.CameraSubject = LocalPlayer_upvr.Character:WaitForChild("Humanoid")
										wait(1)
										var16_upvw = false
										var237_upvw:Disconnect()
										script.Parent.Spawns.Visible = false
									else
										warn("No spawn point selected!")
									end
								end
								var237_upvw = Spawn_2.MouseButton1Click:Connect(var236)
							else
								warn("SpawnConfirm button not found in Spawns UI!")
								var16_upvw = false
							end
						end
					end
				end)
				local Exit = script.Parent.Spawns:FindFirstChild("Exit")
				if Exit then
					Exit.MouseButton1Click:Connect(function() -- Line 761
						--[[ Upvalues[1]:
							[1]: var16_upvw (copied, read and write)
						]]
						script.Parent.Spawns.Visible = false
						script.Parent.SlotSelector.Visible = true
						var16_upvw = false
					end)
				else
					warn("Exit button not found in Spawns UI!")
				end
				local SlotSelector = LocalPlayer_upvr.PlayerGui:WaitForChild("CCUI"):WaitForChild("SlotSelector")
				for _, v_8 in pairs(SlotSelector:GetChildren()) do
					if v_8:IsA("Frame") and (v_8.Name == "CharacterOne" or v_8.Name == "CharacterTwo" or v_8.Name == "CharacterThree") then
						v_8.Visible = false
					end
					if v_8:IsA("Frame") and (v_8.Name == "InfoChar1" or v_8.Name == "InfoChar2" or v_8.Name == "InfoChar3") then
						v_8.Visible = false
					end
				end
				local CharacterOne_2 = SlotSelector:FindFirstChild("CharacterOne")
				local InfoChar1 = SlotSelector:FindFirstChild("InfoChar1")
				if CharacterOne_2 then
					CharacterOne_2.Visible = true
				end
				if InfoChar1 then
					InfoChar1.Visible = true
				end
				if v_3_upvr.Name == "CharacterOne" and v_3_upvr:FindFirstChild("Next") then
					v_3_upvr.Next.MouseButton1Click:Connect(function() -- Line 792
						--[[ Upvalues[1]:
							[1]: LocalPlayer_upvr (copied, readonly)
						]]
						local CharacterOne_3 = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("CharacterOne")
						local CharacterTwo_4 = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("CharacterTwo")
						if CharacterOne_3 and CharacterTwo_4 and LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar1") and LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar2") then
							CharacterOne_3.Visible = false
							CharacterTwo_4.Visible = true
							-- KONSTANTERROR: Expression was reused, decompilation is incorrect
							LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar1").Visible = false
							-- KONSTANTERROR: Expression was reused, decompilation is incorrect
							LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar2").Visible = true
						end
					end)
				end
				if v_3_upvr.Name == "CharacterTwo" and v_3_upvr:FindFirstChild("Back") then
					v_3_upvr.Back.MouseButton1Click:Connect(function() -- Line 809
						--[[ Upvalues[1]:
							[1]: LocalPlayer_upvr (copied, readonly)
						]]
						local CharacterOne = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("CharacterOne")
						local CharacterTwo_3 = LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("CharacterTwo")
						if CharacterOne and CharacterTwo_3 and LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar1") and LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar2") then
							CharacterOne.Visible = true
							CharacterTwo_3.Visible = false
							-- KONSTANTERROR: Expression was reused, decompilation is incorrect
							LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar1").Visible = true
							-- KONSTANTERROR: Expression was reused, decompilation is incorrect
							LocalPlayer_upvr.PlayerGui.CCUI.SlotSelector:FindFirstChild("InfoChar2").Visible = false
						end
					end)
				end
			end
		end
	end
	MarketplaceService_upvr.PromptProductPurchaseFinished:Connect(function(arg1, arg2, arg3) -- Line 828
		--[[ Upvalues[2]:
			[1]: LocalPlayer_upvr (readonly)
			[2]: SlotSelector_2_upvr (readonly)
		]]
		if arg1 == LocalPlayer_upvr.UserId and arg2 == 3271339019 and arg3 then
			local CharacterTwo = SlotSelector_2_upvr:FindFirstChild("CharacterTwo")
			if CharacterTwo then
				if CharacterTwo:FindFirstChild("Locked") then
					CharacterTwo.Locked.Visible = false
					CharacterTwo.Locked.Active = false
				end
				if CharacterTwo:FindFirstChild("Create") then
					CharacterTwo.Create.Visible = true
					CharacterTwo.Create.Active = true
				end
			end
		end
	end)
	function LoadItemButtons(arg1, arg2) -- Line 844
		--[[ Upvalues[8]:
			[1]: var18_upvw (read and write)
			[2]: var20_upvw (read and write)
			[3]: var17_upvw (read and write)
			[4]: CharacterEditor_upvr (readonly)
			[5]: var19_upvw (read and write)
			[6]: var21_upvw (read and write)
			[7]: CC_Values_upvr (readonly)
			[8]: var16_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		var18_upvw = 0
		var20_upvw = 0
		var17_upvw = {}
		local var306 = 0
		for i_9, v_9 in pairs(game.ReplicatedStorage.CharacterAssets:FindFirstChild(arg1).Hair:GetChildren()) do
			var18_upvw += 1
			var306 += 1
			table.insert(var17_upvw, {
				HairId = var306;
				HairName = v_9.Name;
			})
		end
		if arg1 == "Male" then
			i_9 = CharacterEditor_upvr
			i_9.Body.HairList.FacialHair.Visible = true
			var19_upvw = {}
			v_9 = game.ReplicatedStorage
			i_9 = v_9.CharacterAssets:FindFirstChild("Male")
			local pairs_result1, pairs_result2_30, pairs_result3_2 = pairs(i_9.FacialHair:GetChildren())
			for _, v_10 in pairs_result1, pairs_result2_30, pairs_result3_2 do
				var20_upvw += 1
				table.insert(var19_upvw, {
					HairId = 0 + 1;
					HairName = v_10.Name;
				})
				local var315
			end
		else
			pairs_result3_2 = CharacterEditor_upvr
			nil.Visible = false
		end
		var21_upvw = {}
		table.insert(var21_upvw, {
			BodyId = 1;
			BodyName = "StandardBody";
		})
		for _, v_11 in pairs(game.ReplicatedStorage.CharacterAssets:FindFirstChild(arg1).BodyTypes:GetChildren()) do
			if v_11.Name ~= "StandardBody" then
				table.insert(var21_upvw, {
					BodyId = 1 + 1;
					BodyName = v_11.Name;
				})
			end
		end
		CharacterEditor_upvr.Body.BodyList.BodyType.Content.CurrentBodyType.Text = "1 <font color=\"rgb(149, 149, 149)\">/"..(#game.ReplicatedStorage.CharacterAssets:FindFirstChild(arg1).BodyTypes:GetChildren()).."</font>"
		for _, v_12 in pairs(CharacterEditor_upvr.Clothing.SelectedItemList:GetChildren()) do
			if v_12.ClassName == "Frame" and v_12.Name ~= "Default" then
				v_12:Destroy()
			end
		end
		CharacterEditor_upvr.Clothing.SelectedItemList.Default.Visible = false
		for _, v_13 in pairs(game.ReplicatedStorage.CharacterAssets:FindFirstChild(arg1):FindFirstChild(arg2):GetChildren()) do
			local clone_8_upvr = CharacterEditor_upvr.Clothing.SelectedItemList.Default:Clone()
			clone_8_upvr.Name = v_13.Name
			clone_8_upvr.ItemPrice.Text = "FREE"
			clone_8_upvr.ItemName.Text = v_13.Name
			clone_8_upvr.itemType.Value = arg2
			clone_8_upvr.Parent = CharacterEditor_upvr.Clothing.SelectedItemList
			clone_8_upvr.Visible = true
			if CC_Values_upvr:FindFirstChild(arg2).Value == v_13.Name then
				clone_8_upvr.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			else
				clone_8_upvr.BackgroundColor3 = Color3.new(0, 0, 0)
			end
			clone_8_upvr.TextButton.MouseButton1Click:Connect(function() -- Line 929
				--[[ Upvalues[3]:
					[1]: var16_upvw (copied, read and write)
					[2]: CC_Values_upvr (copied, readonly)
					[3]: clone_8_upvr (readonly)
				]]
				if var16_upvw == false then
					var16_upvw = true
					CC_Values_upvr:FindFirstChild(clone_8_upvr.itemType.Value).Value = clone_8_upvr.Name
					clone_8_upvr.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
					for _, v_14 in pairs(clone_8_upvr.Parent:GetChildren()) do
						if v_14.Name ~= clone_8_upvr.Name and v_14.ClassName == "Frame" then
							v_14.BackgroundColor3 = Color3.new(0, 0, 0)
						end
					end
					wait(0.65)
					var16_upvw = false
				end
			end)
		end
		clone_8_upvr = CharacterEditor_upvr.Clothing.SelectedItemList.UIGridLayout.AbsoluteContentSize.Y
		CharacterEditor_upvr.Clothing.SelectedItemList.CanvasSize = UDim2.new(0, 0, 0, clone_8_upvr)
	end
	LoadSlotUIs()
	CharacterInfo_upvr.Male.ImageButton.MouseButton1Click:Connect(function() -- Line 950
		--[[ Upvalues[1]:
			[1]: CC_Values_upvr (readonly)
		]]
		CC_Values_upvr.Gender.Value = "Male"
	end)
	CharacterInfo_upvr.Female.ImageButton.MouseButton1Click:Connect(function() -- Line 954
		--[[ Upvalues[1]:
			[1]: CC_Values_upvr (readonly)
		]]
		CC_Values_upvr.Gender.Value = "Female"
	end)
	CharacterInfo_upvr.Create.MouseButton1Click:Connect(function() -- Line 958
		--[[ Upvalues[4]:
			[1]: var16_upvw (read and write)
			[2]: CharacterInfo_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
			[4]: CharacterEditor_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [24] 17. Error Block 32 start (CF ANALYSIS FAILED)
		if CharacterInfo_upvr.LastName.Text == "LastName" then
			-- KONSTANTERROR: [31] 21. Error Block 6 start (CF ANALYSIS FAILED)
			do
				return
			end
			-- KONSTANTERROR: [31] 21. Error Block 6 end (CF ANALYSIS FAILED)
		end
		if CharacterInfo_upvr.LastName.Text == "LastName" or string.len(CharacterInfo_upvr.FirstName.Text) <= 1 or CharacterInfo_upvr.LastName.Text == "FirstName" then
		else
			if tonumber(CharacterInfo_upvr.Frame.Age.Text) < 16 or 75 < tonumber(CharacterInfo_upvr.Frame.Age.Text) then return end
			CC_Values_upvr.Age.Value = tonumber(CharacterInfo_upvr.Frame.Age.Text)
			CC_Values_upvr.FirstName.Value = string.upper(string.sub(CharacterInfo_upvr.FirstName.Text, 1, 1))..string.lower(string.sub(CharacterInfo_upvr.FirstName.Text, 2))
			CC_Values_upvr.LastName.Value = string.upper(string.sub(CharacterInfo_upvr.LastName.Text, 1, 1))..string.lower(string.sub(CharacterInfo_upvr.LastName.Text, 2))
			CharacterInfo_upvr.Visible = false
			CharacterEditor_upvr.Visible = true
			LoadChar(CC_Values_upvr.Gender.Value, "StandardBody")
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Shirt")
			CharacterEditor_upvr.Clothing.ItemType.Text = "Upper"
			CharacterEditor_upvr.Clothing.SelectedItemList.Visible = true
			CharacterEditor_upvr.Clothing.BottomOrder.Upper.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_41 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_41.Name ~= "Upper" and v_41.ClassName == "Frame" then
					v_41.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			TweenCamera(game.Workspace.MenuAssets.Cameras.FullBodyCam1)
			wait(1.5)
			var16_upvw = false
			-- KONSTANTERROR: [24] 17. Error Block 32 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [280] 185. Error Block 23 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [280] 185. Error Block 23 end (CF ANALYSIS FAILED)
		end
	end)
	CharacterEditor_upvr.BodySelect.TextButton.MouseButton1Click:Connect(function() -- Line 1000
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: TweenService_2_upvr (readonly)
		]]
		if var16_upvw == false then
			if CharacterEditor_upvr.Body.Visible == false then
				var16_upvw = true
				CharacterEditor_upvr.Clothing.Visible = true
				CharacterEditor_upvr.Body.Visible = false
				CharacterEditor_upvr.Body.Position = UDim2.new(0, 0, 1, 0)
				CharacterEditor_upvr.BodySelect.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				CharacterEditor_upvr.ClothingSelect.BackgroundColor3 = Color3.new(0, 0, 0)
				TweenService_2_upvr:Create(CharacterEditor_upvr.Clothing, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
					Position = UDim2.new(0, 0, 1, 0);
				}):Play()
				wait(1.75)
				CharacterEditor_upvr.Body.Visible = true
				CharacterEditor_upvr.Clothing.Visible = false
				CharacterEditor_upvr.Clothing.Position = UDim2.new(0, 0, 0, 0)
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
					Position = UDim2.new(0, 0, 0, 0);
				}):Play()
				CharacterEditor_upvr.Body.ItemType.Text = "Hair"
				CharacterEditor_upvr.Body.HairList.Visible = true
				CharacterEditor_upvr.Body.BodyList.Visible = false
				CharacterEditor_upvr.Body.BottomOrder.Hair.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				for _, v_15 in pairs(CharacterEditor_upvr.Body.BottomOrder:GetChildren()) do
					if v_15.Name ~= "Hair" and v_15.ClassName == "Frame" then
						v_15.BackgroundColor3 = Color3.new(0, 0, 0)
					end
				end
				wait(1)
				var16_upvw = false
			end
		end
	end)
	script.Parent.Spawns.Exit.MouseButton1Click:Connect(function() -- Line 1032
		--[[ Upvalues[1]:
			[1]: var16_upvw (read and write)
		]]
		if not var16_upvw then
			var16_upvw = true
			TweenCamera(game.Workspace.MenuAssets.Cameras.MovementCam)
			var16_upvw = false
		end
	end)
	CharacterEditor_upvr.Camera1.MouseButton1Click:Connect(function() -- Line 1040
		--[[ Upvalues[1]:
			[1]: var16_upvw (read and write)
		]]
		if not var16_upvw then
			var16_upvw = true
			TweenCamera(game.Workspace.MenuAssets.Cameras.Camera1)
			var16_upvw = false
		end
	end)
	CharacterEditor_upvr.Camera2.MouseButton1Click:Connect(function() -- Line 1047
		--[[ Upvalues[1]:
			[1]: var16_upvw (read and write)
		]]
		if not var16_upvw then
			var16_upvw = true
			TweenCamera(game.Workspace.MenuAssets.Cameras.Camera2)
			var16_upvw = false
		end
	end)
	CharacterEditor_upvr.Camera3.MouseButton1Click:Connect(function() -- Line 1054
		--[[ Upvalues[1]:
			[1]: var16_upvw (read and write)
		]]
		if not var16_upvw then
			var16_upvw = true
			TweenCamera(game.Workspace.MenuAssets.Cameras.Camera3)
			var16_upvw = false
		end
	end)
	CharacterEditor_upvr.ClothingSelect.TextButton.MouseButton1Click:Connect(function() -- Line 1062
		--[[ Upvalues[4]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: TweenService_2_upvr (readonly)
			[4]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			if CharacterEditor_upvr.Clothing.Visible == false then
				var16_upvw = true
				CharacterEditor_upvr.Body.Visible = true
				CharacterEditor_upvr.Clothing.Visible = false
				CharacterEditor_upvr.Clothing.Position = UDim2.new(0, 0, 1, 0)
				CharacterEditor_upvr.ClothingSelect.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				CharacterEditor_upvr.BodySelect.BackgroundColor3 = Color3.new(0, 0, 0)
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
					Position = UDim2.new(0, 0, 1, 0);
				}):Play()
				wait(1.75)
				CharacterEditor_upvr.Clothing.Visible = true
				CharacterEditor_upvr.Body.Visible = false
				CharacterEditor_upvr.Body.Position = UDim2.new(0, 0, 0, 0)
				TweenService_2_upvr:Create(CharacterEditor_upvr.Clothing, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
					Position = UDim2.new(0, 0, 0, 0);
				}):Play()
				CharacterEditor_upvr.Clothing.ItemType.Text = "Upper"
				CharacterEditor_upvr.Clothing.SelectedItemList.Visible = true
				LoadItemButtons(CC_Values_upvr.Gender.Value, "Shirt")
				CharacterEditor_upvr.Clothing.BottomOrder.Upper.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				for _, v_16 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
					if v_16.Name ~= "Upper" and v_16.ClassName == "Frame" then
						v_16.BackgroundColor3 = Color3.new(0, 0, 0)
					end
				end
				wait(0.5)
				var16_upvw = false
			end
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Upper.TextButton.MouseButton1Click:Connect(function() -- Line 1094
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			CharacterEditor_upvr.Clothing.BottomOrder.Upper.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_17 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_17.Name ~= "Upper" and v_17.ClassName == "Frame" then
					v_17.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CharacterEditor_upvr.Clothing.ItemType.Text = "Upper"
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Shirt")
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Lower.TextButton.MouseButton1Click:Connect(function() -- Line 1110
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			CharacterEditor_upvr.Clothing.BottomOrder.Lower.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_18 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_18.Name ~= "Lower" and v_18.ClassName == "Frame" then
					v_18.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CharacterEditor_upvr.Clothing.ItemType.Text = "Lower"
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Pants")
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Shoes.TextButton.MouseButton1Click:Connect(function() -- Line 1126
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			CharacterEditor_upvr.Clothing.BottomOrder.Shoes.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_19 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_19.Name ~= "Shoes" and v_19.ClassName == "Frame" then
					v_19.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CharacterEditor_upvr.Clothing.ItemType.Text = "Shoes"
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Shoes")
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Head.TextButton.MouseButton1Click:Connect(function() -- Line 1145
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			CharacterEditor_upvr.Clothing.BottomOrder.Head.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_20 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_20.Name ~= "Head" and v_20.ClassName == "Frame" then
					v_20.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CharacterEditor_upvr.Clothing.ItemType.Text = "Head"
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Hat")
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Accessories.TextButton.MouseButton1Click:Connect(function() -- Line 1161
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			CharacterEditor_upvr.Clothing.BottomOrder.Accessories.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
			for _, v_21 in pairs(CharacterEditor_upvr.Clothing.BottomOrder:GetChildren()) do
				if v_21.Name ~= "Accessories" and v_21.ClassName == "Frame" then
					v_21.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CharacterEditor_upvr.Clothing.ItemType.Text = "Accessories"
			LoadItemButtons(CC_Values_upvr.Gender.Value, "Accessory")
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Accessories.RemoveButton.MouseButton1Click:Connect(function() -- Line 1177
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			for _, v_22 in pairs(CharacterEditor_upvr.Clothing.SelectedItemList:GetChildren()) do
				if v_22.ClassName == "Frame" then
					v_22.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CC_Values_upvr.Accessory.Value = ""
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Clothing
	MenuAssets_upvr.BottomOrder.Head.RemoveButton.MouseButton1Click:Connect(function() -- Line 1191
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			for _, v_23 in pairs(CharacterEditor_upvr.Clothing.SelectedItemList:GetChildren()) do
				if v_23.ClassName == "Frame" then
					v_23.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			end
			CC_Values_upvr.Hat.Value = ""
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body
	MenuAssets_upvr.BottomOrder.Hair.TextButton.MouseButton1Click:Connect(function() -- Line 1205
		--[[ Upvalues[2]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
		]]
		if var16_upvw == false then
			if CharacterEditor_upvr.Body.HairList.Visible == false then
				var16_upvw = true
				CharacterEditor_upvr.Body.BottomOrder.Hair.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				for _, v_24 in pairs(CharacterEditor_upvr.Body.BottomOrder:GetChildren()) do
					if v_24.Name ~= "Hair" and v_24.ClassName == "Frame" then
						v_24.BackgroundColor3 = Color3.new(0, 0, 0)
					end
				end
				CharacterEditor_upvr.Body.HairList.Visible = true
				CharacterEditor_upvr.Body.BodyList.Visible = false
				CharacterEditor_upvr.Body.ItemType.Text = "Hair"
				wait(0.5)
				var16_upvw = false
			end
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body
	MenuAssets_upvr.BottomOrder.Dimensions.TextButton.MouseButton1Click:Connect(function() -- Line 1222
		--[[ Upvalues[2]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
		]]
		if var16_upvw == false then
			if CharacterEditor_upvr.Body.BodyList.Visible == false then
				var16_upvw = true
				CharacterEditor_upvr.Body.BottomOrder.Dimensions.BackgroundColor3 = Color3.new(0.192157, 0.713725, 0)
				for _, v_25 in pairs(CharacterEditor_upvr.Body.BottomOrder:GetChildren()) do
					if v_25.Name ~= "Dimensions" and v_25.ClassName == "Frame" then
						v_25.BackgroundColor3 = Color3.new(0, 0, 0)
					end
				end
				CharacterEditor_upvr.Body.HairList.Visible = false
				CharacterEditor_upvr.Body.BodyList.Visible = true
				CharacterEditor_upvr.Body.ItemType.Text = "Dimensions"
				wait(0.5)
				var16_upvw = false
			end
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body
	MenuAssets_upvr.HairList.Hair.TextButton.MouseButton1Click:Connect(function() -- Line 1239
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: TweenService_2_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CharacterEditor_upvr.Body.HairList.Hair.Content.Visible == false then
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body.HairList.FacialHair, TweenInfo.new(0.75), {
					Size = UDim2.new(0.918, 0, 0.104, 0);
				}):Play()
				wait(0.3)
				CharacterEditor_upvr.Body.HairList.FacialHair.Content.Visible = false
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body.HairList.Hair, TweenInfo.new(0.75), {
					Size = UDim2.new(0.918, 0, 0.511, 0);
				}):Play()
				wait(0.2)
				CharacterEditor_upvr.Body.HairList.Hair.Content.Visible = true
			end
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body
	MenuAssets_upvr.HairList.FacialHair.TextButton.MouseButton1Click:Connect(function() -- Line 1255
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CharacterEditor_upvr (readonly)
			[3]: TweenService_2_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CharacterEditor_upvr.Body.HairList.FacialHair.Content.Visible == false then
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body.HairList.Hair, TweenInfo.new(0.75), {
					Size = UDim2.new(0.918, 0, 0.104, 0);
				}):Play()
				wait(0.3)
				CharacterEditor_upvr.Body.HairList.Hair.Content.Visible = false
				TweenService_2_upvr:Create(CharacterEditor_upvr.Body.HairList.FacialHair, TweenInfo.new(0.75), {
					Size = UDim2.new(0.918, 0, 0.511, 0);
				}):Play()
				wait(0.2)
				CharacterEditor_upvr.Body.HairList.FacialHair.Content.Visible = true
			end
			wait(0.5)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.HairList
	MenuAssets_upvr.Hair.Content.NextHairStyle.MouseButton1Click:Connect(function() -- Line 1271
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
			[3]: var18_upvw (read and write)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CC_Values_upvr.Hair.Value ~= var18_upvw then
				local Hair_2 = CC_Values_upvr.Hair
				Hair_2.Value += 1
			end
			wait(0.75)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.HairList
	MenuAssets_upvr.Hair.Content.PrevHairStyle.MouseButton1Click:Connect(function() -- Line 1282
		--[[ Upvalues[2]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CC_Values_upvr.Hair.Value ~= 0 then
				local Hair_3 = CC_Values_upvr.Hair
				Hair_3.Value -= 1
			end
			wait(0.75)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.HairList
	MenuAssets_upvr.FacialHair.Content.PrevHairStyle.MouseButton1Click:Connect(function() -- Line 1293
		--[[ Upvalues[2]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CC_Values_upvr.FacialHair.Value ~= 0 then
				local FacialHair_2 = CC_Values_upvr.FacialHair
				FacialHair_2.Value -= 1
			end
			wait(0.75)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.HairList
	MenuAssets_upvr.FacialHair.Content.NextHairStyle.MouseButton1Click:Connect(function() -- Line 1304
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
			[3]: var20_upvw (read and write)
		]]
		if var16_upvw == false then
			var16_upvw = true
			if CC_Values_upvr.FacialHair.Value ~= var20_upvw then
				local FacialHair = CC_Values_upvr.FacialHair
				FacialHair.Value += 1
			end
			wait(0.75)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.BodyList
	MenuAssets_upvr.BodyType.Content.NextBodyType.MouseButton1Click:Connect(function() -- Line 1315
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
			[3]: var21_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var447
		if var16_upvw == false then
			var16_upvw = true
			var447 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).BodyTypes:GetChildren()
			var447 = 1
			local pairs_result1_22, _, pairs_result3_17 = pairs(var21_upvw)
			local var451
			for i_26, v_26 in pairs_result1_22, var451, pairs_result3_17 do
				if v_26.BodyName == CC_Values_upvr.BodyType.Value then
					var447 = v_26.BodyId
				end
			end
			if var447 < #var447 then
				var451 = nil
				i_26 = var21_upvw
				local pairs_result1_10, pairs_result2_14, pairs_result3 = pairs(i_26)
				for _, v_27 in pairs_result1_10, pairs_result2_14, pairs_result3 do
					if v_27.BodyId == var447 + 1 then
						var451 = v_27.BodyName
					end
				end
				pairs_result2_14 = CC_Values_upvr
				pairs_result2_14.BodyType.Value = var451
			end
			var451 = 1.2
			wait(var451)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.BodyList
	MenuAssets_upvr.BodyType.Content.PreviousBodyType.MouseButton1Click:Connect(function() -- Line 1346
		--[[ Upvalues[3]:
			[1]: var16_upvw (read and write)
			[2]: CC_Values_upvr (readonly)
			[3]: var21_upvw (read and write)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var472
		if var16_upvw == false then
			var16_upvw = true
			var472 = game.ReplicatedStorage.CharacterAssets:FindFirstChild(CC_Values_upvr.Gender.Value).BodyTypes:GetChildren()
			var472 = 1
			local pairs_result1_21, _, pairs_result3_11 = pairs(var21_upvw)
			local var476
			for i_28, v_28 in pairs_result1_21, var476, pairs_result3_11 do
				if v_28.BodyName == CC_Values_upvr.BodyType.Value then
					var472 = v_28.BodyId
				end
			end
			if 1 < var472 then
				var476 = nil
				i_28 = var21_upvw
				local pairs_result1_8, pairs_result2_27, pairs_result3_25 = pairs(i_28)
				for _, v_29 in pairs_result1_8, pairs_result2_27, pairs_result3_25 do
					if v_29.BodyId == var472 - 1 then
						var476 = v_29.BodyName
					end
				end
				pairs_result2_27 = CC_Values_upvr
				pairs_result2_27.BodyType.Value = var476
			end
			var476 = 1.2
			wait(var476)
			var16_upvw = false
		end
	end)
	MenuAssets_upvr = CharacterEditor_upvr.Body.HairList
	for _, v_30_upvr in pairs(MenuAssets_upvr.Hair.Content.Colors:GetChildren()) do
		if v_30_upvr.ClassName == "TextButton" then
			v_30_upvr.MouseButton1Click:Connect(function() -- Line 1379
				--[[ Upvalues[2]:
					[1]: v_30_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				CC_Values_upvr.HairColor.Value = v_30_upvr.BackgroundColor3.R..','..v_30_upvr.BackgroundColor3.G..','..v_30_upvr.BackgroundColor3.B
			end)
		end
	end
	for _, v_31_upvr in pairs(CharacterEditor_upvr.Body.HairList.FacialHair.Content.Colors:GetChildren()) do
		if v_31_upvr.ClassName == "TextButton" then
			v_31_upvr.MouseButton1Click:Connect(function() -- Line 1388
				--[[ Upvalues[2]:
					[1]: v_31_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				CC_Values_upvr.FacialHairColor.Value = v_31_upvr.BackgroundColor3.R..','..v_31_upvr.BackgroundColor3.G..','..v_31_upvr.BackgroundColor3.B
			end)
		end
	end
	for _, v_32_upvr in pairs(CharacterEditor_upvr.Body.BodyList.Race.Content.Colors:GetChildren()) do
		if v_32_upvr.ClassName == "TextButton" then
			v_32_upvr.MouseButton1Click:Connect(function() -- Line 1397
				--[[ Upvalues[2]:
					[1]: v_32_upvr (readonly)
					[2]: CC_Values_upvr (readonly)
				]]
				CC_Values_upvr.Race.Value = v_32_upvr.BackgroundColor3.R..','..v_32_upvr.BackgroundColor3.G..','..v_32_upvr.BackgroundColor3.B
			end)
		end
	end
	local var493_upvw = false
	CharacterEditor_upvr.Finish.MouseButton1Click:Connect(function() -- Line 1406
		--[[ Upvalues[6]:
			[1]: var493_upvw (read and write)
			[2]: var17_upvw (read and write)
			[3]: CC_Values_upvr (readonly)
			[4]: var19_upvw (read and write)
			[5]: TweenService_2_upvr (readonly)
			[6]: LocalPlayer_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local SpawnCam = game.Workspace.MenuAssets.Cameras.SpawnCam
		TweenCamera(SpawnCam)
		local var503 = var493_upvw
		local var504
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [71] 47. Error Block 53 start (CF ANALYSIS FAILED)
		local tbl_4_upvr = {
			Slot = CC_Values_upvr.Slot.Value;
		}
		var504 = CC_Values_upvr.LastName.Value
		tbl_4_upvr.CharName = CC_Values_upvr.FirstName.Value..' '..var504
		var504 = CC_Values_upvr
		tbl_4_upvr.Age = tonumber(var504.Age.Value)
		tbl_4_upvr.BodyType = CC_Values_upvr.BodyType.Value
		var504 = CC_Values_upvr.HairColor.Value
		tbl_4_upvr.Hair = var503..';'..var504
		var504 = CC_Values_upvr.FacialHairColor.Value
		tbl_4_upvr.FacialHair = SpawnCam..';'..var504
		tbl_4_upvr.Hat = CC_Values_upvr.Hat.Value
		tbl_4_upvr.Shoes = CC_Values_upvr.Shoes.Value
		tbl_4_upvr.Accessory = CC_Values_upvr.Accessory.Value
		tbl_4_upvr.Shirt = CC_Values_upvr.Shirt.Value
		tbl_4_upvr.Pants = CC_Values_upvr.Pants.Value
		tbl_4_upvr.Gender = CC_Values_upvr.Gender.Value
		tbl_4_upvr.Race = CC_Values_upvr.Race.Value
		tbl_4_upvr.SpawnPoint = nil
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var504 = CC_Values_upvr.Comms.Value
			return var504
		end
		if not CC_Values_upvr:FindFirstChild("Comms") or not INLINED() then
			var504 = 0
		end
		local List = script.Parent.Spawns.List
		List.DefaultSpawnLocation.Visible = false
		for _, v_33 in pairs(List:GetChildren()) do
			if v_33:IsA("TextButton") and v_33.Name ~= "DefaultSpawnLocation" then
				v_33:Destroy()
			end
		end
		for _, var523 in pairs(script.RetrieveSpawns:InvokeServer()) do
			local _1_upvr_2 = var523[1]
			local var514 = false
			if 1 < var504 then
				if _1_upvr_2 ~= "Comms Spawn" then
					var514 = false
				else
					var514 = true
				end
			elseif var504 == 0 then
				if _1_upvr_2 == "Comms Spawn" then
					var514 = false
				else
					var514 = true
				end
			else
				var514 = true
			end
			if var514 then
				local clone_12_upvr = List.DefaultSpawnLocation:Clone()
				clone_12_upvr.Name = _1_upvr_2
				clone_12_upvr.Text = _1_upvr_2
				clone_12_upvr.Visible = true
				clone_12_upvr.Parent = List
				local Vector3Value_3 = Instance.new("Vector3Value")
				Vector3Value_3.Name = "WorldVector"
				Vector3Value_3.Value = var523[2]
				Vector3Value_3.Parent = clone_12_upvr
				local var518_upvw
				local var519_upvw
				clone_12_upvr.MouseButton1Click:Connect(function() -- Line 1486
					--[[ Upvalues[4]:
						[1]: var518_upvw (read and write)
						[2]: clone_12_upvr (readonly)
						[3]: var519_upvw (read and write)
						[4]: _1_upvr_2 (readonly)
					]]
					if var518_upvw then
						var518_upvw.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						local class_UIStroke_7 = var518_upvw:FindFirstChildOfClass("UIStroke")
						if class_UIStroke_7 then
							class_UIStroke_7.Color = Color3.fromRGB(255, 255, 255)
						end
					end
					var518_upvw = clone_12_upvr
					var519_upvw = _1_upvr_2
					clone_12_upvr.BackgroundColor3 = Color3.fromRGB(0, 173, 35)
					local class_UIStroke_8 = clone_12_upvr:FindFirstChildOfClass("UIStroke")
					if class_UIStroke_8 then
						class_UIStroke_8.Color = Color3.fromRGB(0, 173, 35)
					end
				end)
			end
		end
		script.Parent.Spawns.Visible = true
		local Spawn_3 = script.Parent.Spawns:FindFirstChild("Spawn")
		if Spawn_3 then
			local var524_upvw
			function var523() -- Line 1506
				--[[ Upvalues[6]:
					[1]: TweenService_2_upvr (copied, readonly)
					[2]: var519_upvw (read and write)
					[3]: tbl_4_upvr (readonly)
					[4]: LocalPlayer_upvr (copied, readonly)
					[5]: var493_upvw (copied, read and write)
					[6]: var524_upvw (read and write)
				]]
				script.Parent.Parent.Black.Enabled = true
				script.Parent.Parent.Black.Content.BackgroundTransparency = 0
				TweenService_2_upvr:Create(script.Parent.Parent.Black.Content, TweenInfo.new(6), {
					BackgroundTransparency = 1;
				}):Play()
				if var519_upvw then
					tbl_4_upvr.SpawnPoint = var519_upvw
					game.ReplicatedStorage.Remotes.LoadChar:FireServer("Create", tbl_4_upvr)
					script.Parent.Enabled = false
					script.Parent.Spawns.Visible = false
					script.Parent.Parent.StatsUI.Enabled = true
					if LocalPlayer_upvr.Character and LocalPlayer_upvr.Character:FindFirstChild("Humanoid") then
						game.Workspace.CurrentCamera.CameraSubject = LocalPlayer_upvr.Character.Humanoid
					end
					wait(3)
					TweenService_2_upvr:Create(script.Parent.Parent.Black.Content, TweenInfo.new(2.5), {
						BackgroundTransparency = 1;
					}):Play()
					game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
					var493_upvw = false
					var524_upvw:Disconnect()
				else
					warn("No spawn selected")
				end
			end
			var524_upvw = Spawn_3.MouseButton1Click:Connect(var523)
		end
		local Exit_2 = script.Parent.Spawns:FindFirstChild("Exit")
		if Exit_2 then
			Exit_2.MouseButton1Click:Connect(function() -- Line 1531
				--[[ Upvalues[1]:
					[1]: var493_upvw (copied, read and write)
				]]
				var493_upvw = false
			end)
		end
		-- KONSTANTERROR: [71] 47. Error Block 53 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [355] 235. Error Block 43 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [355] 235. Error Block 43 end (CF ANALYSIS FAILED)
	end)
end