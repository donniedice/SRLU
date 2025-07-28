--=====================================================================================
-- SRLU | Skyrim Level-Up! - locales.lua
-- Version: 2.1.2
-- Author: DonnieDice
-- Description: Multi-language localization system for SRLU
--=====================================================================================

-- Ensure global addon namespace exists
SRLU = SRLU or {}

-- Initialize localization table
SRLU.L = SRLU.L or {}

-- Get current WoW client locale
local locale = GetLocale()

-- Default English strings (always loaded as fallback)
local L = {
    -- Status Messages
    ["ADDON_ENABLED"] = "Addon |cff00ff00enabled|r",
    ["ADDON_DISABLED"] = "Addon |cffff0000disabled|r",
    ["PLAYING_TEST"] = "Playing test sound...",
    ["SOUND_VARIANT_SET"] = "Sound variant set to: |cffffffff%s|r",
    ["WELCOME_MESSAGE"] = "Welcome to SRLU! Type |cffffffff/srlu help|r for commands",
    
    -- Error Messages
    ["ERROR_PREFIX"] = "|cffff0000SRLU Error:|r",
    ["ERROR_INVALID_VARIANT_OPTIONS"] = "Invalid sound variant. Use: high, med, or low",
    ["ERROR_UNKNOWN_COMMAND"] = "Unknown command. Type |cffffffff/srlu help|r for available commands",
    ["ERROR_SOUND_FAILED"] = "Failed to play sound file",
    ["ERROR_INVALID_SOUND_VARIANT"] = "Invalid sound variant",
    
    -- Help System
    ["HELP_HEADER"] = "|cffa0a0a0=== SRLU Commands ===|r",
    ["HELP_TEST"] = "|cffffffff/srlu test|r - Play test sound",
    ["HELP_ENABLE"] = "|cffffffff/srlu enable|r - Enable addon",
    ["HELP_DISABLE"] = "|cffffffff/srlu disable|r - Disable addon",
    
    -- Status Display
    ["STATUS_HEADER"] = "|cffa0a0a0=== SRLU Status ===|r",
    ["STATUS_STATUS"] = "Status:",
    ["STATUS_SOUND"] = "Sound Variant: |cffffffff%s|r",
    ["STATUS_MUTE"] = "Mute Default:",
    ["STATUS_VERSION"] = "Version: |cffffffff%s|r",
    ["STATUS_VOLUME"] = "Volume Channel: |cffffffff%s|r",
    
    -- General Status
    ["ENABLED_STATUS"] = "|cff00ff00Enabled|r",
    ["DISABLED_STATUS"] = "|cffff0000Disabled|r",
    ["YES"] = "|cff00ff00Yes|r",
    ["NO"] = "|cffff0000No|r",
    ["TYPE_HELP"] = "Type |cffffffff/srlu help|r for commands",
    
    -- Sound Variants
    ["SOUND_HIGH"] = "High",
    ["SOUND_MEDIUM"] = "Medium", 
    ["SOUND_LOW"] = "Low",
    
    -- Volume Channels
    ["VOLUME_SET"] = "Volume channel set to: |cffffffff%s|r",
    ["ERROR_INVALID_VOLUME"] = "Invalid volume channel. Use: Master, SFX, Music, or Ambience",
    
    -- RGX Mods Branding
    ["RGX_MODS_PREFIX"] = "|cffa0a0a0RGX Mods|r",
    ["COMMUNITY_MESSAGE"] = "Part of the RealmGX Community - join us at discord.gg/N7kdKAHVVF"
}

-- Russian localization by ZamestoTV (Hubbotu)
if locale == "ruRU" then
    L["ADDON_ENABLED"] = "Аддон |cff00ff00включен|r"
    L["ADDON_DISABLED"] = "Аддон |cffff0000отключен|r"
    L["PLAYING_TEST"] = "Воспроизведение тестового звука..."
    L["SOUND_VARIANT_SET"] = "Вариант звука установлен на: |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Добро пожаловать в SRLU! Введите |cffffffff/srlu help|r для команд"
    
    L["ERROR_PREFIX"] = "|cffff0000Ошибка SRLU:|r"
    L["ERROR_INVALID_VARIANT_OPTIONS"] = "Недопустимый вариант звука. Используйте: high, med или low"
    L["ERROR_UNKNOWN_COMMAND"] = "Неизвестная команда. Введите |cffffffff/srlu help|r для доступных команд"
    L["ERROR_SOUND_FAILED"] = "Не удалось воспроизвести звуковой файл"
    L["ERROR_INVALID_SOUND_VARIANT"] = "Недопустимый вариант звука"
    
    L["HELP_HEADER"] = "|cffa0a0a0=== Команды SRLU ===|r"
    L["HELP_TEST"] = "|cffffffff/srlu test|r - Воспроизвести тестовый звук"
    L["HELP_ENABLE"] = "|cffffffff/srlu enable|r - Включить аддон"
    L["HELP_DISABLE"] = "|cffffffff/srlu disable|r - Отключить аддон"
    
    L["VOLUME_SET"] = "Канал громкости установлен на: |cffffffff%s|r"
    L["ERROR_INVALID_VOLUME"] = "Недопустимый канал громкости. Используйте: Master, SFX, Music или Ambience"
    
    L["STATUS_HEADER"] = "|cffa0a0a0=== Статус SRLU ===|r"
    L["STATUS_STATUS"] = "Статус:"
    L["STATUS_SOUND"] = "Вариант звука: |cffffffff%s|r"
    L["STATUS_MUTE"] = "Отключение звука по умолчанию:"
    L["STATUS_VERSION"] = "Версия: |cffffffff%s|r"
    L["STATUS_VOLUME"] = "Канал громкости: |cffffffff%s|r"
    
    L["ENABLED_STATUS"] = "|cff00ff00Включен|r"
    L["DISABLED_STATUS"] = "|cffff0000Отключен|r"
    L["YES"] = "|cff00ff00Да|r"
    L["NO"] = "|cffff0000Нет|r"
    L["TYPE_HELP"] = "Введите |cffffffff/srlu help|r для команд"
    
    L["SOUND_HIGH"] = "Высокий"
    L["SOUND_MEDIUM"] = "Средний"
    L["SOUND_LOW"] = "Низкий"
    
    L["COMMUNITY_MESSAGE"] = "Часть сообщества RealmGX - присоединяйтесь к нам на discord.gg/N7kdKAHVVF"

