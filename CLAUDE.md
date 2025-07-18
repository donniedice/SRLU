# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SRLU (Skyrim Level-Up!) is a comprehensive World of Warcraft addon that plays the iconic "LEVEL UP!" chime from Skyrim when players level up. As of v2.1.0, it features a professional architecture with slash commands, persistent settings, multi-language support, and extensive error handling.

## Project Structure

- **data/core.lua**: Main addon functionality with advanced features
- **data/locales.lua**: Multi-language support (English, German, French, Spanish)
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
3. Update the version constant in data/core.lua:12 (`ADDON_VERSION`)
4. Update docs/CHANGES.md and docs/changelog.txt

## Code Architecture

The addon uses a professional object-oriented, event-driven architecture:

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
Multiple command aliases: `/srlu`, `/skyrim`, `/skyrimlevelup`

**Available Commands**:
- `/srlu` or `/srlu status` - Show current settings
- `/srlu help` - Show command help
- `/srlu enable/disable/toggle` - Control addon state
- `/srlu test` - Play test sound
- `/srlu sound <high|medium|low>` - Change sound variant
- `/srlu volume <0-100>` - Set volume level
- `/srlu mute` - Toggle default WoW level-up sound
- `/srlu welcome` - Toggle welcome message
- `/srlu reset` - Reset all settings to defaults

### **Error Handling**:
- **pcall Protection**: All major functions wrapped in pcall
- **Graceful Degradation**: Fallback error messages if formatting fails
- **Professional Messaging**: Consistent error reporting with addon branding

### **Localization**:
- **Multi-language Support**: English, German (deDE), French (frFR), Spanish (esES/esMX)
- **Fallback System**: English used if localization fails
- **Runtime Detection**: Automatic language selection via GetLocale()

### **Core Functions**:
- `SRLU.PlayCustomLevelUpSound()`: Enhanced sound playback with settings
- `SRLU.ToggleDefaultSound()`: Mute/unmute WoW's default sound
- `SRLU.DisplayWelcomeMessage()`: Professional welcome display
- `SRLU.ShowStatus()`: Comprehensive settings display
- `SRLU.SetSoundVariant()`: Change sound quality with validation
- `SRLU.SetVolume()`: Volume control with range validation

## File Paths and Compatibility

- **Sound Path**: `Interface\\AddOns\\SRLU\\sounds\\SRLU.ogg` (corrected from v2.0.x)
- **Icon Path**: `Interface\\AddOns\\SRLU\\images\\icon`
- **Compatibility**: Retail, Classic Era, Cataclysm Classic, and Mists of Pandaria

## Settings Architecture

**Default Settings Object**:
```lua
{
    enabled = true,
    soundVariant = "high",
    volume = 100,
    muteDefault = true,
    showWelcome = true
}
```

**SavedVariables**: `SRLUSettings` automatically managed with fallback defaults

## Publishing Platforms

The addon is distributed on:
- CurseForge (Project ID: 594118)
- GitHub
- Wago.io (ID: J96EkaGg)
- WoWInterface (ID: 26265)