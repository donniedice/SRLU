--=====================================================================================
-- SRLU | Skyrim Level-Up! - locales.lua
-- Multi-language support for SRLU addon
--=====================================================================================

local SRLU = _G.SRLU or {}
_G.SRLU = SRLU

-- Localization table
SRLU.L = {}

-- Default language: English
local L = {
    -- Welcome and status messages
    ["LOADED"] = "Loaded!",
    ["ENABLED"] = "Enabled",
    ["DISABLED"] = "Disabled", 
    ["STATUS"] = "Status",
    ["VERSION"] = "Version",
    
    -- Settings
    ["SETTINGS"] = "Settings",
    ["SOUND_VARIANT"] = "Sound Variant",
    ["VOLUME"] = "Volume",
    ["MUTE_DEFAULT"] = "Mute Default WoW Sound",
    ["SHOW_WELCOME"] = "Show Welcome Message",
    
    -- Sound variants
    ["HIGH_QUALITY"] = "High Quality",
    ["MEDIUM_QUALITY"] = "Medium Quality", 
    ["LOW_QUALITY"] = "Low Quality",
    
    -- Commands and help
    ["HELP_HEADER"] = "SRLU | Skyrim Level-Up! Commands",
    ["HELP_ENABLE"] = "Enable the addon",
    ["HELP_DISABLE"] = "Disable the addon", 
    ["HELP_TOGGLE"] = "Toggle addon on/off",
    ["HELP_TEST"] = "Play test sound",
    ["HELP_STATUS"] = "Show current settings",
    ["HELP_SOUND"] = "Change sound variant (high/medium/low)",
    ["HELP_VOLUME"] = "Set volume (0-100)",
    ["HELP_MUTE"] = "Toggle muting default WoW level-up sound",
    ["HELP_WELCOME"] = "Toggle welcome message on login",
    ["HELP_RESET"] = "Reset all settings to default",
    ["HELP_HELP"] = "Show this help message",
    
    -- Messages
    ["TEST_SOUND"] = "Playing test sound...",
    ["SETTINGS_RESET"] = "All settings have been reset to default values.",
    ["INVALID_COMMAND"] = "Invalid command. Type '/srlu help' for available commands.",
    ["INVALID_SOUND"] = "Invalid sound variant. Use: high, medium, or low.",
    ["INVALID_VOLUME"] = "Invalid volume. Please enter a number between 0 and 100.",
    ["SOUND_CHANGED"] = "Sound variant changed to",
    ["VOLUME_CHANGED"] = "Volume changed to",
    ["MUTE_TOGGLED_ON"] = "Default WoW level-up sound muted.",
    ["MUTE_TOGGLED_OFF"] = "Default WoW level-up sound unmuted.",
    ["WELCOME_TOGGLED_ON"] = "Welcome message enabled.",
    ["WELCOME_TOGGLED_OFF"] = "Welcome message disabled.",
    
    -- Error messages
    ["ERROR_SOUND_FAILED"] = "Failed to play sound file. Please check your installation.",
    ["ERROR_SETTINGS_FAILED"] = "Failed to save settings. Please try again.",
    ["ERROR_UNEXPECTED"] = "An unexpected error occurred. Please report this issue."
}

