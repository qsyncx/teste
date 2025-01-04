local v0, v1 = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))()
end)
if not v0 then
    warn("Failed to load UI Library: " .. tostring(v1))
    return
end

local AutoFarmEnabled = true
local WarChargesEnabled = true
local WealthEnabled = true
local ResearchEnabled = true
local OilEnabled = true

local function DisableAntiCheat()
    local playerModel = workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    if playerModel then
        local antiCheatScript = playerModel:FindFirstChild("ClientBodyMover")
        if antiCheatScript and antiCheatScript:IsA("LocalScript") then
            antiCheatScript:Destroy()
            warn("AntiCheat has been disabled.")
        else
            warn("AntiCheat not found; script may be patched.")
        end
    else
        warn("Player model not found.")
    end
end

local function AutoFarm()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")
    humanoid.WalkSpeed = 50 -- Set a fast walking speed for autofarming

    local function FindClosestTarget()
        local closestTarget, closestDistance = nil, math.huge
        local buildPack = workspace:FindFirstChild("BuildPack")
        if buildPack then
            for _, folder in pairs(buildPack:GetChildren()) do
                if folder:IsA("Folder") then
                    for _, part in pairs(folder:GetChildren()) do
                        if part:IsA("MeshPart") and part:FindFirstChild("Glow") then
                            local distance = (rootPart.Position - part.Position).Magnitude
                            local isTargetValid = (part.Name == "WarCharges" and WarChargesEnabled)
                                or (part.Name == "Wealth" and WealthEnabled)
                                or (part.Name == "Research" and ResearchEnabled)
                                or (part.Name == "Oil" and OilEnabled)

                            if isTargetValid and distance < closestDistance then
                                closestDistance = distance
                                closestTarget = part
                            end
                        end
                    end
                end
            end
        end
        return closestTarget
    end

    while AutoFarmEnabled do
        wait(0)
        local target = FindClosestTarget()
        if target then
            humanoid:MoveTo(target.Position)
            humanoid.MoveToFinished:Wait()
        end
    end
end

-- Disable AntiCheat
DisableAntiCheat()

-- Start AutoFarm
AutoFarm()
