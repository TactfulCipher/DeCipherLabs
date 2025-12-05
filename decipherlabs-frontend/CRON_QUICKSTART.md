# Quick Start Guide

## 1. Add Your Private Key

Edit `scripts/.env` and replace `YOUR_PRIVATE_KEY_HERE` with your actual private key.

**IMPORTANT**: Keep this file secure! It's already in `.gitignore`.

## 2. Install Dependencies

```bash
npm install
```

## 3. Test the Automation

```bash
npm run cron
```

Expected output:
```
=== Starting Payment Automation ===
RPC URL: https://sepolia.base.org
Payroll Contract: 0xFada76e875A1d4096F73f695fb984d448125a9FB
Connected as: 0xBea138f19224adB24958DB663fc4830b276fdF9B
Found X employees
```

## 4. When to Run

The automation script will:
- Check all employees
- Process payments ONLY for those whose `nextPayTimestamp` has passed
- Skip employees who aren't due yet

## Next: Deploy to Cloud (Optional)

See `scripts/README.md` for GitHub Actions setup (completely free, 24/7 automation).