-- German localization
if GetLocale() == "deDE" then
    L["LOADED"] = "Geladen!"
    L["ENABLED"] = "Aktiviert"
    L["DISABLED"] = "Deaktiviert"
    L["STATUS"] = "Status"
    L["VERSION"] = "Version"
    L["SETTINGS"] = "Einstellungen"
    L["SOUND_VARIANT"] = "Sound-Variante"
    L["VOLUME"] = "Lautstärke"
    L["MUTE_DEFAULT"] = "Standard-WoW-Sound stumm"
    L["SHOW_WELCOME"] = "Willkommensnachricht anzeigen"
    L["HIGH_QUALITY"] = "Hohe Qualität"
    L["MEDIUM_QUALITY"] = "Mittlere Qualität"
    L["LOW_QUALITY"] = "Niedrige Qualität"
    L["HELP_HEADER"] = "SRLU | Skyrim Level-Up! Befehle"
    L["HELP_ENABLE"] = "Addon aktivieren"
    L["HELP_DISABLE"] = "Addon deaktivieren"
    L["HELP_TOGGLE"] = "Addon ein-/ausschalten"
    L["HELP_TEST"] = "Testsound abspielen"
    L["HELP_STATUS"] = "Aktuelle Einstellungen anzeigen"
    L["HELP_SOUND"] = "Sound-Variante ändern (high/medium/low)"
    L["HELP_VOLUME"] = "Lautstärke einstellen (0-100)"
    L["HELP_MUTE"] = "Standard-WoW-Level-Sound stumm schalten"
    L["HELP_WELCOME"] = "Willkommensnachricht beim Login umschalten"
    L["HELP_RESET"] = "Alle Einstellungen auf Standard zurücksetzen"
    L["HELP_HELP"] = "Diese Hilfenachricht anzeigen"
    L["TEST_SOUND"] = "Testsound wird abgespielt..."
    L["SETTINGS_RESET"] = "Alle Einstellungen wurden auf die Standardwerte zurückgesetzt."
    L["INVALID_COMMAND"] = "Ungültiger Befehl. Gib '/srlu help' für verfügbare Befehle ein."
    L["INVALID_SOUND"] = "Ungültige Sound-Variante. Verwende: high, medium oder low."
    L["INVALID_VOLUME"] = "Ungültige Lautstärke. Bitte gib eine Zahl zwischen 0 und 100 ein."
    L["SOUND_CHANGED"] = "Sound-Variante geändert zu"
    L["VOLUME_CHANGED"] = "Lautstärke geändert zu"
    L["MUTE_TOGGLED_ON"] = "Standard-WoW-Level-Sound stumm geschaltet."
    L["MUTE_TOGGLED_OFF"] = "Standard-WoW-Level-Sound nicht mehr stumm."
    L["WELCOME_TOGGLED_ON"] = "Willkommensnachricht aktiviert."
    L["WELCOME_TOGGLED_OFF"] = "Willkommensnachricht deaktiviert."
    L["ERROR_SOUND_FAILED"] = "Fehler beim Abspielen der Sounddatei. Bitte überprüfe deine Installation."
    L["ERROR_SETTINGS_FAILED"] = "Fehler beim Speichern der Einstellungen. Bitte versuche es erneut."
    L["ERROR_UNEXPECTED"] = "Ein unerwarteter Fehler ist aufgetreten. Bitte melde dieses Problem."

-- French localization  
elseif GetLocale() == "frFR" then
    L["LOADED"] = "Chargé !"
    L["ENABLED"] = "Activé"
    L["DISABLED"] = "Désactivé"
    L["STATUS"] = "Statut"
    L["VERSION"] = "Version"
    L["SETTINGS"] = "Paramètres"
    L["SOUND_VARIANT"] = "Variante de Son"
    L["VOLUME"] = "Volume"
    L["MUTE_DEFAULT"] = "Couper le Son WoW par Défaut"
    L["SHOW_WELCOME"] = "Afficher le Message de Bienvenue"
    L["HIGH_QUALITY"] = "Haute Qualité"
    L["MEDIUM_QUALITY"] = "Qualité Moyenne"
    L["LOW_QUALITY"] = "Basse Qualité"
    L["HELP_HEADER"] = "SRLU | Skyrim Level-Up! Commandes"
    L["HELP_ENABLE"] = "Activer l'addon"
    L["HELP_DISABLE"] = "Désactiver l'addon"
    L["HELP_TOGGLE"] = "Basculer l'addon on/off"
    L["HELP_TEST"] = "Jouer le son de test"
    L["HELP_STATUS"] = "Afficher les paramètres actuels"
    L["HELP_SOUND"] = "Changer la variante de son (high/medium/low)"
    L["HELP_VOLUME"] = "Définir le volume (0-100)"
    L["HELP_MUTE"] = "Basculer la coupure du son de niveau WoW par défaut"
    L["HELP_WELCOME"] = "Basculer le message de bienvenue à la connexion"
    L["HELP_RESET"] = "Remettre tous les paramètres par défaut"
    L["HELP_HELP"] = "Afficher ce message d'aide"
    L["TEST_SOUND"] = "Lecture du son de test..."
    L["SETTINGS_RESET"] = "Tous les paramètres ont été remis aux valeurs par défaut."
    L["INVALID_COMMAND"] = "Commande invalide. Tapez '/srlu help' pour les commandes disponibles."
    L["INVALID_SOUND"] = "Variante de son invalide. Utilisez : high, medium ou low."
    L["INVALID_VOLUME"] = "Volume invalide. Veuillez entrer un nombre entre 0 et 100."
    L["SOUND_CHANGED"] = "Variante de son changée pour"
    L["VOLUME_CHANGED"] = "Volume changé pour"
    L["MUTE_TOGGLED_ON"] = "Son de niveau WoW par défaut coupé."
    L["MUTE_TOGGLED_OFF"] = "Son de niveau WoW par défaut rétabli."
    L["WELCOME_TOGGLED_ON"] = "Message de bienvenue activé."
    L["WELCOME_TOGGLED_OFF"] = "Message de bienvenue désactivé."
    L["ERROR_SOUND_FAILED"] = "Échec de la lecture du fichier son. Veuillez vérifier votre installation."
    L["ERROR_SETTINGS_FAILED"] = "Échec de la sauvegarde des paramètres. Veuillez réessayer."
    L["ERROR_UNEXPECTED"] = "Une erreur inattendue s'est produite. Veuillez signaler ce problème."

