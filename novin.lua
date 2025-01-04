local function disableAntiCheat()
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

local function startWealthFarm()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 10

    while true do
        wait(0.1)
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local nearestWealth, minDistance = nil, math.huge

        local buildPack = workspace:FindFirstChild("BuildPack")
        if buildPack then
            for _, folder in pairs(buildPack:GetChildren()) do
                if folder:IsA("Folder") then
                    for _, item in pairs(folder:GetChildren()) do
                        if item:IsA("MeshPart") and item:FindFirstChild("Glow") and item.Name == "Wealth" then
                            local distance = (rootPart.Position - item.Position).Magnitude
                            if distance < minDistance then
                                minDistance = distance
                                nearestWealth = item
                            end
                        end
                    end
                end
            end
        end

        if nearestWealth then
            humanoid:MoveTo(nearestWealth.Position)
            humanoid.MoveToFinished:Wait()
        end
    end
end

-- Desabilitar o AntiCheat
disableAntiCheat()

-- Iniciar o Farm de Wealth
startWealthFarm()
