# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SRLU (Skyrim Level-Up!) is a professional World of Warcraft addon that plays the iconic Skyrim level-up sound when players level up. As of v2.1.1, it features a simplified command structure with direct sound selection, persistent settings, multi-language support, and extensive error handling as part of the RGX Mods collection.

## Project Structure

- **data/core.lua**: Main addon functionality with advanced features
- **data/locales.lua**: Multi-language support (English, Russian, German, French, Spanish)
- **sounds/SRLU.ogg**: Custom Skyrim level-up sound file
- **images/**: Addon icon and logo assets
- **SRLU.toc**: TOC file for retail WoW (The War Within)
- **SRLU_Cata.toc**: TOC file for Classic Cataclysm
- **SRLU_Vanilla.toc**: TOC file for Classic WoW
- **SRLU_Mists.toc**: TOC file for Mists of Pandaria

## Development Commands

This project has no build system, test suite, or development scripts. It's a WoW addon that works by copying files to the WoW AddOns directory.

### Installation for Testing
1. Copy the entire SRLU folder to `World of Warcraft/_retail_/Interface/AddOns/` (or the appropriate classic directory)
2. Restart WoW and enable the addon
3. Test using `/srlu help` to see all available commands

### Version Updates
When updating versions:
1. Update version numbers in all four .toc files (SRLU.toc, SRLU_Cata.toc, SRLU_Vanilla.toc, SRLU_Mists.toc)
2. Update interface version numbers for each WoW version in the respective .toc files
   - SRLU.toc: 110100 (Retail)
   - SRLU_Cata.toc: 40402 (Cataclysm)
   - SRLU_Vanilla.toc: 11506 (Classic)
   - SRLU_Mists.toc: 50400 (MoP)
3. Update the version constant in data/core.lua:12 (`ADDON_VERSION`)
4. Update docs/CHANGES.md and docs/changelog.txt

## Commands

Use `/srlu` followed by: `help`, `test`, `enable`, `disable`, `high`, `med`, `low`

## Code Architecture

The addon uses an optimized, professional architecture:

### **Namespace Management**:
- Uses `_G.SRLU = SRLU` for global namespace
- Local `SRLU = {}` table to avoid pollution
- Cached constants for performance optimization

### **Settings System**:
- **SavedVariables**: `SRLUSettings` table persisted across sessions
- **Default Settings**: enabled, soundVariant, volume, muteDefault, showWelcome
- **Type Validation**: All user inputs validated before processing
- **Fallback System**: Default values applied for missing settings

### **Event System**:
- `PLAYER_LEVEL_UP`: Triggers custom sound playback (if enabled)
- `ADDON_LOADED`: Initializes settings and mutes default sound
- `PLAYER_LOGIN`: Displays welcome message (if enabled)

### **Slash Command System**:
Use `/srlu` followed by various commands for full functionality:

**Available Commands**:
- `/srlu help` - Show all available commands
- `/srlu test` - Play test sound
- `/srlu enable` - Enable addon
- `/srlu disable` - Disable addon (unmutes default sound)
- `/srlu high` - Use high quality sound
- `/srlu med` - Use medium quality sound
- `/srlu low` - Use low quality sound

### **Error Handling**:
- **pcall Protection**: All major functions wrapped in pcall
- **Graceful Degradation**: Fallback error messages if formatting fails
- **Professional Messaging**: Consistent error reporting with addon branding

### **Localization**:
- **Multi-language Support**: English, Russian (ruRU), German (deDE), French (frFR), Spanish (esES/esMX)
- **Fallback System**: English used if localization fails
- **Runtime Detection**: Automatic language selection via GetLocale()

### **Core Functions**:
- `SRLU.PlayCustomLevelUpSound()`: Enhanced sound playback with settings
- `SRLU.MuteDefaultLevelUpSound()`: Mute WoW's default sound
- `SRLU.UnmuteDefaultLevelUpSound()`: Unmute WoW's default sound
- `SRLU.DisplayWelcomeMessage()`: Professional welcome display
- `SRLU.ShowHelp()`: Display available commands

## File Paths and Compatibility

- **Sound Path**: `Interface\\AddOns\\SRLU\\sounds\\SRLU.ogg` (corrected from v2.0.x)
- **Icon Path**: `Interface\\AddOns\\SRLU\\images\\icon`
- **Compatibility**: Retail, Classic Era, Cataclysm Classic, and Mists of Pandaria

## Settings Architecture

**Default Settings Object**:
```lua
{
    enabled = true,
    soundVariant = "medium",
    muteDefault = true,
    showWelcome = true,
    volume = "Master",
    firstRun = true
}
```

**SavedVariables**: `SRLUSettings` automatically managed with fallback defaults

## Publishing Platforms

The addon is distributed on:
- CurseForge (Project ID: 594118)
- GitHub
- Wago.io (ID: J96EkaGg)
- WoWInterface (ID: 26265)