-- Spanish localization
elseif GetLocale() == "esES" or GetLocale() == "esMX" then
    L["LOADED"] = "¡Cargado!"
    L["ENABLED"] = "Habilitado"
    L["DISABLED"] = "Deshabilitado"
    L["STATUS"] = "Estado"
    L["VERSION"] = "Versión"
    L["SETTINGS"] = "Configuraciones"
    L["SOUND_VARIANT"] = "Variante de Sonido"
    L["VOLUME"] = "Volumen"
    L["MUTE_DEFAULT"] = "Silenciar Sonido WoW por Defecto"
    L["SHOW_WELCOME"] = "Mostrar Mensaje de Bienvenida"
    L["HIGH_QUALITY"] = "Alta Calidad"
    L["MEDIUM_QUALITY"] = "Calidad Media"
    L["LOW_QUALITY"] = "Baja Calidad"
    L["HELP_HEADER"] = "SRLU | Skyrim Level-Up! Comandos"
    L["HELP_ENABLE"] = "Habilitar el addon"
    L["HELP_DISABLE"] = "Deshabilitar el addon"
    L["HELP_TOGGLE"] = "Alternar addon on/off"
    L["HELP_TEST"] = "Reproducir sonido de prueba"
    L["HELP_STATUS"] = "Mostrar configuraciones actuales"
    L["HELP_SOUND"] = "Cambiar variante de sonido (high/medium/low)"
    L["HELP_VOLUME"] = "Establecer volumen (0-100)"
    L["HELP_MUTE"] = "Alternar silencio del sonido de nivel WoW por defecto"
    L["HELP_WELCOME"] = "Alternar mensaje de bienvenida al iniciar sesión"
    L["HELP_RESET"] = "Restablecer todas las configuraciones por defecto"
    L["HELP_HELP"] = "Mostrar este mensaje de ayuda"
    L["TEST_SOUND"] = "Reproduciendo sonido de prueba..."
    L["SETTINGS_RESET"] = "Todas las configuraciones han sido restablecidas a los valores por defecto."
    L["INVALID_COMMAND"] = "Comando inválido. Escribe '/srlu help' para comandos disponibles."
    L["INVALID_SOUND"] = "Variante de sonido inválida. Usa: high, medium o low."
    L["INVALID_VOLUME"] = "Volumen inválido. Por favor ingresa un número entre 0 y 100."
    L["SOUND_CHANGED"] = "Variante de sonido cambiada a"
    L["VOLUME_CHANGED"] = "Volumen cambiado a"
    L["MUTE_TOGGLED_ON"] = "Sonido de nivel WoW por defecto silenciado."
    L["MUTE_TOGGLED_OFF"] = "Sonido de nivel WoW por defecto restaurado."
    L["WELCOME_TOGGLED_ON"] = "Mensaje de bienvenida habilitado."
    L["WELCOME_TOGGLED_OFF"] = "Mensaje de bienvenida deshabilitado."
    L["ERROR_SOUND_FAILED"] = "Error al reproducir archivo de sonido. Por favor verifica tu instalación."
    L["ERROR_SETTINGS_FAILED"] = "Error al guardar configuraciones. Por favor intenta de nuevo."
    L["ERROR_UNEXPECTED"] = "Ocurrió un error inesperado. Por favor reporta este problema."
end

-- Set localization table
SRLU.L = L