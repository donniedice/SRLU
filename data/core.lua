--=====================================================================================
-- SRLU | Skyrim Level-Up! - core.lua
-- Enhanced version with comprehensive features matching FFLU architecture
--=====================================================================================

-- Create global namespace
local SRLU = {}
_G.SRLU = SRLU

-- Constants (cached for performance)
local ADDON_NAME = "SRLU"
local ADDON_VERSION = "2.1.0"
local DEFAULT_SOUND_ID = 569593 -- WoW's default level-up sound ID
local SOUND_MASTER_CHANNEL = "Master"

-- Icon constant for consistent branding
local ADDON_ICON = "|Tinterface/addons/SRLU/images/icon:16:16|t"

-- Sound file paths (corrected from original)
local SOUND_PATHS = {
    high = "Interface\\AddOns\\SRLU\\sounds\\SRLU.ogg",
    medium = "Interface\\AddOns\\SRLU\\sounds\\SRLU.ogg", -- Could be separate files if multiple variants exist
    low = "Interface\\AddOns\\SRLU\\sounds\\SRLU.ogg"
}

-- Default settings
local DEFAULT_SETTINGS = {
    enabled = true,
    soundVariant = "high",
    volume = 100,
    muteDefault = true,
    showWelcome = true
}

-- Initialize settings on first load
local function InitializeSettings()
    if not SRLUSettings then
        SRLUSettings = {}
    end
    
    -- Apply defaults for any missing settings
    for key, value in pairs(DEFAULT_SETTINGS) do
        if SRLUSettings[key] == nil then
            SRLUSettings[key] = value
        end
    end
end

-- Safe print function with addon branding
local function SafePrint(message, isError)
    local success, result = pcall(function()
        local colorCode = isError and "|cffff0000" or "|cffffffff"
        local resetCode = "|r"
        print(ADDON_ICON .. " - [|cffa0a0a0S|r|cffffffffkyrim|r |cffa0a0a0L|r|cffffffffevel|r |cffa0a0a0U|r|cffffffffp!|r] " .. colorCode .. message .. resetCode)
    end)
    
    if not success then
        -- Fallback print without formatting if there's an error
        print("SRLU: " .. tostring(message))
    end
end

-- Validate input types
local function ValidateInput(value, expectedType, allowNil)
    if allowNil and value == nil then
        return true
    end
    return type(value) == expectedType
end

-- Validate sound variant
local function IsValidSoundVariant(variant)
    return variant == "high" or variant == "medium" or variant == "low"
end

-- Validate volume range
local function IsValidVolume(volume)
    return ValidateInput(volume, "number") and volume >= 0 and volume <= 100
end

-- Play custom level-up sound with error handling
function SRLU.PlayCustomLevelUpSound()
    if not SRLUSettings.enabled then
        return
    end
    
    local success, result = pcall(function()
        local soundPath = SOUND_PATHS[SRLUSettings.soundVariant] or SOUND_PATHS.high
        local volume = (SRLUSettings.volume or 100) / 100
        
        -- Play sound with volume adjustment
        PlaySoundFile(soundPath, SOUND_MASTER_CHANNEL)
        
        -- Note: WoW's PlaySoundFile doesn't directly support volume parameter
        -- Volume control would need to be implemented via CVars or other methods
    end)
    
    if not success then
        SafePrint(SRLU.L["ERROR_SOUND_FAILED"], true)
    end
end

-- Mute/unmute default level-up sound
function SRLU.ToggleDefaultSound(mute)
    local success, result = pcall(function()
        if mute == nil then
            mute = not SRLUSettings.muteDefault
        end
        
        SRLUSettings.muteDefault = mute
        
        if mute then
            MuteSoundFile(DEFAULT_SOUND_ID)
            SafePrint(SRLU.L["MUTE_TOGGLED_ON"])
        else
            UnmuteSoundFile(DEFAULT_SOUND_ID)
            SafePrint(SRLU.L["MUTE_TOGGLED_OFF"])
        end
    end)
    
    if not success then
        SafePrint(SRLU.L["ERROR_SETTINGS_FAILED"], true)
    end
