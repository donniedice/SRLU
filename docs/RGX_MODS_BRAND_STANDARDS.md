# RGX Mods Brand Standards Documentation

## Header Structure (REQUIRED FORMAT)

### Main Title (H1)
```markdown
# <img src="[ADDON_LOGO_URL]" width="25" height="25"> <span style="color:[ADDON_COLOR]">A</span><span style="color:[ADDON_COLOR]">D</span><span style="color:[ADDON_COLOR]">D</span><span style="color:[ADDON_COLOR]">O</span><span style="color:[ADDON_COLOR]">N</span> <span style="color:#3598db">|</span> <span style="color:[ADDON_COLOR]">Full Addon Name</span><span style="color:[ADDON_COLOR]">!</span>
```

**CRITICAL NOTES:**
- Logo MUST have both `width="25"` AND `height="25"` attributes
- Logo goes BEFORE the addon name
- Each letter of the addon abbreviation gets individual color spans
- Pipe separator is ALWAYS `#3598db`
- Exclamation mark matches addon color

### RGX Mods Subheader (H2)
```markdown
## <img src="https://raw.githubusercontent.com/donniedice/SimpleQuestPlates/main/images/kiwi.gif" height="20"> <span style="color:#8B1538">R</span><span style="color:#8B1538">G</span><span style="color:#8B1538">X</span> <span style="color:#4ecdc4">Mods</span> <span style="color:#3598db">-</span> [<span style="color:#8B1538">R</span><span style="color:#7598b6">ealm</span><span style="color:#8B1538">G</span><span style="color:#8B1538">X</span>](https://realmgx.com) <span style="color:[ADDON_COLOR]">Community Project</span>
```

**NOTES:**
- Kiwi gif is ALWAYS 20px height (no width needed for gifs)
- RGX letters are burgundy `#8B1538`
- "ealm" is blue accent `#7598b6`
- "Mods" is teal `#4ecdc4`
- "Community Project" uses the addon's theme color

### Tagline
```markdown
**<span style="color:[ADDON_COLOR]">"Addon Tagline"</span> <span style="color:#e67e23">- Now in</span> <span style="color:#06c">World of Warcraft</span><span style="color:#e67e23">!</span>**
```

## Color Palette

### Core RGX Colors
- **RGX Burgundy**: `#8B1538` (R, G, X letters)
- **Realm Blue**: `#7598b6` (ealm in RealmGX)
- **Mods Teal**: `#4ecdc4` (Mods text)
- **Separator Blue**: `#3598db` (pipes |, colons :, dashes -)
- **WoW Blue**: `#06c` (World of Warcraft references)

### Text Colors
- **General Text**: `#e67e23` (orange)
- **Green Accent**: `#2dc26b`
- **Purple Accent**: `#b96ad9`
- **Red/Warning**: `#ff6b6b`
- **GitHub Black**: `#24292e`
- **Discord Blue**: `#7289da`

### Addon-Specific Theme Colors
- **SRLU**: `#8B4513` (Brown/Rust - Skyrim theme)
- **FFLU**: `#FFD700` (Gold - Final Fantasy theme)
- **SimpleQuestPlates**: `#4ecdc4` (Teal - Clean UI theme)

## Document Structure

### 1. Header Section
```markdown
# [Logo + Addon Name]
## [Kiwi + RGX Mods Branding]
**[Tagline]**
[Badges]
```

### 2. Description
```markdown
## <span style="color:[ADDON_COLOR]">⚔️ Transform Your</span> <span style="color:#06c">WoW</span> <span style="color:[ADDON_COLOR]">Experience</span>
```

### 3. Features Table (3x3 Layout)
```markdown
| | | |
|---|---|---|
| 🎵 **Feature 1** | 🎚️ **Feature 2** | 🔧 **Feature 3** |
| Description | Description | Description |
```

### 4. Commands Section
```markdown
<span style="color:#e67e23">Use</span> <span style="color:#2dc26b">`/command`</span> <span style="color:#e67e23">followed by</span><span style="color:#3598db">:</span>
```

