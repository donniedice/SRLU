# RGX Mods Discord Workflow Template

This template should be used for all RGX Mods addon repositories to ensure consistent Discord notifications.

## Implementation Instructions

1. Create `.github/workflows/deploy.yml` in your addon repository
2. Replace the following placeholders:
   - `[ADDON_NAME]` - Full addon name (e.g., "SRLU | Skyrim Level-Up!")
   - `[ADDON_SHORT]` - Short name (e.g., "SRLU")
   - `[ADDON_LOGO_URL]` - Direct URL to addon logo
   - `[ADDON_TAGLINE]` - Addon tagline (e.g., "Fus Ro DAH!")
   - `[ADDON_DESCRIPTION]` - Brief description
   - `[CURSEFORGE_SLUG]` - CurseForge URL slug (e.g., "srlu")
   - `[WAGO_ID]` - Wago addon ID

3. Add GitHub Secret:
   - Name: `DISCORD_WEBHOOK`
   - Value: Your Discord webhook URL (MUST be unique per addon - see DISCORD_WEBHOOK_SETUP_GUIDE.md)

## Standard Workflow Template

```yaml
name: Deploy and Notify

on:
  release:
    types: [published]
  workflow_dispatch:
    inputs:
      version:
        description: 'Version number for manual deployment'
        required: true
        type: string

jobs:
  notify-discord:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Get release information
        id: release_info
        run: |
          if [ "${{ github.event_name }}" == "release" ]; then
            echo "version=${{ github.event.release.tag_name }}" >> $GITHUB_OUTPUT
            
            # Handle multi-line body properly
            BODY=$(echo "${{ github.event.release.body }}" | head -c 500 | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
            echo "body=$BODY" >> $GITHUB_OUTPUT
            
            echo "url=${{ github.event.release.html_url }}" >> $GITHUB_OUTPUT
            echo "name=${{ github.event.release.name }}" >> $GITHUB_OUTPUT
          else
            echo "version=${{ github.event.inputs.version }}" >> $GITHUB_OUTPUT
            echo "body=Manual deployment triggered" >> $GITHUB_OUTPUT
            echo "url=${{ github.server_url }}/${{ github.repository }}" >> $GITHUB_OUTPUT
            echo "name=[ADDON_SHORT] ${{ github.event.inputs.version }}" >> $GITHUB_OUTPUT
          fi
      
      - name: Send Discord notification
        env:
          DISCORD_WEBHOOK: ${{ secrets.DISCORD_WEBHOOK }}
        run: |
          # Create RGX Mods standard Discord message
          curl -H "Content-Type: application/json" \
               -X POST \
               -d "{
                 \"content\": \"\",
                 \"username\": \"[ADDON_SHORT] Update\",
                 \"avatar_url\": \"[ADDON_LOGO_URL]\",
                 \"embeds\": [{
                   \"title\": \"[ADDON_NAME] - ${{ steps.release_info.outputs.version }}\",
                   \"description\": \"**[ADDON_TAGLINE]** - A new version of [ADDON_SHORT] has been released!\\n\\n🎵 **What's New:**\\n• Check the release notes for details\\n\\n**[ADDON_DESCRIPTION]**\",
                   \"url\": \"${{ steps.release_info.outputs.url }}\",
                   \"color\": [COLOR_CODE],
                   \"thumbnail\": {
                     \"url\": \"[ADDON_LOGO_URL]\"
                   },
                   \"fields\": [
                     {
                       \"name\": \"📥 Downloads\",
                       \"value\": \"[CurseForge](https://www.curseforge.com/wow/addons/[CURSEFORGE_SLUG])\\n[Wago.io](https://addons.wago.io/addons/[ADDON_SHORT])\\n[GitHub](https://github.com/donniedice/[ADDON_SHORT])\",
                       \"inline\": true
                     },
                     {
                       \"name\": \"🎮 Compatibility\",
                       \"value\": \"✅ The War Within\\n✅ Classic Era\\n✅ Cataclysm\\n✅ MoP\",
                       \"inline\": true
                     },
                     {
                       \"name\": \"💬 Support\",
                       \"value\": \"[Join Discord](https://discord.gg/N7kdKAHVVF)\\n[Report Issues](https://github.com/donniedice/[ADDON_SHORT]/issues)\",
                       \"inline\": true
                     }
                   ],
                   \"footer\": {
                     \"text\": \"RGX Mods - RealmGX Community\",
                     \"icon_url\": \"https://raw.githubusercontent.com/donniedice/SimpleQuestPlates/main/images/kiwi.gif\"
                   },
                   \"timestamp\": \"$(date -u +%Y-%m-%dT%H:%M:%S.000Z)\"
                 }]
               }" \
               "$DISCORD_WEBHOOK"
```

