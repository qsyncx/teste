local v0,v1=pcall(function() return loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))();end);if not v0 then warn("Failed to load UI Library: " .. tostring(v1));return;end 

local v2=v1:Create({
    Name="Classic Nations (Public Version)",
    Footer="By luckyCamen (version: 2.1)",
    ToggleKey=Enum.KeyCode.RightShift,
    LoadedCallback=function() Window:TaskBarOnly(false);end,
    KeySystem=false, -- Sistema de Key desativado
    Key="", -- Chave removida
    MaxAttempts=2,
    DiscordLink=nil,
    ToggledRelativeYOffset=0
});

v2:ChangeTogglekey(Enum.KeyCode.RightShift);

local v3=v2:Tab({Name="Main",Icon="rbxassetid://11396131982",Color=Color3.new(0.474509,0.474509,0.474509)});
local v4=v2:Tab({Name="Miscellaneous",Icon="rbxassetid://18155314526",Color=Color3.new(0.474509,0.474509,0.474509)});
local v5=v2:Tab({Name="Settings",Icon="rbxassetid://11476626403",Color=Color3.new(0.474509,0.474509,0.474509)});
local v6=v2:Tab({Name="Updates",Icon="rbxassetid://11323675703",Color=Color3.new(0.474509,0.474509,0.474509)});
local v7=v6:Section({Name="Updates"});
local v8={"Version 2.1 (Released 11/09/2024)","- Staff Monitoring: The script now continuously checks for staff presence, alerting you if they join the server.","- Collectible Toggles: Added toggles for various collectibles, including WarCharges, Wealth, Oil, and Research.","- Movement Wait Time: Decreased to 0 seconds instead of 0.1 seconds for improved efficiency (may be adjusted in future updates).","- Enhanced UI: Improved interface for better interaction and organized section layout.","Version 2.0 (Released 11/08/2024)","- Key System: Introduced a new key verification system.","- Revamped User Interface: A fresh design that makes navigation easier with clear tabs for each feature.","- Organized Features: Functions are now neatly categorized for effortless access to both Legit and Blatant Modes.","- Optimized Movement: Enhanced performance in both modes with customizable speed settings tailored to your playing style.","- Resolved Crashing Issues: Addressed known crashing and lag issues for a smoother experience."};
for v35,v36 in ipairs(v8) do v7:Label({Name=v36});end

local v9=v3:Section({Name="Safety Mode"});
local v10=false;
local v11="rbxassetid://5156373841";
local function v12() local v37=Instance.new("Sound");v37.SoundId=v11;v37.Volume=1;v37.Looped=false;v37.Parent=workspace;v37:Play();wait(1);v37:Stop();v37:Destroy();end 
local function v13() while v10 do wait(10);for v77,v78 in pairs(game.Players:GetPlayers()) do if v78 then local v91=v78:FindFirstChild("VShield_DataStorage");if (v91 and v91:FindFirstChild("ModRank")) then local v98=v91.ModRank.Value;if (v98>1) then v1:Notify({Name="Staff Alert",Text=v78.Name .. " is a staff member." ,Icon="rbxassetid://11401835376",Duration=3});v12();end end end end end end
v9:Toggle({Name="Staff Check",Default=false,Callback=function(v42) v10=v42;if v42 then v13();else v10=false;end end});

local v14=v3:Section({Name="AutoFarm"});
local v15=false;local v16=false;local v17=false;local v18=false;
v14:Toggle({Name="WarCharges",Default=false,Callback=function(v43) v15=v43;end});
v14:Toggle({Name="Wealth",Default=false,Callback=function(v44) v16=v44;end});
v14:Toggle({Name="Research",Default=false,Callback=function(v45) v17=v45;end});
v14:Toggle({Name="Oil",Default=false,Callback=function(v46) v18=v46;end});

local v19=v3:Section({Name="Main"});
local v20=false;local v21=16;local v22=0;
local function v23() local v47=game.Players.LocalPlayer;local v48=v47.Character or v47.CharacterAdded:Wait() ;local v49=v48:WaitForChild("Humanoid");v49.WalkSpeed=28;end 
local function v24() local v51=game.Players.LocalPlayer;local v52=v51.Character or v51.CharacterAdded:Wait() ;local v53=v52:WaitForChild("HumanoidRootPart");local v54=v52:WaitForChild("Humanoid");local v55=nil;local v56=math.huge;local v57=workspace:FindFirstChild("BuildPack");if v57 then for v84,v85 in pairs(v57:GetChildren()) do if v85:IsA("Folder") then for v99,v100 in pairs(v85:GetChildren()) do if (v100:IsA("MeshPart") and v100:FindFirstChild("Glow")) then local v103=(v53.Position-v100.Position).Magnitude;local v104=((v100.Name=="WarCharges") and v15) or ((v100.Name=="Wealth") and v16) or ((v100.Name=="Research") and v17) or ((v100.Name=="Oil") and v18) ;if (v104 and (v103<v56)) then v56=v103;v55=v100;end end end end end end if v55 then v54.WalkSpeed=v21;v54:MoveTo(v55.Position);v54.MoveToFinished:Wait();end end

v19:Toggle({Name="Legit Mode",Default=false,Callback=function(v58) v20=v58;if v58 then v1:Notify({Name="Legit Mode",Text="Enabled",Icon="rbxassetid://11401835376",Duration=3});while v20 do wait(v22);v24();end else v1:Notify({Name="Legit Mode",Text="Disabled",Icon="rbxassetid://11401835376",Duration=3});v23();end end});
v19:Slider({Name="Legit Speed",Default=v21,Min=0,Max=100,Callback=function(v59) v21=v59;end});

