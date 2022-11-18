--v1.0.6
-- Event function level up
local Event_Frame_A = CreateFrame("Frame")
Event_Frame_A:RegisterEvent("PLAYER_LEVEL_UP")
Event_Frame_A:SetScript("OnEvent",
	function(self, event, ...)
		PlaySoundFile("Interface\\Addons\\SRLU\\SRLU.ogg", "Master")
	end)

-- Mute default level up sound
local Event_Frame_B = CreateFrame("Frame")
Event_Frame_B:RegisterEvent("ADDON_LOADED")
Event_Frame_B:SetScript("OnEvent",
	function(self, event, ...)
		MuteSoundFile(569593)
	end)

-- Chat Message
		local Event_Frame_C = CreateFrame("Frame")
		Event_Frame_C:RegisterEvent("ADDON_LOADED")
		Event_Frame_C:SetScript("OnEvent",
			function(self, event, text, ...)
		    if event == "ADDON_LOADED" then
					print("|cff1f1d1eSRLU - Skyrim Level Up!|r Will no longer be receiving updates. Functionality has been merged into |c2d4b92ffBLU - Better Level Up!|r. If you're a fan of my sound addons, |c2d4b92ffBLU - Better Level Up!|r is available from all addon provider websites. Thank you!")
				end
	end)
