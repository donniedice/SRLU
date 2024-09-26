-- Skyrim Level Up! v2.0.0

local SRLU = {} -- Create a namespace to avoid global variable pollution

-- Play custom sound on level up
function SRLU.PlayCustomLevelUpSound()
    PlaySoundFile("Interface\\Addons\\SRLU\\SRLU.ogg", "Master")
end

-- Mute default level up sound
function SRLU.MuteDefaultLevelUpSound()
    MuteSoundFile(569593) -- Mutes the default level up sound
end

-- Display welcome message on player login
function SRLU.DisplayWelcomeMessage()
    print("[|Tinterface/addons/SRLU/images/icon:16:16|t - |cffa0a0a0S|r|cffffffffkyrim|r |cffa0a0a0L|r|cffffffffevel|r |cffa0a0a0U|r|cffffffffp!|r] |cffffe568Loaded!|r |cff8080ff(v2.0.0)|r")
end

-- Event Registration
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LEVEL_UP" then
        SRLU.PlayCustomLevelUpSound()
    elseif event == "ADDON_LOADED" and ... == "SRLU" then -- Check addon name
        SRLU.MuteDefaultLevelUpSound()
    elseif event == "PLAYER_LOGIN" then
        SRLU.DisplayWelcomeMessage()
    end
end)
