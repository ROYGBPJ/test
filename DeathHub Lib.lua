local function createGui(parent)
	--ScreenGui1--
	local ScreenGui1 = Instance.new("ScreenGui",parent)
	ScreenGui1["ResetOnSpawn"] = false
	ScreenGui1["IgnoreGuiInset"] = true
	ScreenGui1["Name"] = "Death Hub"
	ScreenGui1["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	----ScreenGui1----
	--Frame2--
	local Frame2 = Instance.new("Frame",ScreenGui1)
	Frame2["BorderColor3"] = Color3.new(0.301961, 0.301961, 0.301961)
	Frame2["Size"] = UDim2.new(0.454301089, 0, 0.481012672, 0)
	Frame2["Position"] = UDim2.new(0.137828246, 0, 0.393491149, 0)
	Frame2["BackgroundColor3"] = Color3.new(0.301961, 0.301961, 0.301961)
	----Frame2----
	--TextLabel3--
	local TextLabel3 = Instance.new("TextLabel",Frame2)
	TextLabel3["RichText"] = true
	TextLabel3["TextColor3"] = Color3.new(1, 0, 0)
	TextLabel3["BorderColor3"] = Color3.new(0.431373, 0.843137, 0.85098)
	TextLabel3["Text"] = "💀Death Hub💀"
	TextLabel3["TextWrapped"] = true
	TextLabel3["TextSize"] = 14
	TextLabel3["Font"] = Enum.Font.Creepster
	TextLabel3["Name"] = "Title"
	TextLabel3["Position"] = UDim2.new(-0.00667010713, 0, 0.0131578948, 0)
	TextLabel3["BackgroundTransparency"] = 1
	TextLabel3["Size"] = UDim2.new(1.00394475, 0, 0.121710524, 0)
	TextLabel3["TextScaled"] = true
	TextLabel3["BackgroundColor3"] = Color3.new(0.333333, 1, 1)
	----TextLabel3----
	--Script4--
	local Script4 = Instance.new("Script",Frame2)
	Script4["Name"] = "Smooth GUI Dragging"
	----Script4----
	--Frame5--
	local Frame5 = Instance.new("Frame",Frame2)
	Frame5["Name"] = "Line"
	Frame5["Position"] = UDim2.new(0.165680468, 0, 0.121710524, 0)
	Frame5["BorderColor3"] = Color3.new(0.333333, 1, 1)
	Frame5["Size"] = UDim2.new(0, 7, 0, 267)
	Frame5["BackgroundColor3"] = Color3.new(0.333333, 1, 1)
	----Frame5----
	--TextButton6--
	local TextButton6 = Instance.new("TextButton",Frame2)
	TextButton6["TextWrapped"] = true
	TextButton6["TextColor3"] = Color3.new(0, 0, 0)
	TextButton6["BorderColor3"] = Color3.new(1, 0, 0)
	TextButton6["Text"] = "❌"
	TextButton6["Font"] = Enum.Font.Creepster
	TextButton6["Name"] = "Delete_UI"
	TextButton6["Position"] = UDim2.new(0.909270048, 0, 0.0131578958, 0)
	TextButton6["BackgroundTransparency"] = 1
	TextButton6["Size"] = UDim2.new(0, 45, 0, 32)
	TextButton6["TextSize"] = 29
	TextButton6["BackgroundColor3"] = Color3.new(0.0823529, 0, 1)
	----TextButton6----
	--Script7--
	local Script7 = Instance.new("Script",TextButton6)
	Script7["Name"] = "Click"
	----Script7----
	--UICorner8--
	local UICorner8 = Instance.new("UICorner",Frame2)
	UICorner8["CornerRadius"] = UDim.new(0.075000003, 0)
	----UICorner8----
	spawn(function() --Source for Script4
		local script = Script4
		local UserInputService = game:GetService("UserInputService")
		local runService = (game:GetService("RunService"));
		
		local gui = script.Parent
		
		local dragging
		local dragInput
		local dragStart
		local startPos
		
		function Lerp(a, b, m)
			return a + (b - a) * m
		end;
		
		local lastMousePos
		local lastGoalPos
		local DRAG_SPEED = (8); -- // The speed of the UI darg.
		function Update(dt)
			if not (startPos) then return end;
			if not (dragging) and (lastGoalPos) then
				gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
				return 
			end;
		
			local delta = (lastMousePos - UserInputService:GetMouseLocation())
			local xGoal = (startPos.X.Offset - delta.X);
			local yGoal = (startPos.Y.Offset - delta.Y);
			lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
		end;
		
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
				lastMousePos = UserInputService:GetMouseLocation()
		
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		
		runService.Heartbeat:Connect(Update)
	end)
	spawn(function() --Source for Script7
		local script = Script7
		local Gui = script.Parent
		
		function onClicked()
		script.Parent.Parent.Parent:Remove()
		end
		
		Gui.MouseButton1Click:connect(onClicked)
	end)
end
createGui(game.CoreGui)