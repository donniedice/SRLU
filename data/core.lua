--=====================================================================================
-- SRLU | Skyrim Level-Up! - core.lua
-- Version: 2.1.2
-- Author: DonnieDice
-- Description: Professional World of Warcraft addon that plays Skyrim level-up sound
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

-- Global addon namespace and version info
SRLU = SRLU or {}

-- Constants (cached for performance)
local ADDON_VERSION = "2.1.2"
local ADDON_NAME = "SRLU"
local ICON_PATH = "|Tinterface/addons/SRLU/images/icon:16:16|t"
local SOUND_PATHS = {
    high = "Interface\\Addons\\SRLU\\sounds\\SRLU.ogg",
    medium = "Interface\\Addons\\SRLU\\sounds\\SRLU.ogg",
    low = "Interface\\Addons\\SRLU\\sounds\\SRLU.ogg"
}
local DEFAULT_SOUND_ID = 569593

-- Set addon properties
SRLU.version = ADDON_VERSION
SRLU.addonName = ADDON_NAME  
SRLU.sounds = SOUND_PATHS
SRLU.defaultSoundId = DEFAULT_SOUND_ID

-- Default configuration
SRLU.defaults = {
    enabled = true,
    soundVariant = "medium",
    muteDefault = true,
    showWelcome = true,
    volume = "Master",
    firstRun = true
}

-- Saved variables will be loaded by WoW after ADDON_LOADED event
-- Do not initialize here as it will override saved settings

-- Initialize addon settings
function SRLU:InitializeSettings()
    -- Ensure SavedVariables table exists
    SRLUSettings = SRLUSettings or {}
    
    -- Set defaults for any missing values
    for key, value in pairs(self.defaults) do
        if SRLUSettings[key] == nil then
            SRLUSettings[key] = value
        end
    end
end

-- Get current settings with fallback to defaults (with type validation)
function SRLU:GetSetting(key)
    if not key or type(key) ~= "string" then
        return nil
    end
    
    -- Return default if SavedVariables not loaded yet
    if not SRLUSettings then
        return self.defaults[key]
    end
    
    local value = SRLUSettings[key]
    if value ~= nil then
        return value
    end
    
    return self.defaults[key]
end

-- Set a setting value (with validation)
function SRLU:SetSetting(key, value)
    if not key or type(key) ~= "string" or self.defaults[key] == nil then
        return false
    end
    
    -- Ensure SavedVariables table exists
    if not SRLUSettings then
        SRLUSettings = {}
    end
    
    -- Type validation based on default values
    local defaultType = type(self.defaults[key])
    if type(value) ~= defaultType then
        return false
    end
    
    SRLUSettings[key] = value
    return true
end

-- Safely play custom sound on level up
function SRLU:PlayCustomLevelUpSound()
    if not self:GetSetting("enabled") then
        return
    end
    
    local soundVariant = self:GetSetting("soundVariant")
    if not soundVariant then
        soundVariant = "medium"
    end
    
    local soundPath = SOUND_PATHS[soundVariant]
    if not soundPath then
        print(ICON_PATH .. " " .. (self.L and self.L["ERROR_PREFIX"] or "|cffff0000SRLU Error:|r") .. " Invalid sound variant: " .. tostring(soundVariant))
        return
    end
    
    local volume = self:GetSetting("volume") or "Master"
    local success = PlaySoundFile(soundPath, volume)
    
    if not success then
        print(ICON_PATH .. " " .. (self.L and self.L["ERROR_PREFIX"] or "|cffff0000SRLU Error:|r") .. " Failed to play sound file: " .. soundPath)
    end
end


-- Mute default level up sound
function SRLU:MuteDefaultLevelUpSound()
    if self:GetSetting("enabled") and self:GetSetting("muteDefault") then
        MuteSoundFile(DEFAULT_SOUND_ID)
    end
end

-- Unmute default level up sound
function SRLU:UnmuteDefaultLevelUpSound()
    UnmuteSoundFile(DEFAULT_SOUND_ID)
end