-- German localization
elseif locale == "deDE" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00aktiviert|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000deaktiviert|r"
    L["PLAYING_TEST"] = "Testsound wird abgespielt..."
    L["SOUND_VARIANT_SET"] = "Sound-Variante gesetzt auf: |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Willkommen bei SRLU! Tippe |cffffffff/srlu help|r für Befehle"
    
    L["ERROR_PREFIX"] = "|cffff0000SRLU Fehler:|r"
    L["ERROR_INVALID_VARIANT_OPTIONS"] = "Ungültige Sound-Variante. Verwende: high, med oder low"
    L["ERROR_UNKNOWN_COMMAND"] = "Unbekannter Befehl. Tippe |cffffffff/srlu help|r für verfügbare Befehle"
    L["ERROR_SOUND_FAILED"] = "Fehler beim Abspielen der Sounddatei"
    L["ERROR_INVALID_SOUND_VARIANT"] = "Ungültige Sound-Variante"
    
    L["HELP_HEADER"] = "|cffa0a0a0=== SRLU Befehle ===|r"
    L["HELP_TEST"] = "|cffffffff/srlu test|r - Testsound abspielen"
    L["HELP_ENABLE"] = "|cffffffff/srlu enable|r - Addon aktivieren"
    L["HELP_DISABLE"] = "|cffffffff/srlu disable|r - Addon deaktivieren"
    
    L["VOLUME_SET"] = "Lautstärkekanal gesetzt auf: |cffffffff%s|r"
    L["ERROR_INVALID_VOLUME"] = "Ungültiger Lautstärkekanal. Verwende: Master, SFX, Music oder Ambience"
    
    L["STATUS_HEADER"] = "|cffa0a0a0=== SRLU Status ===|r"
    L["STATUS_STATUS"] = "Status:"
    L["STATUS_SOUND"] = "Sound-Variante: |cffffffff%s|r"
    L["STATUS_MUTE"] = "Standard stumm:"
    L["STATUS_VERSION"] = "Version: |cffffffff%s|r"
    L["STATUS_VOLUME"] = "Lautstärke-Kanal: |cffffffff%s|r"
    
    L["ENABLED_STATUS"] = "|cff00ff00Aktiviert|r"
    L["DISABLED_STATUS"] = "|cffff0000Deaktiviert|r"
    L["YES"] = "|cff00ff00Ja|r"
    L["NO"] = "|cffff0000Nein|r"
    L["TYPE_HELP"] = "Tippe |cffffffff/srlu help|r für Befehle"
    
    L["SOUND_HIGH"] = "Hoch"
    L["SOUND_MEDIUM"] = "Mittel"
    L["SOUND_LOW"] = "Niedrig"
    
    L["COMMUNITY_MESSAGE"] = "Teil der RealmGX Community - tritt uns bei: discord.gg/N7kdKAHVVF"

