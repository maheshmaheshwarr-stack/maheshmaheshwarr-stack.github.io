# 📧 Notification Setup Guide

## Overview

I've added code for **Email Notifications + Google Sheets logging**. You just need to add your API keys!

---

## Step 1: Get Web3Forms Access Key (2 minutes)

### What is Web3Forms?
Free service that sends you emails when someone accesses your chatbot.

### Setup:

1. **Go to:** https://web3forms.com/
2. **Click:** "Get Started Free" (top right)
3. **Enter your email:** mahesh.maheshwarr@gmail.com
4. **Check your email** - They send the Access Key instantly
5. **Copy the Access Key** - It looks like: `a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6`

### Free Tier:
- ✅ 250 submissions/month
- ✅ Email notifications
- ✅ No credit card required
- ✅ Forever free

---

## Step 2: Set Up Google Sheets (5 minutes)

### Option A: Using Sheet.best (Easiest)

1. **Go to:** https://sheet.best/
2. **Click:** "Create Connection"
3. **Sign in** with Google
4. **Create new Google Sheet** or select existing
5. **Name columns:** Name, Email, Company, Reason, Timestamp, Type, Referrer
6. **Copy the Connection URL** - It looks like: `https://sheet.best/api/sheets/abc123...`

### Option B: Using Google Apps Script (More Control)

1. **Create Google Sheet:** https://sheets.google.com/
2. **Name it:** "Chatbot Access Requests"
3. **Add headers:** Name | Email | Company | Reason | Timestamp | Type | Referrer
4. **Go to:** Extensions → Apps Script
5. **Paste this code:**

```javascript
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSheet();
  var data = JSON.parse(e.postData.contents);
  
  sheet.appendRow([
    data.Name,
    data.Email,
    data.Company,
    data.Reason,
    data.Timestamp,
    data.Type,
    data.Referrer
  ]);
  
  return ContentService.createTextOutput(JSON.stringify({success: true}))
    .setMimeType(ContentService.MimeType.JSON);
}
```

6. **Deploy:** Deploy → New deployment → Web app
7. **Set:** Execute as "Me", Access "Anyone"
8. **Copy the Web App URL**

---

## Step 3: Add Keys to Your Website

### Open the file:
```bash
cd personal-site-repo
# Edit index.html around line 3600
```

### Find these lines:
```javascript
const WEB3FORMS_KEY = 'YOUR_WEB3FORMS_ACCESS_KEY_HERE';
const GOOGLE_SHEETS_URL = 'YOUR_GOOGLE_SHEETS_URL_HERE';
```

### Replace with your keys:
```javascript
const WEB3FORMS_KEY = 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6'; // Your actual key
const GOOGLE_SHEETS_URL = 'https://sheet.best/api/sheets/abc123...'; // Your actual URL
```

### Save and deploy:
```bash
git add index.html
git commit -m "Add notification keys"
git push origin main
```

---

## What You'll Receive

### Email Notification (via Web3Forms):

```
Subject: 🤖 New Chatbot Access Request

From: Personal Website

Name: John Doe
Email: john@company.com
Company: Tech Corp
Reason: Hiring/Recruitment
Timestamp: 2026-01-16T10:30:00.000Z
Type: Chatbot Access
```

### Google Sheet Entry:

| Name | Email | Company | Reason | Timestamp | Type | Referrer |
|------|-------|---------|--------|-----------|------|----------|
| John Doe | john@company.com | Tech Corp | Hiring | 2026-01-16T10:30:00.000Z | Chatbot Access | Direct |

---

## Testing

### After adding keys:

1. **Wait 3 minutes** for deployment
2. **Open site in incognito mode**
3. **Click chatbot button**
4. **Fill verification form**
5. **Submit**
6. **Check your email** - Should receive notification
7. **Check Google Sheet** - Should see new row

### If not working:

