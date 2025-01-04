local function disableClientAntiCheat()
    local player = game.Players.LocalPlayer
    local playerModel = workspace:FindFirstChild(player.Name)

    -- Verificar scripts no modelo do jogador
    if playerModel then
        for _, child in pairs(playerModel:GetDescendants()) do
            if child:IsA("LocalScript") or child:IsA("Script") then
                child:Destroy()
                warn("Destroyed potential AntiCheat script: " .. child.Name)
            end
        end
    end

    -- Verificar scripts globais no Workspace
    for _, child in pairs(workspace:GetDescendants()) do
        if child:IsA("LocalScript") or child:IsA("Script") then
            if child.Name:lower():find("anti") or child.Name:lower():find("cheat") then
                child:Destroy()
                warn("Destroyed global AntiCheat script: " .. child.Name)
            end
        end
    end

    -- Verificar objetos que monitoram o jogador
    for _, service in pairs({game:GetService("Players"), game:GetService("Workspace")}) do
        for _, child in pairs(service:GetDescendants()) do
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                if child.Name:lower():find("ban") or child.Name:lower():find("kick") or child.Name:lower():find("report") then
                    child:Destroy()
                    warn("Destroyed potential AntiCheat Remote: " .. child.Name)
                end
            end
        end
    end
end

local function monitorNewAntiCheat()
    -- Monitorar novos scripts ou eventos que possam ser adicionados
    local servicesToMonitor = {workspace, game.Players.LocalPlayer, game}

    for _, service in pairs(servicesToMonitor) do
        service.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("LocalScript") or descendant:IsA("Script") then
                if descendant.Name:lower():find("anti") or descendant.Name:lower():find("cheat") then
                    descendant:Destroy()
                    warn("Destroyed newly added AntiCheat script: " .. descendant.Name)
                end
            elseif descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then
                if descendant.Name:lower():find("ban") or descendant.Name:lower():find("kick") or descendant.Name:lower():find("report") then
                    descendant:Destroy()
                    warn("Destroyed newly added AntiCheat Remote: " .. descendant.Name)
                end
            end
        end)
    end
end

-- Executar desativação inicial
pcall(disableClientAntiCheat)

-- Iniciar monitoramento contínuo
monitorNewAntiCheat()
