-- v1.0.7

-- Event function for playing a custom sound when the player levels up
local frame_a = CreateFrame("Frame")
frame_a:RegisterEvent("PLAYER_LEVEL_UP")
frame_a:SetScript("OnEvent", function(self, event, ...)
	PlaySoundFile("Interface\\Addons\\SRLU\\SRLU.ogg", "Master")
end)

-- Event function for muting the default level up sound
local frame_b = CreateFrame("Frame")
frame_b:RegisterEvent("ADDON_LOADED")
frame_b:SetScript("OnEvent", function(self, event, ...)
	MuteSoundFile(569593)
end)

-- Event function for displaying a chat message when the player logs in
local frame_c = CreateFrame("Frame")
frame_c:RegisterEvent("PLAYER_LOGIN")
frame_c:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		print("|cff1f1d1eSRLU - Skyrim Level Up!|r Will no longer be receiving updates. Functionality has been merged into |c2d4b92ffBLU - Better Level Up!|r. If you're a fan of my sound addons, |c2d4b92ffBLU - Better Level Up!|r is available from all addon provider websites. Thank you!")
	end
end)