end

-- Display welcome message
function SRLU.DisplayWelcomeMessage()
    if SRLUSettings.showWelcome then
        SafePrint(SRLU.L["LOADED"] .. " |cff8080ff(v" .. ADDON_VERSION .. ")|r")
    end
end

-- Enable addon
function SRLU.Enable()
    SRLUSettings.enabled = true
    SafePrint(SRLU.L["ENABLED"])
end

-- Disable addon  
function SRLU.Disable()
    SRLUSettings.enabled = false
    SafePrint(SRLU.L["DISABLED"])
end

-- Toggle addon state
function SRLU.Toggle()
    if SRLUSettings.enabled then
        SRLU.Disable()
    else
        SRLU.Enable()
    end
end

-- Play test sound
function SRLU.TestSound()
    SafePrint(SRLU.L["TEST_SOUND"])
    SRLU.PlayCustomLevelUpSound()
end

-- Change sound variant
function SRLU.SetSoundVariant(variant)
    if not ValidateInput(variant, "string") then
        SafePrint(SRLU.L["INVALID_SOUND"], true)
        return
    end
    
    variant = string.lower(variant)
    if not IsValidSoundVariant(variant) then
        SafePrint(SRLU.L["INVALID_SOUND"], true)
        return
    end
    
    SRLUSettings.soundVariant = variant
    local qualityText = SRLU.L["HIGH_QUALITY"]
    if variant == "medium" then
        qualityText = SRLU.L["MEDIUM_QUALITY"]
    elseif variant == "low" then
        qualityText = SRLU.L["LOW_QUALITY"]
    end
    
    SafePrint(SRLU.L["SOUND_CHANGED"] .. ": " .. qualityText)
end

-- Set volume
function SRLU.SetVolume(volume)
    local numVolume = tonumber(volume)
    if not IsValidVolume(numVolume) then
        SafePrint(SRLU.L["INVALID_VOLUME"], true)
        return
    end
    
    SRLUSettings.volume = numVolume
    SafePrint(SRLU.L["VOLUME_CHANGED"] .. ": " .. numVolume .. "%")
end

-- Toggle welcome message
function SRLU.ToggleWelcome()
    SRLUSettings.showWelcome = not SRLUSettings.showWelcome
    if SRLUSettings.showWelcome then
        SafePrint(SRLU.L["WELCOME_TOGGLED_ON"])
    else
        SafePrint(SRLU.L["WELCOME_TOGGLED_OFF"])
    end
end

-- Reset all settings
function SRLU.ResetSettings()
    for key, value in pairs(DEFAULT_SETTINGS) do
        SRLUSettings[key] = value
    end
    SafePrint(SRLU.L["SETTINGS_RESET"])
end

-- Show current status
function SRLU.ShowStatus()
    local status = SRLUSettings.enabled and SRLU.L["ENABLED"] or SRLU.L["DISABLED"]
    local soundVariant = SRLUSettings.soundVariant or "high"
    local qualityText = SRLU.L["HIGH_QUALITY"]
    if soundVariant == "medium" then
        qualityText = SRLU.L["MEDIUM_QUALITY"]
    elseif soundVariant == "low" then
        qualityText = SRLU.L["LOW_QUALITY"]
    end
    
    SafePrint("=== " .. SRLU.L["STATUS"] .. " ===")
    SafePrint(SRLU.L["VERSION"] .. ": " .. ADDON_VERSION)
    SafePrint(SRLU.L["STATUS"] .. ": " .. status)
    SafePrint(SRLU.L["SOUND_VARIANT"] .. ": " .. qualityText)
    SafePrint(SRLU.L["VOLUME"] .. ": " .. (SRLUSettings.volume or 100) .. "%")
    SafePrint(SRLU.L["MUTE_DEFAULT"] .. ": " .. (SRLUSettings.muteDefault and SRLU.L["ENABLED"] or SRLU.L["DISABLED"]))
    SafePrint(SRLU.L["SHOW_WELCOME"] .. ": " .. (SRLUSettings.showWelcome and SRLU.L["ENABLED"] or SRLU.L["DISABLED"]))