-- French localization
elseif locale == "frFR" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00activé|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000désactivé|r"
    L["PLAYING_TEST"] = "Lecture du son de test..."
    L["SOUND_VARIANT_SET"] = "Variante sonore définie sur : |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Bienvenue dans SRLU ! Tapez |cffffffff/srlu help|r pour les commandes"
    
    L["ERROR_PREFIX"] = "|cffff0000Erreur SRLU:|r"
    L["ERROR_INVALID_VARIANT_OPTIONS"] = "Variante sonore invalide. Utilisez : high, med ou low"
    L["ERROR_UNKNOWN_COMMAND"] = "Commande inconnue. Tapez |cffffffff/srlu help|r pour les commandes disponibles"
    L["ERROR_SOUND_FAILED"] = "Échec de la lecture du fichier sonore"
    L["ERROR_INVALID_SOUND_VARIANT"] = "Variante sonore invalide"
    
    L["HELP_HEADER"] = "|cffa0a0a0=== Commandes SRLU ===|r"
    L["HELP_TEST"] = "|cffffffff/srlu test|r - Jouer le son de test"
    L["HELP_ENABLE"] = "|cffffffff/srlu enable|r - Activer l'addon"
    L["HELP_DISABLE"] = "|cffffffff/srlu disable|r - Désactiver l'addon"
    
    L["VOLUME_SET"] = "Canal de volume défini sur : |cffffffff%s|r"
    L["ERROR_INVALID_VOLUME"] = "Canal de volume invalide. Utilisez : Master, SFX, Music ou Ambience"
    
    L["STATUS_HEADER"] = "|cffa0a0a0=== Statut SRLU ===|r"
    L["STATUS_STATUS"] = "Statut :"
    L["STATUS_SOUND"] = "Variante sonore : |cffffffff%s|r"
    L["STATUS_MUTE"] = "Muet par défaut :"
    L["STATUS_VERSION"] = "Version : |cffffffff%s|r"
    L["STATUS_VOLUME"] = "Canal de volume : |cffffffff%s|r"
    
    L["ENABLED_STATUS"] = "|cff00ff00Activé|r"
    L["DISABLED_STATUS"] = "|cffff0000Désactivé|r"
    L["YES"] = "|cff00ff00Oui|r"
    L["NO"] = "|cffff0000Non|r"
    L["TYPE_HELP"] = "Tapez |cffffffff/srlu help|r pour les commandes"
    
    L["SOUND_HIGH"] = "Élevé"
    L["SOUND_MEDIUM"] = "Moyen"
    L["SOUND_LOW"] = "Bas"
    
    L["COMMUNITY_MESSAGE"] = "Partie de la communauté RealmGX - rejoignez-nous sur discord.gg/N7kdKAHVVF"

-- Spanish localization
elseif locale == "esES" or locale == "esMX" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00habilitado|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000deshabilitado|r"
    L["PLAYING_TEST"] = "Reproduciendo sonido de prueba..."
    L["SOUND_VARIANT_SET"] = "Variante de sonido establecida en: |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "¡Bienvenido a SRLU! Escribe |cffffffff/srlu help|r para comandos"
    
    L["ERROR_PREFIX"] = "|cffff0000Error SRLU:|r"
    L["ERROR_INVALID_VARIANT_OPTIONS"] = "Variante de sonido inválida. Usa: high, med o low"
    L["ERROR_UNKNOWN_COMMAND"] = "Comando desconocido. Escribe |cffffffff/srlu help|r para comandos disponibles"
    L["ERROR_SOUND_FAILED"] = "Error al reproducir archivo de sonido"
    L["ERROR_INVALID_SOUND_VARIANT"] = "Variante de sonido inválida"
    
    L["HELP_HEADER"] = "|cffa0a0a0=== Comandos SRLU ===|r"
    L["HELP_TEST"] = "|cffffffff/srlu test|r - Reproducir sonido de prueba"
    L["HELP_ENABLE"] = "|cffffffff/srlu enable|r - Habilitar el addon"
    L["HELP_DISABLE"] = "|cffffffff/srlu disable|r - Deshabilitar el addon"
    
    L["VOLUME_SET"] = "Canal de volumen establecido en: |cffffffff%s|r"
    L["ERROR_INVALID_VOLUME"] = "Canal de volumen inválido. Usa: Master, SFX, Music o Ambience"
    
    L["STATUS_HEADER"] = "|cffa0a0a0=== Estado SRLU ===|r"
    L["STATUS_STATUS"] = "Estado:"
    L["STATUS_SOUND"] = "Variante de sonido: |cffffffff%s|r"
    L["STATUS_MUTE"] = "Silenciar por defecto:"
    L["STATUS_VERSION"] = "Versión: |cffffffff%s|r"
    L["STATUS_VOLUME"] = "Canal de volumen: |cffffffff%s|r"
    
    L["ENABLED_STATUS"] = "|cff00ff00Habilitado|r"
    L["DISABLED_STATUS"] = "|cffff0000Deshabilitado|r"
    L["YES"] = "|cff00ff00Sí|r"
    L["NO"] = "|cffff0000No|r"
    L["TYPE_HELP"] = "Escribe |cffffffff/srlu help|r para comandos"
    
    L["SOUND_HIGH"] = "Alto"
    L["SOUND_MEDIUM"] = "Medio"
    L["SOUND_LOW"] = "Bajo"
    
    L["COMMUNITY_MESSAGE"] = "Parte de la comunidad RealmGX - únete a nosotros en discord.gg/N7kdKAHVVF"
end

-- Assign localization table to global addon namespace
SRLU.L = L

-- Provide fallback function for missing translations
function SRLU:GetLocalizedString(key)
    if self.L and self.L[key] then
        return self.L[key]
    end
    
    -- Return the key itself if no translation found (for debugging)
    return key
end