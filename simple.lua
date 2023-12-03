

game:GetService("ReplicatedStorage").AutoClick:FireServer()






local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__Menu__2 = l__LocalPlayer__1:WaitForChild("PlayerGui"):WaitForChild("IntroGui"):WaitForChild("Menu");
while true do
	wait();
	if l__Menu__2.Visible == false then
		break;
	end;
end;
local l__Parent__3 = script.Parent;
local l__Colors__4 = l__Parent__3.Colors;
local l__AutoClick__5 = game.ReplicatedStorage:WaitForChild("AutoClick");
game.ReplicatedStorage.ChildRemoved:Connect(function()
	l__LocalPlayer__1:Kick("Missing arguments...");
end);
local v6 = math.random(1000, 2000);
local v7 = { l__Colors__4.Color1, l__Colors__4.Color2, l__Colors__4.Color3, l__Colors__4.Color4, l__Colors__4.Color5 };
for v8 = 1, #v7 do
	v7[v8].Name = "Color";
end;
local u1 = { UDim2.fromScale(0.043, 0), UDim2.fromScale(0.229, 0), UDim2.fromScale(0.415, 0), UDim2.fromScale(0.601, 0), UDim2.fromScale(0.787, 0) };
local function u2(p1)
	if p1 == 1 then
		return "Red";
	end;
	if p1 == 2 then
		return "Orange";
	end;
	if p1 == 3 then
		return "Yellow";
	end;
	if p1 == 4 then
		return "Green";
	end;
	if p1 ~= 5 then
		return;
	end;
	return "Blue";
end;
local u3 = {};
local u4 = l__LocalPlayer__1.Character.HumanoidRootPart.Position;
local function v9()
	local v10 = math.random(1, #u1);
	local v11 = math.random(1, 5);
	for v12 = 1, #v7 do
		v7[v10].Position = u1[v12];
		if v10 == 5 then
			local v13 = 1;
		else
			v13 = v10 + 1;
		end;
	end;
	for v14, v15 in pairs(l__Parent__3.Colors:GetChildren()) do
		if v15 == v7[v11] then
			local u5 = false;
			u3[v14] = v15.Button.MouseButton1Click:Connect(function()
				l__Parent__3.Visible = false;
				u5 = true;
			end);
		else
			u3[v14] = v15.Button.MouseButton1Click:Connect(function()
				l__AutoClick__5:FireServer();
			end);
		end;
	end;
	l__Parent__3.TextFrame.ColorIndicator.Text = "Click the " .. u2(v11) .. " color to close the menu.";
	l__Parent__3.Visible = true;
	local v16 = 0;
	while true do
		v16 = v16 + 1;
		wait(1);
		if v16 >= 30 then
			break;
		end;
		if l__Parent__3.Visible == false then
			break;
		end;	
	end;
	if not false then
		l__AutoClick__5:FireServer();
	end;
	u4 = l__LocalPlayer__1.Character.HumanoidRootPart.Position;
	for v17 = 1, #u3 do
		if u3[v17] ~= nil then
			u3[v17]:Disconnect();
		end;
	end;
end;
wait(300);
u4 = l__LocalPlayer__1.Character.HumanoidRootPart.Position;
while wait(v6) do
	if (u4 - l__LocalPlayer__1.Character.HumanoidRootPart.Position).magnitude > 10 then
		u4 = l__LocalPlayer__1.Character.HumanoidRootPart.Position;
	else
		v9();
	end;
	v6 = math.random(1000, 2000);
end;