local v25=v3:Section({Name="Blatant"});
local v26=false;local v27=50;
local function v28() local v60=game.Players.LocalPlayer;local v61=v60.Character or v60.CharacterAdded:Wait() ;local v62=v61:WaitForChild("HumanoidRootPart");local v63,v64=nil,math.huge;local v65=workspace:FindFirstChild("BuildPack");if v65 then for v86,v87 in pairs(v65:GetChildren()) do if v87:IsA("Folder") then for v101,v102 in pairs(v87:GetChildren()) do if (v102:IsA("MeshPart") and v102:FindFirstChild("Glow")) then local v105=(v62.Position-v102.Position).Magnitude;if (v105<v64) then v64=v105;v63=v102;end end end end end end return v63;end 
v25:Toggle({Name="Blatant Mode",Default=false,Callback=function(v66) v26=v66;local v67=game.Players.LocalPlayer.Character:WaitForChild("Humanoid");if v66 then v67.WalkSpeed=v27;v1:Notify({Name="Blatant Mode",Text="Enabled",Icon="rbxassetid://11401835376",Duration=3});while v26 do wait(0);local v88=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait() ;local v89=v88:WaitForChild("HumanoidRootPart");local v90=v28();if v90 then v89.CFrame=v90.CFrame;end end else v23();v1:Notify({Name="Blatant Mode",Text="Disabled",Icon="rbxassetid://11401835376",Duration=3});end end});

local v29=v4:Section({Name="Server-Side"});
local function v30()
    local v68=workspace:FindFirstChild(game.Players.LocalPlayer.Name);
    if v68 then
        local v81=v68:FindFirstChild("ClientBodyMover");
        if (v81 and v81:IsA("LocalScript")) then
            v81:Destroy();
            v1:Notify({
                Name="Disable AntiCheat",
                Text="AntiCheat has been disabled.",
                Icon="rbxassetid://11401835376",
                Duration=3
            });
        else
            v1:Notify({
                Name="Error",
                Text="AntiCheat not found; script may be patched.",
                Icon="rbxassetid://11401835376",
                Duration=3
            });
        end
    else
        v1:Notify({
            Name="Error",
            Text="Player model not found.",
            Icon="rbxassetid://11401835376",
            Duration=3
        });
    end
end
v29:Button({Name="Disable AntiCheat",Callback=function() v30();end});

local v31=v4:Section({Name="Check for Gamepasses"});
local function v32()
    local v69={};
    for v75,v76 in pairs(game.Players:GetPlayers()) do
        if (v76.Name~=game.Players.LocalPlayer.Name) then
            table.insert(v69,v76.Name);
        end
    end
    return v69;
end
v31:Dropdown({
    Name="Select Player",
    Items=v32(),
    Callback=function(v70)
        local v71=game.Players:FindFirstChild(v70);
        if v71 then
            local v82=v71:FindFirstChild("Gamepasses");
            if v82 then
                local v92=v82:FindFirstChild("BannedWeapons");
                local v93="Check for " .. v71.Name .. ":\n";
                v93=v93 .. "BannedWeapons: " .. ((v92 and v92.Value and "Owned") or "Not Owned");
                v1:Notify({
                    Name="Gamepass Check for " .. v71.Name,
                    Text=v93,
                    Icon="rbxassetid://11401835376",
                    Duration=3
                });
            else
                v1:Notify({
                    Name="Error",
                    Text="Gamepasses folder not found for " .. v71.Name,
                    Icon="rbxassetid://11401835376",
                    Duration=3
                });
            end
        else
            v1:Notify({
                Name="Error",
                Text="Player not found.",
                Icon="rbxassetid://11401835376",
                Duration=3
            });
        end
    end
});

local v33=v4:Section({Name="Teleportation"});
v33:Dropdown({
    Name="Select Player",
    Items=v32(),
    Callback=function(v72)
        local v73=game.Players:FindFirstChild(v72);
        if (v73 and v73.Character) then
            local v83=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            if v83 then
                v83.CFrame=v73.Character.HumanoidRootPart.CFrame;
            end
        else
            v1:Notify({
                Name="Error",
                Text="Player not found or their character is not loaded.",
                Icon="rbxassetid://11401835376",
                Duration=3
            });
        end
    end
});

v31:Button({
    Name="Refresh Players",
    Callback=function()
        v31:DropdownUpdate("Select Player",v32());
    end
});
v33:Button({
    Name="Refresh Players",
    Callback=function()
        v33:DropdownUpdate("Select Player",v32());
    end
});

local v34=v5:Section({Name="Settings"});
v34:Button({
    Name="Destroy UI",
    Callback=function()
        v1:Destroy();
    end
});
v34:Button({
    Name="Hide UI",
    Callback=function()
        v2:Toggled(false);
        task.wait(3);
        v2:Toggled(true);
    end
});
v34:Button({
    Name="Task Bar Only",
    Callback=function()
        v2:TaskBarOnly(true);
        task.wait(3);
        v2:TaskBarOnly(false);
    end
});
v34:Keybind({
    Name="UI Toggle",
    Default=Enum.KeyCode.Return,
    Callback=function()
        return;
    end,
    UpdateKeyCallback=function(v74)
        task.wait(0.1);
        v2:ChangeTogglekey(v74);
    end
});