### 5. Installation
```markdown
**<span style="color:#2dc26b">Step 1</span><span style="color:#3598db">:</span>** <span style="color:#e67e23">Instructions</span>
```

### 6. Discord Community
```markdown
### <span style="color:#b96ad9">💬</span> [<span style="color:#8B1538">R</span><span style="color:#7598b6">ealm</span><span style="color:#8B1538">G</span><span style="color:#8B1538">X</span>](https://realmgx.com) <span style="color:[ADDON_COLOR]">Discord</span> <span style="color:#3598db">-</span> <span style="color:#2dc26b">Your Gaming Home!</span>
```

### 7. Footer with Kiwi
```markdown
<img src="https://raw.githubusercontent.com/donniedice/SimpleQuestPlates/main/images/kiwi.gif" height="15"> **<span style="color:#2dc26b">The Kiwi Says</span><span style="color:#3598db">:</span>** <span style="color:#b96ad9">"Bwwiiiee."</span>
```

## Platform-Specific Differences

### CurseForge (curseforge.md)
- Simple markdown only
- No HTML divs or complex formatting
- Logo displayed inline with header

### GitHub README (README.md)
- Supports HTML for centering
- Additional sections: Technical Details, Repository Stats, Contributing
- Activity graphs and advanced badges

## Common Mistakes to Avoid

1. **Logo Size**: ALWAYS include both `width="25"` and `height="25"` for addon logos
2. **Logo Placement**: Logo goes IN the H1 header, not below it
3. **Color Coding**: Every text element must be color-coded
4. **Kiwi Mascot**: Required in both header (20px) and footer (15px)
5. **Separator Colors**: All pipes, colons, and dashes use `#3598db`

## Template Example (SRLU)

```markdown
# <img src="https://raw.githubusercontent.com/donniedice/SRLU/main/images/SRLU_logo_400x400.png" width="25" height="25"> <span style="color:#8B4513">S</span><span style="color:#8B4513">R</span><span style="color:#8B4513">L</span><span style="color:#8B4513">U</span> <span style="color:#3598db">|</span> <span style="color:#8B4513">Skyrim Level-Up</span><span style="color:#8B4513">!</span>

## <img src="https://raw.githubusercontent.com/donniedice/SimpleQuestPlates/main/images/kiwi.gif" height="20"> <span style="color:#8B1538">R</span><span style="color:#8B1538">G</span><span style="color:#8B1538">X</span> <span style="color:#4ecdc4">Mods</span> <span style="color:#3598db">-</span> [<span style="color:#8B1538">R</span><span style="color:#7598b6">ealm</span><span style="color:#8B1538">G</span><span style="color:#8B1538">X</span>](https://realmgx.com) <span style="color:#8B4513">Community Project</span>

**<span style="color:#8B4513">"Fus Ro DAH!"</span> <span style="color:#e67e23">- Now in</span> <span style="color:#06c">World of Warcraft</span><span style="color:#e67e23">!</span>**
```

## Validation Checklist

- [ ] Logo has both width="25" and height="25" attributes
- [ ] Logo is in the H1 header before addon name
- [ ] All addon letters are individually color-coded
- [ ] RGX branding uses correct burgundy/blue colors
- [ ] Kiwi gif appears in header (20px) and footer (15px)
- [ ] All separators use #3598db color
- [ ] Footer includes kiwi with "Bwwiiiee" message
- [ ] Discord community section is prominent
- [ ] Support badges are included

## For Brand-Formatter Agent

When creating RGX Mods documentation, ALWAYS:

1. Start with the exact header structure shown above
2. Use the addon's theme color consistently
3. Include both width and height for logos (25x25)
4. Place logos IN the header, not below
5. Color-code EVERY text element
6. Include kiwi mascot in required positions
7. Follow the exact structure for both CurseForge and README versions

This ensures consistency across all RGX Mods addons and prevents repeated corrections.