**Check browser console (F12):**
- ✅ "Email notification sent successfully"
- ✅ "Data logged to Google Sheets successfully"

**Or:**
- ⚠️ "Web3Forms key not configured"
- ⚠️ "Google Sheets URL not configured"

---

## Troubleshooting

### Email not received?

1. **Check spam folder**
2. **Verify Web3Forms key is correct**
3. **Check console for errors**
4. **Test key at:** https://web3forms.com/

### Google Sheets not updating?

1. **Verify Sheet.best URL is correct**
2. **Check sheet permissions** (Anyone with link can edit)
3. **Check console for errors**
4. **Test with Postman or curl**

### Both not working?

1. **Check if keys are added correctly** (no quotes issues)
2. **Hard refresh browser** (Cmd+Shift+R)
3. **Check browser console** for specific errors
4. **Verify deployment completed** on GitHub

---

## Privacy & Security

### Web3Forms:
- ✅ GDPR compliant
- ✅ No data stored on their servers
- ✅ Just forwards emails
- ✅ Secure HTTPS

### Google Sheets:
- ✅ Your own Google account
- ✅ You control the data
- ✅ Can delete anytime
- ✅ Private by default

### Best Practices:
- Don't share your Access Key publicly
- Don't commit keys to public repos (but okay for your private site)
- Regularly review submissions
- Delete old data if not needed

---

## Advanced: Customize Email Template

### In Web3Forms dashboard:

1. **Go to:** https://web3forms.com/dashboard
2. **Select your form**
3. **Customize:**
   - Email subject
   - From name
   - Reply-to address
   - Email template
   - Auto-reply to submitter

### Example Custom Template:

```
New Chatbot Access Request 🤖

Someone just accessed your chatbot!

👤 Name: {name}
📧 Email: {email}
🏢 Company: {company}
💼 Reason: {reason}
🕐 Time: {timestamp}

You can reply directly to this email to contact them.

---
Sent from your Personal Website
```

---

## Monitoring

### View All Submissions:

**Web3Forms Dashboard:**
- https://web3forms.com/dashboard
- See all submissions
- Export to CSV
- View statistics

**Google Sheets:**
- Open your sheet
- Sort by timestamp
- Filter by reason
- Export to Excel

### Analytics:

**Track:**
- How many people access chatbot
- Which companies are interested
- Most common reasons
- Peak access times
- Conversion rate (visitors → chatbot access)

---

## Cost

### Current Setup:
- **Web3Forms:** FREE (250/month)
- **Sheet.best:** FREE (unlimited)
- **Google Sheets:** FREE
- **Total:** $0/month

### If you exceed limits:

**Web3Forms Paid Plans:**
- Pro: $5/month (1000 submissions)
- Business: $15/month (5000 submissions)

**Alternatives:**
- EmailJS: 200 free/month
- Formspree: 50 free/month
- SendGrid: 100 free/day

---

## Summary

### What I Added:
✅ Email notification function  
✅ Google Sheets logging function  
✅ Error handling  
✅ Console logging for debugging  

### What You Need to Do:
1. ⏳ Get Web3Forms Access Key (2 min)
2. ⏳ Set up Google Sheet (5 min)
3. ⏳ Add keys to index.html (1 min)
4. ⏳ Deploy (git push)
5. ✅ Test and enjoy!

---

## Quick Start Commands

```bash
# 1. Get your keys from:
# - Web3Forms: https://web3forms.com/
# - Sheet.best: https://sheet.best/

# 2. Edit the file
cd personal-site-repo
# Open index.html, find line ~3600
# Replace YOUR_WEB3FORMS_ACCESS_KEY_HERE with your key
# Replace YOUR_GOOGLE_SHEETS_URL_HERE with your URL

# 3. Deploy
git add index.html
git commit -m "Add notification keys"
git push origin main

# 4. Wait 3 minutes and test!
```

---

**Ready to set up? Get your keys and I'll help you add them!** 🚀
