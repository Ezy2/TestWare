

 OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


-- Windows
local Window = OrionLib:MakeWindow({Name = "TestWare V3", HidePremium = true, SaveConfig = true, ConfigFolder = "NoStop", IntroText="TestWare V3"})

-- Tabs
local Main = Window:MakeTab({
	Name = "Main",
	PremiumOnly = false
})

local Character = Window:MakeTab({
	Name = "Character",
	PremiumOnly = false
})
-- Global Values

_G.AJV = 50


-- Main

Main:AddButton({
	Name = "Delete Map",
	Callback = function()
    for _,v in pairs(Workspace:GetChildren()) do 
        v:Destroy()
        end
  	end    
})

local dwUIS = game:GetService("UserInputService")

dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        if _G.CTP then
            mouse = game.Players.LocalPlayer:GetMouse()
            local pos = mouse.Hit+Vector3.new(0,2.5,0)
            pos = CFrame.new(pos.X,pos.Y,pos.Z)
            local teleport_table = {
                location1 = Vector3.new(pos.X,pos.Y,pos.Z), -- your desired position
            }

            local tween_s = game:GetService('TweenService')
            local tweeninfo = TweenInfo.new((_G.TWSP),Enum.EasingStyle.Linear)

            local lp = game.Players.LocalPlayer
            
            function bypass_teleport(v)
                if lp.Character and 
                lp.Character:FindFirstChild('HumanoidRootPart') then
                    local cf = CFrame.new(v)
                    local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
                    a:Play()
                    -- a.Completed:Wait()
                    -- print('Teleporting Done!')
                end
            end
            
            bypass_teleport(teleport_table.location1)
        end
    end
end)

local dwUIS = game:GetService("UserInputService")
_G.CTPN = true

dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        if _G.CTPN then
            mouse = game.Players.LocalPlayer:GetMouse()
            local poss = mouse.Hit+Vector3.new(0,2.5,0)
            poss = CFrame.new(poss.X,poss.Y,poss.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = poss
        end
    end
end)

Main:AddToggle({
	Name = "Click TP(Normall)",
	Default = false,
	Callback = function(Value)
		_G.CTPN = Value
	end    
})

Main:AddToggle({
	Name = "Click TP(Tween)",
	Default = false,
	Callback = function(Value)
		_G.CTP = Value
	end    
})

Main:AddSlider({
	Name = "Tween Speed",
	Min = 1,
	Max = 240,
	Default = 30,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 0.5,
	ValueName = "Higher = Slower",
	Callback = function(Value)
		_G.TWSP = Value
	end    
})

Main:AddTextbox({
	Name = "Force Chat",
	Default = "Message Here",
	TextDisappear = true,
	Callback = function(Value)
        local args = {[1] = (Value),[2] = "All",}
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end	  
})

Main:AddTextbox({
	Name = "Player Teleport(Normall)",
	Default = "Player Name",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Value].Character.HumanoidRootPart.CFrame
	end	  
})

Main:AddTextbox({
	Name = "Player Teleport(Tween)",
	Default = "Player Name",
	TextDisappear = true,
	Callback = function(Valuee)
	game:GetService("Players")
	local Value = game.Players[Valuee].Character.HumanoidRootPart.CFrame
	
		local teleport_table = {
            location1 = Vector3.new(Value.X, Value.Y, Value.Z), -- your desired position
            }

            local tween_s = game:GetService('TweenService')
            local tweeninfo = TweenInfo.new((_G.TWTPS),Enum.EasingStyle.Linear)

            local lp = game.Players.LocalPlayer
            
            function bypass_teleport(v)
                if lp.Character and 
                lp.Character:FindFirstChild('HumanoidRootPart') then
                    local cf = CFrame.new(v)
                    local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
                    a:Play()
                end
            end
            
            bypass_teleport(teleport_table.location1)
        end
})

Main:AddBind({
	Name = "Force Jump",
	Default = Enum.KeyCode.Space,
	Hold = false,
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,50,0)
end    
})

Main:AddSlider({
	Name = "Player Teleport(Tween)",
	Min = 1,
	Max = 240,
	Default = 10,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "Player Teleport Speed(Tween)",
	Callback = function(Value)
    	_G.TWTPS = Value
	end    
})

-- Character

Character:AddToggle({
	Name = "God Mode/Walk Spoof",
	Default = false,
	Callback = function(Value)
		_G.GODMODE = Value
	end    
})

Character:AddToggle({
	Name = "Anti Void (Teleport)",
	Default = false,
	Callback = function(Value)
	_G.SW = Value    
	    
		while _G.SW do
	    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial ~= Enum.Material.Air then 
	        _G.SP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
		    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < (_G.ATVT) then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SP
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,15,0) 
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(-10,0,-10) *game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
		        end
		    wait()
		    end
	end    
})

Character:AddSlider({
	Name = "Trigger AntiVoid(Teleport)",
	Min = -1000,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "AntiVoid Height(Teleport)",
	Callback = function(Value)
    	_G.ATVT = Value
	end    
})

Character:AddToggle({
	Name = "Anti Void (Jump)",
	Default = false,
	Callback = function(Value)
	_G.SJ = Value    
	    
		while _G.SJ do
		    if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < (_G.ATVH) then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,(_G.ATV),0)
		        end
		    wait()
		    end
	end    
})

Character:AddSlider({
	Name = "Trigger AntiVoid(Jump)",
	Min = -1000,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "AntiVoid Height",
	Callback = function(Value)
    	_G.ATVH = Value
	end    
})


Character:AddSlider({
	Name = "AntiVoid Height(Jump)",
	Min = 50,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "AntiVoid Heigh",
	Callback = function(Value)
    	_G.ATV = Value
	end    
})


Character:AddToggle({
	Name = "Velocity Speed",
	Default = false,
	Callback = function(Value)
	    _G.VSO = Value
	    
	    while _G.VSO do
	        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Velocity = (game.Players.LocalPlayer.Character:WaitForChild("Humanoid").MoveDirection*Vector3.new(_G.VS,0,_G.VS))
	    wait()
	    end
	end    
})

Character:AddSlider({
	Name = "Velocity Speed",
	Min = 7.1,
	Max = 200,
	Default = 7.1,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 0.5,
	ValueName = "Velocity Speed",
	Callback = function(Value)
    	_G.VS = Value
	end    
})

Character:AddToggle({
	Name = "Auto Jump",
	Default = false,
	Callback = function(Value)
	    _G.L = Value
	    local lg = false
	    
		while _G.L do 
		    print(game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial)
		    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").FloorMaterial == Enum.Material.Air then
		        if lg then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,_G.AJV,0)
		        lg = false end
		    else
		        lg = true
		        end
		    wait()
		    end
	end    
})

Character:AddSlider({
	Name = "JumpHight(auto)",
	Min = 50,
	Max = 150,
	Default = 50,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 1,
	ValueName = "Auto JumpHeight",
	Callback = function(Value)
		_G.AJV = Value
	end    
})

Character:AddButton({
	Name = "Set WalkSpeed",
	Callback = function()
	        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WSS
	        end
})

Character:AddSlider({
	Name = "Walk Speed",
	Min = 16,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 0.5,
	ValueName = "Speed",
	Callback = function(Speed)
		_G.WSS = Speed
	end    
})

local LocalPlayer = game:GetService("Players").LocalPlayer
local OldIndex = nil
_G.GODMODE = false

OldIndex = hookmetamethod(game, "__index", function(Self, Key)
    if not checkcaller() and Self == LocalPlayer and Key == "Character" and _G.GODMODE then
        return nil
    end

    return OldIndex(Self, Key)
end)
