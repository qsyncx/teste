local v0, v1 = pcall(function() 
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))()
end)

if not v0 then
    warn("Failed to load UI Library: " .. tostring(v1))
    return
end

local v2 = v1:Create({
    Name = "Classic Nations (Public Version)",
    Footer = "By luckyCamen (version: 2.1)",
    ToggleKey = Enum.KeyCode.RightShift,
    LoadedCallback = function() 
        Window:TaskBarOnly(false) 
    end,
    DiscordLink = nil,
    ToggledRelativeYOffset = 0
})

v2:ChangeTogglekey(Enum.KeyCode.RightShift)

local v3 = v2:Tab({ Name = "Main", Icon = "rbxassetid://11396131982", Color = Color3.new(0.474509, 0.474509, 0.474509) })
local v4 = v2:Tab({ Name = "Miscellaneous", Icon = "rbxassetid://18155314526", Color = Color3.new(0.474509, 0.474509, 0.474509) })
local v5 = v2:Tab({ Name = "Settings", Icon = "rbxassetid://11476626403", Color = Color3.new(0.474509, 0.474509, 0.474509) })
local v6 = v2:Tab({ Name = "Updates", Icon = "rbxassetid://11323675703", Color = Color3.new(0.474509, 0.474509, 0.474509) })

local v7 = v6:Section({ Name = "Updates" })

local v8 = {
    "Version 2.1 (Released 11/09/2024)",
    "- Staff Monitoring: The script now continuously checks for staff presence, alerting you if they join the server.",
    "- Collectible Toggles: Added toggles for various collectibles, including WarCharges, Wealth, Oil, and Research.",
    "- Movement Wait Time: Decreased to 0 seconds instead of 0.1 seconds for improved efficiency (may be adjusted in future updates).",
    "- Enhanced UI: Improved interface for better interaction and organized section layout.",
    "Version 2.0 (Released 11/08/2024)",
    "- Key System: Introduced a new key verification system.",
    "- Revamped User Interface: A fresh design that makes navigation easier with clear tabs for each feature.",
    "- Organized Features: Functions are now neatly categorized for effortless access to both Legit and Blatant Modes.",
    "- Optimized Movement: Enhanced performance in both modes with customizable speed settings tailored to your playing style.",
    "- Resolved Crashing Issues: Addressed known crashing and lag issues for a smoother experience."
}

for _, v36 in ipairs(v8) do
    v7:Label({ Name = v36 })
end