end

-- Show help
function SRLU.ShowHelp()
    SafePrint("=== " .. SRLU.L["HELP_HEADER"] .. " ===")
    SafePrint("/srlu enable - " .. SRLU.L["HELP_ENABLE"])
    SafePrint("/srlu disable - " .. SRLU.L["HELP_DISABLE"])
    SafePrint("/srlu toggle - " .. SRLU.L["HELP_TOGGLE"])
    SafePrint("/srlu test - " .. SRLU.L["HELP_TEST"])
    SafePrint("/srlu status - " .. SRLU.L["HELP_STATUS"])
    SafePrint("/srlu sound <variant> - " .. SRLU.L["HELP_SOUND"])
    SafePrint("/srlu volume <0-100> - " .. SRLU.L["HELP_VOLUME"])
    SafePrint("/srlu mute - " .. SRLU.L["HELP_MUTE"])
    SafePrint("/srlu welcome - " .. SRLU.L["HELP_WELCOME"])
    SafePrint("/srlu reset - " .. SRLU.L["HELP_RESET"])
    SafePrint("/srlu help - " .. SRLU.L["HELP_HELP"])
end

-- Slash command handler
local function HandleSlashCommand(input)
    local success, result = pcall(function()
        if not input or input == "" then
            SRLU.ShowStatus()
            return
        end
        
        local args = {}
        for word in input:gmatch("%S+") do
            table.insert(args, string.lower(word))
        end
        
        local command = args[1]
        
        if command == "help" then
            SRLU.ShowHelp()
        elseif command == "enable" then
            SRLU.Enable()
        elseif command == "disable" then
            SRLU.Disable()
        elseif command == "toggle" then
            SRLU.Toggle()
        elseif command == "test" then
            SRLU.TestSound()
        elseif command == "status" then
            SRLU.ShowStatus()
        elseif command == "sound" then
            if args[2] then
                SRLU.SetSoundVariant(args[2])
            else
                SafePrint(SRLU.L["INVALID_SOUND"], true)
            end
        elseif command == "volume" then
            if args[2] then
                SRLU.SetVolume(args[2])
            else
                SafePrint(SRLU.L["INVALID_VOLUME"], true)
            end
        elseif command == "mute" then
            SRLU.ToggleDefaultSound()
        elseif command == "welcome" then
            SRLU.ToggleWelcome()
        elseif command == "reset" then
            SRLU.ResetSettings()
        else
            SafePrint(SRLU.L["INVALID_COMMAND"], true)
        end
    end)
    
    if not success then
        SafePrint(SRLU.L["ERROR_UNEXPECTED"], true)
    end
end

-- Register slash commands
SLASH_SRLU1 = "/srlu"
SLASH_SRLU2 = "/skyrim"
SLASH_SRLU3 = "/skyrimlevelup"
SlashCmdList["SRLU"] = HandleSlashCommand

-- Event frame and handling
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self, event, ...)
    local success, result = pcall(function()
        if event == "PLAYER_LEVEL_UP" then
            SRLU.PlayCustomLevelUpSound()
        elseif event == "ADDON_LOADED" and ... == ADDON_NAME then
            InitializeSettings()
            if SRLUSettings.muteDefault then
                MuteSoundFile(DEFAULT_SOUND_ID)
            end
        elseif event == "PLAYER_LOGIN" then
            SRLU.DisplayWelcomeMessage()
        end
    end)
    
    if not success then
        SafePrint(SRLU.L["ERROR_UNEXPECTED"], true)
    end
end)