-- Display welcome message on player login
function SRLU:DisplayWelcomeMessage()
    if not self:GetSetting("showWelcome") then
        return
    end
    
    -- Ensure localization exists
    if not self.L then
        print(ICON_PATH .. " |cffff0000SRLU Error:|r Localization not loaded")
        return
    end
    
    -- Cached strings for performance
    local title = "[|cffa0a0a0S|r|cffffffffkyrim|r |cffa0a0a0L|r|cffffffffevel|r |cffa0a0a0U|r|cffffffffp!|r]"
    local version = "|cff8080ff(v" .. ADDON_VERSION .. ")|r"
    local rgxMods = "|cffa0a0a0RGX Mods|r"
    local status = self:GetSetting("enabled") and self.L["ENABLED_STATUS"] or self.L["DISABLED_STATUS"]
    
    print(ICON_PATH .. " - " .. title .. " " .. status .. " " .. version .. " - " .. rgxMods)
    
    -- Show community message on first run
    if self:GetSetting("firstRun") then
        print(ICON_PATH .. " " .. self.L["COMMUNITY_MESSAGE"])
        self:SetSetting("firstRun", false)
    end
    
    print(ICON_PATH .. " " .. self.L["TYPE_HELP"])
end

-- Slash command handler
function SRLU:HandleSlashCommand(args)
    -- Ensure localization exists
    if not self.L then
        print(ICON_PATH .. " |cffff0000SRLU Error:|r Localization not loaded")
        return
    end
    
    -- Use cached icon path
    local iconPrefix = ICON_PATH
    
    local command = string.lower(args or "")
    
    if command == "" or command == "help" then
        self:ShowHelp()
    elseif command == "test" then
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. self.L["PLAYING_TEST"])
        self:PlayCustomLevelUpSound()
    elseif command == "enable" then
        self:SetSetting("enabled", true)
        self:MuteDefaultLevelUpSound()
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. self.L["ADDON_ENABLED"])
    elseif command == "disable" then
        self:SetSetting("enabled", false)
        self:UnmuteDefaultLevelUpSound()
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. self.L["ADDON_DISABLED"])
    elseif command == "high" then
        self:SetSetting("soundVariant", "high")
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. string.format(self.L["SOUND_VARIANT_SET"], "high"))
    elseif command == "med" or command == "medium" then
        self:SetSetting("soundVariant", "medium")
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. string.format(self.L["SOUND_VARIANT_SET"], "medium"))
    elseif command == "low" then
        self:SetSetting("soundVariant", "low")
        print(iconPrefix .. " |cffa0a0a0SRLU:|r " .. string.format(self.L["SOUND_VARIANT_SET"], "low"))
    else
        print(iconPrefix .. " " .. self.L["ERROR_PREFIX"] .. " " .. self.L["ERROR_UNKNOWN_COMMAND"])
    end
end

-- Show help information
function SRLU:ShowHelp()
    -- Ensure localization exists
    if not self.L then
        print(ICON_PATH .. " |cffff0000SRLU Error:|r Localization not loaded")
        return
    end
    
    local iconPrefix = ICON_PATH
    print(iconPrefix .. " " .. self.L["HELP_HEADER"])
    print(iconPrefix .. " " .. self.L["HELP_TEST"])
    print(iconPrefix .. " " .. self.L["HELP_ENABLE"])
    print(iconPrefix .. " " .. self.L["HELP_DISABLE"])
    print(iconPrefix .. " |cffffffff/srlu high|r - Use high quality sound")
    print(iconPrefix .. " |cffffffff/srlu med|r - Use medium quality sound")
    print(iconPrefix .. " |cffffffff/srlu low|r - Use low quality sound")
end

-- Removed ShowStatus and ResetSettings functions - no longer needed

-- Track initialization state
SRLU.initialized = false

-- Event handler function (optimized with early returns)
function SRLU:OnEvent(event, ...)
    if event == "PLAYER_LEVEL_UP" then
        -- Only play sound if addon is fully initialized
        if self.initialized then
            self:PlayCustomLevelUpSound()
        end
        return
    end
    
    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == ADDON_NAME then
            self:InitializeSettings()
            self:MuteDefaultLevelUpSound()
            self.initialized = true
        end
        return
    end
    
    if event == "PLAYER_LOGIN" then
        -- Ensure we're initialized before showing welcome
        if not self.initialized then
            self:InitializeSettings()
            self:MuteDefaultLevelUpSound()
            self.initialized = true
        end
        self:DisplayWelcomeMessage()
    end
end

-- Register slash commands with error handling
SLASH_SRLU1 = "/srlu"
SlashCmdList["SRLU"] = function(args)
    local success, errorMsg = pcall(SRLU.HandleSlashCommand, SRLU, args)
    if not success then
        print(ICON_PATH .. " |cffff0000SRLU Error:|r " .. tostring(errorMsg))
    end
end

-- Event frame setup with error handling
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    local success, errorMsg = pcall(SRLU.OnEvent, SRLU, event, ...)
    if not success then
        print(ICON_PATH .. " |cffff0000SRLU Error:|r Event handler failed: " .. tostring(errorMsg))
    end
end)