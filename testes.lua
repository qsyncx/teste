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

    local function findNearestWealth()
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

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
        return nearestWealth
    end

    while true do
        wait(0.2) -- Reduz o impacto no desempenho
        local nearestWealth = findNearestWealth()
        if nearestWealth and humanoid then
            humanoid:MoveTo(nearestWealth.Position)
            humanoid.MoveToFinished:Wait(1) -- Adiciona um limite de espera para evitar travamentos
        end
    end
end

-- Desabilitar o AntiCheat
pcall(disableAntiCheat) -- Envolve em pcall para evitar crashes caso falhe

-- Iniciar o Farm de Wealth
pcall(startWealthFarm) -- Envolve em pcall para evitar crashes caso algo dê errado
