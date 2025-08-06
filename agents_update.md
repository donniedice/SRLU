# RGX Mods Agents Update v1.2.0

## Brand-Formatter Agent Updates

### Logo Standards
- Always use `width="25" height="25"` for logos in H1 headers
- Check for both `logo.png` and `ADDON_logo_400x400.png` formats
- Placement: Directly in H1 header before addon name

### Discord Integration
- **New Permanent Link**: https://discord.gg/hK9N3esnce
- Each addon requires unique webhook URL
- No @everyone or @here pings in notifications
- Bot avatar must be addon logo, not kiwi

### Color Themes (Updated)
```
SRLU: #8B4513 (Brown)
FFLU: #FFD700 (Gold)
SimpleQuestPlates: #4ECDC4 (Teal)
BLU: #3498DB (Blue)
CPU: #9B59B6 (Purple)
```

### CurseForge URLs
```
SRLU: /srlu
FFLU: /fflu
SimpleQuestPlates: /sqp-simplequestplates
```

### Workflow Standards
- Use `deploy.yml` for Discord notifications
- Trigger on release creation, not just tag push
- Handle multi-line release notes properly
- Include proper JSON escaping

## WoW-Addon-Assistant Updates

### Discord Webhook Configuration
- Must use GitHub Secrets for webhook URLs
- Name: `DISCORD_WEBHOOK`
- Each repository needs unique webhook

### Common Issues Fixed
1. Wrong channel posting - use unique webhooks
2. Icon path errors - use `logo.png`
3. Duplicate notifications - remove from `release.yml`
4. Invalid Discord links - use new permanent link

## Implementation Checklist

- [x] Update brand-formatter with new standards
- [x] Document Discord webhook requirements
- [x] Fix color themes for all addons
- [x] Update CurseForge URLs
- [x] Create workflow templates
- [x] Test all Discord integrations

## Version History

### v1.2.0 (2025-08-06)
- Updated Discord permanent link
- Fixed logo sizing standards
- Added unique webhook requirements
- Corrected addon color themes
- Fixed CurseForge URLs

### v1.1.0 (Previous)
- Initial brand standards
- Basic Discord integration
- Original color themes