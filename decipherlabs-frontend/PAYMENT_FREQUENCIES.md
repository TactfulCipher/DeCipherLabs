# Payment Frequency Guide

## Supported Frequencies (GitHub Actions Compatible)

✅ **HOURLY** - Runs every hour (perfect with GitHub Actions)  
✅ **WEEKLY** - Every 7 days  
✅ **BIWEEKLY** - Every 14 days  
✅ **MONTHLY** - Every 30 days  
✅ **CUSTOM** - Any interval (must be ≥ 1 hour for reliable automation)

## Testing-Only Frequencies

⚠️ **MINUTELY** - For local testing only, NOT compatible with GitHub Actions  
*(GitHub Actions minimum is 5 minutes, not reliable for per-minute)*

## Recommendations

### For Production:
- **Hourly**: Contractors, freelancers
- **Weekly**: Part-time workers
- **Biweekly**: Full-time employees (US standard)
- **Monthly**: Salaried employees (global standard)

### For Testing:
- Use **HOURLY** instead of MINUTELY
- Test locally with `npm run cron` if you need faster testing

## Current GitHub Actions Schedule

**Runs every hour** - This handles all production payment frequencies perfectly.

## Cost

Running every hour = 720 runs/month × ~30 seconds each = ~6 hours of compute  
**Still 100% free** (GitHub gives 2,000 minutes/month)
