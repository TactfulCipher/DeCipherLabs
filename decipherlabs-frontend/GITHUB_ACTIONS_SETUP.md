# GitHub Actions Setup Guide

## What This Does

GitHub will automatically run your payment script **every 6 hours**, 24/7, for free.

## Setup Steps

### 1. Push Your Code to GitHub

```bash
# If you haven't already
git init
git add .
git commit -m "Add payment automation"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### 2. Add Secrets to GitHub

1. Go to your repo on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add these 3 secrets:

| Secret Name | Value |
|-------------|-------|
| `PRIVATE_KEY` | Your wallet private key (starts with 0x) |
| `PAYROLL_CONTRACT_ADDRESS` | `0xFada76e875A1d4096F73f695fb984d448125a9FB` |
| `RPC_URL` | `https://sepolia.base.org` |

### 3. Enable Workflows

1. Go to **Actions** tab in your repo
2. Click "I understand my workflows, go ahead and enable them"

### 4. Test It Manually

1. Go to **Actions** tab
2. Click "Automated Payment Processing"
3. Click **Run workflow** → **Run workflow**
4. Watch it run in real-time!

## How It Works

```
GitHub's servers (always on)
    ↓
Every 6 hours (0:00, 6:00, 12:00, 18:00 UTC)
    ↓
Automatically runs: npm run cron
    ↓
Processes payments for due employees
    ↓
You can view logs in Actions tab
```

## Customizing the Schedule

Edit `.github/workflows/payment-automation.yml`:

```yaml
# Every 12 hours
- cron: '0 */12 * * *'

# Daily at 9 AM UTC
- cron: '0 9 * * *'

# Every Monday at midnight
- cron: '0 0 * * 1'
```

## Viewing Logs

1. Go to **Actions** tab
2. Click on any workflow run
3. Click "process-payments" job
4. See full logs with payment details

## Cost

**100% FREE** - GitHub provides 2,000 free minutes/month for private repos. Your script runs in ~30 seconds, so you'll use less than 50 minutes/month.

## Security

✅ Secrets are encrypted - nobody can see them  
✅ Even you can't view them after saving  
✅ Only GitHub Actions can access them  
✅ Consider using a dedicated automation wallet for extra security
