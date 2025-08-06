# GitHub Actions Setup

## Discord Webhook Configuration

To enable Discord notifications for deployments:

1. Go to your repository Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `DISCORD_WEBHOOK`
4. Value: `https://discord.com/api/webhooks/1402510054506369154/4JFpuLjAej8RVI9VfiwdfJvR6wLptJsTiJ0UZ2ePGyZ7lDh0AOcVHTfuxZoC0e2JukJ8`
5. Click "Add secret"

## Optional: API Tokens for Distribution Platforms

### CurseForge
- Secret name: `CURSEFORGE_API_TOKEN`
- Get your token from: https://www.curseforge.com/account/api-tokens

### Wago
- Secret name: `WAGO_API_TOKEN`
- Get your token from: https://addons.wago.io/account/api-tokens

## Testing the Workflow

You can manually trigger the deployment workflow:
1. Go to Actions tab in your repository
2. Select "Deploy and Notify" workflow
3. Click "Run workflow"
4. Enter a version number
5. Click "Run workflow" button

The workflow will automatically run when you create a new release on GitHub.