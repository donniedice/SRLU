# Discord Webhook Setup Guide for RGX Mods

This guide explains how to properly configure Discord webhooks for RGX Mods addon notifications.

## Critical Requirements

### 1. Unique Webhook URLs Per Addon

**IMPORTANT**: Each addon MUST have its own unique webhook URL that posts to its specific Discord channel.

- **Problem**: Using the same webhook URL for multiple addons causes all notifications to go to the same channel
- **Solution**: Create a separate webhook for each addon's channel

### 2. Creating Discord Webhooks

1. Go to your Discord server settings
2. Navigate to **Integrations** → **Webhooks**
3. Click **New Webhook** for each addon
4. Configure each webhook:
   - **Name**: `[ADDON_NAME] Updates` (e.g., "SRLU Updates")
   - **Channel**: Select the specific channel for that addon
   - **Avatar**: Optional (workflow will override this)
5. Copy the webhook URL

### 3. GitHub Repository Setup

For each addon repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add:
   - **Name**: `DISCORD_WEBHOOK`
   - **Value**: The unique webhook URL for that specific addon

### 4. Webhook URL Management

#### Example Structure:
```
SRLU Repository
├── Secret: DISCORD_WEBHOOK
└── Value: https://discord.com/api/webhooks/[SRLU_WEBHOOK_ID]/[SRLU_TOKEN]

FFLU Repository
├── Secret: DISCORD_WEBHOOK
└── Value: https://discord.com/api/webhooks/[FFLU_WEBHOOK_ID]/[FFLU_TOKEN]

SimpleQuestPlates Repository
├── Secret: DISCORD_WEBHOOK
└── Value: https://discord.com/api/webhooks/[SQP_WEBHOOK_ID]/[SQP_TOKEN]
```

## Common Issues and Solutions

### Issue 1: All Notifications Going to Same Channel

**Symptom**: SQP notifications appear in FFLU channel, or vice versa

**Cause**: All repositories using the same webhook URL

**Fix**: 
1. Create unique webhooks for each addon's Discord channel
2. Update each repository's `DISCORD_WEBHOOK` secret with the correct URL

### Issue 2: Wrong Icons/Avatars

**Symptom**: Discord bot shows wrong addon logo or uses kiwi instead of addon logo

**Cause**: Incorrect image paths in workflow

**Fix**: Ensure workflow uses correct paths:
- SRLU: `images/SRLU_logo_400x400.png`
- FFLU: `images/logo.png`
- SQP: `images/logo.png`

### Issue 3: Version Numbers Incorrect

**Symptom**: Version shows as `null` or wrong version

**Cause**: GitHub Actions expression syntax issues

**Fix**: Use proper GitHub Actions expressions:
```yaml
${{ steps.release_info.outputs.version }}
${{ github.event.release.tag_name }}
```

### Issue 4: Workflow Permission Errors

**Symptom**: `refusing to allow an OAuth App to create or update workflow`

**Cause**: GitHub token lacks workflow scope

**Fix**: 
1. Use GitHub CLI: `gh auth refresh -s workflow`
2. Or manually push from a different authentication method

## Testing Your Setup

### 1. Manual Workflow Trigger Test

```bash
# Test the workflow without creating a release
gh workflow run deploy.yml -f version=v1.0.0-test

# Check the run status
gh run list --workflow=deploy.yml --limit 1

# View logs if there are issues
gh run view [RUN_ID] --log-failed
```

### 2. Verify Discord Message

After running the test, check:
- Message appears in correct channel
- Bot name and avatar are correct
- Version number displays properly
- All links work correctly
- No @everyone pings

### 3. Release Test

Create a test release to verify automatic triggering:
```bash
gh release create v1.0.0-test --title "Test Release" --notes "Testing Discord webhook"
```

## Workflow File Standards

### Required Elements in Each Workflow

1. **No @everyone Pings**: `"content": ""`
2. **Addon-Specific Bot Avatar**: Use addon's logo, not kiwi
3. **Proper Color Codes**:
   - SRLU: `9132843` (Brown)
   - FFLU: `16766720` (Gold)
   - SQP: `5168588` (Teal)
4. **Consistent Footer**: Kiwi gif with "RGX Mods - RealmGX Community"

### Example Webhook Message Structure

```json
{
  "content": "",
  "username": "ADDON Update",
  "avatar_url": "https://raw.githubusercontent.com/donniedice/ADDON/main/images/logo.png",
  "embeds": [{
    "title": "ADDON Name - Version",
    "description": "**Tagline** - New version released!",
    "color": COLOR_CODE,
    "thumbnail": {
      "url": "ADDON_LOGO_URL"
    },
    "fields": [...],
    "footer": {
      "text": "RGX Mods - RealmGX Community",
      "icon_url": "KIWI_GIF_URL"
    }
  }]
}
```

## Maintenance Checklist

When updating any addon's Discord integration:

- [ ] Verify unique webhook URL in repository secrets
- [ ] Check webhook posts to correct Discord channel
- [ ] Confirm addon logo paths are correct
- [ ] Test version number handling
- [ ] Verify no @everyone pings
- [ ] Check color theme matches addon branding
- [ ] Test both manual trigger and release trigger

## Security Notes

1. **Never commit webhook URLs** to the repository
2. **Always use GitHub Secrets** for webhook storage
3. **Rotate webhooks** if accidentally exposed
4. **Limit webhook permissions** to only posting messages

## Support

For issues with Discord webhooks:
1. Check webhook exists in Discord server settings
2. Verify GitHub secret is set correctly
3. Review workflow run logs for errors
4. Ensure webhook URL is complete and valid

Remember: Each addon = Unique webhook = Specific channel