## Color Codes for Each Addon

Use these decimal color values in the `color` field:

- **SRLU** (Brown/Rust): `9132843` (#8B4513)
- **FFLU** (Gold): `16766720` (#FFD700)
- **SimpleQuestPlates** (Teal): `5168588` (#4ECDC4)
- **BLU** (Blue): `3447003` (#3498DB)
- **CPU** (Purple): `10181046` (#9B59B6)

## Example Implementations

### SRLU
```yaml
\"username\": \"SRLU Update\",
\"avatar_url\": \"https://raw.githubusercontent.com/donniedice/SRLU/main/images/SRLU_logo_400x400.png\",
\"title\": \"🗡️ SRLU | Skyrim Level-Up! - ${{ steps.release_info.outputs.version }}\",
\"description\": \"**Fus Ro DAH!** - A new version of SRLU has been released!...\",
\"color\": 9132843,
```

### FFLU
```yaml
\"username\": \"FFLU Update\",
\"avatar_url\": \"https://raw.githubusercontent.com/donniedice/FFLU/main/images/FFLU_logo_400x400.png\",
\"title\": \"⚔️ FFLU | Final Fantasy Level Up! - ${{ steps.release_info.outputs.version }}\",
\"description\": \"**Victory Fanfare!** - A new version of FFLU has been released!...\",
\"color\": 16766720,
```

### SimpleQuestPlates (SQP)
```yaml
\"username\": \"SQP Update\",
\"avatar_url\": \"https://raw.githubusercontent.com/donniedice/SimpleQuestPlates/main/images/SQP_logo_400x400.png\",
\"title\": \"🎯 SimpleQuestPlates - ${{ steps.release_info.outputs.version }}\",
\"description\": \"**Clean. Simple. Effective.** - A new version of SimpleQuestPlates has been released!...\",
\"color\": 5168588,
```

## Discord Message Standards

### Required Elements
1. **Content** - Empty string (no pings)
2. **Bot Username** - "[ADDON_SHORT] Update"
3. **Bot Avatar** - Addon's logo (not kiwi)
4. **Embed Title** - Full addon name with version
5. **Embed Description** - Tagline + announcement + brief description
6. **Thumbnail** - Addon logo
7. **Fields** - Downloads, Compatibility, Support (3 inline fields)
8. **Footer** - "RGX Mods - RealmGX Community" with kiwi gif
9. **Timestamp** - ISO format timestamp
10. **Color** - Addon-specific theme color

### Visual Hierarchy
```
[Addon Logo Avatar] ADDON Update

┌─────────────────────────────────┐
│ [Title with Icon] Name - Version│ [Addon Logo Thumbnail]
│                                  │
│ **Tagline** - New version text  │
│                                  │
│ What's New:                      │
│ • Feature 1                      │
│ • Feature 2                      │
│                                  │
│ Brief description                │
├─────────────────────────────────┤
│ Downloads | Compatibility | Help │
├─────────────────────────────────┤
│ [Kiwi] RGX Mods - RealmGX       │
└─────────────────────────────────┘
```

## Implementation Checklist

For each addon repository:

- [ ] Create `.github/workflows/` directory
- [ ] Add `deploy.yml` workflow file
- [ ] Replace all placeholders with addon-specific values
- [ ] Set correct color code for addon theme
- [ ] Add `DISCORD_WEBHOOK` secret in GitHub repository settings
- [ ] Test with manual workflow trigger
- [ ] Create a release to test automatic trigger

## Testing

1. **Manual Test:**
   ```bash
   gh workflow run deploy.yml -f version=vX.X.X-test
   ```

2. **Check Run:**
   ```bash
   gh run list --workflow=deploy.yml --limit 1
   ```

3. **View Logs if Failed:**
   ```bash
   gh run view [RUN_ID] --log-failed
   ```

## Common Issues

1. **Wrong Channel Posting**: Each addon MUST have its own unique webhook URL
2. **JSON Parsing Errors**: Ensure all strings are properly escaped with backslashes
3. **Multi-line Text**: Release body text needs special handling (see template)
4. **Webhook URL**: Must be set as GitHub secret, not hardcoded
5. **Color Values**: Must use decimal values, not hex
6. **Image URLs**: Must be direct links to images (raw.githubusercontent.com)
7. **Wrong Icons**: Check actual filenames in images/ folder (logo.png vs ADDON_logo_400x400.png)

## Maintaining Consistency

When updating any addon's workflow:
1. Update this template first
2. Apply changes to all addon repositories
3. Test each implementation
4. Document any addon-specific variations

This ensures all RGX Mods addons maintain consistent Discord notification formatting.