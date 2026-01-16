# 🚀 How to Test Locally

## The Problem

You're seeing this error because you opened `index.html` directly from your file system (file:// protocol). PDF.js cannot load PDFs this way due to browser security (CORS) restrictions.

## Solution: Start a Local Web Server

### Option 1: Python (Recommended)

**If you have Python 3:**
```bash
cd personal-site-repo
python3 -m http.server 8000
```

**If you have Python 2:**
```bash
cd personal-site-repo
python -m SimpleHTTPServer 8000
```

Then open: **http://localhost:8000**

### Option 2: Node.js (http-server)

**If you have Node.js:**
```bash
# Install http-server globally (one time)
npm install -g http-server

# Run server
cd personal-site-repo
http-server -p 8000
```

Then open: **http://localhost:8000**

### Option 3: PHP

**If you have PHP:**
```bash
cd personal-site-repo
php -S localhost:8000
```

Then open: **http://localhost:8000**

### Option 4: VS Code Live Server Extension

1. Install "Live Server" extension in VS Code
2. Right-click on `index.html`
3. Select "Open with Live Server"

### Option 5: Use the Test Page

The test page (`test-pdf-reader.html`) has the same issue, but you can use it to verify once you have a server running.

---

## Quick Test Steps

1. **Start server** (use any option above)
2. **Open browser** to http://localhost:8000
3. **Open console** (F12 or Cmd+Option+I)
4. **Wait 3 seconds** - Look for these messages:
   ```
   📄 Loading resume PDF...
   📄 PDF loaded: 2 pages
   ✅ Resume loaded successfully! 8547 characters extracted.
   💡 Chatbot can now answer questions from resume!
   ```
5. **Click chatbot** button
6. **Ask**: "What is my educational background?"
7. **Should see**: "📄 From Resume:" with content

---

## What You'll See

### ✅ Success (with web server):
```
Console:
📄 Loading resume PDF...
📄 PDF loaded: 2 pages
✅ Resume loaded successfully! 8547 characters extracted.
💡 Chatbot can now answer questions from resume!
```

### ❌ Failure (without web server):
```
Console:
📄 Loading resume PDF...
❌ Error loading resume: Failed to fetch
⚠️ Chatbot will work with limited knowledge base only.

Or:
Access to fetch at 'file:///...' from origin 'null' has been blocked by CORS policy
```

---

## Why This Happens

**Browser Security (CORS):**
- Browsers block loading files from `file://` protocol for security
- PDF.js needs to fetch the PDF file, which triggers CORS
- Solution: Serve files through HTTP (even locally)

**This is normal!** All web developers face this. It's why we use local servers for testing.

---

## Alternative: Test on GitHub Pages

If you don't want to run a local server, you can:

1. **Commit and push** your changes to GitHub
2. **Wait 2-3 minutes** for GitHub Pages to rebuild
3. **Visit** your live site: https://maheshmaheshwarr-stack.github.io/
4. **Test there** - It will work because it's served via HTTPS

---

## Troubleshooting

### "Command not found: python3"
- Try `python` instead of `python3`
- Or install Python from python.org
- Or use a different option (Node.js, PHP, VS Code)

### "Port 8000 already in use"
- Use a different port: `python3 -m http.server 8001`
- Or kill the existing process

### Still not working?
1. Check console for specific error message
2. Verify you're accessing via `http://localhost:8000` (not `file://`)
3. Try a different browser
4. Clear browser cache (Cmd+Shift+R or Ctrl+Shift+R)

---

## Quick Command Reference

```bash
# Navigate to folder
cd personal-site-repo

# Start Python server
python3 -m http.server 8000

# Open in browser
# Then go to: http://localhost:8000

# Stop server
# Press Ctrl+C in terminal
```

---

**Once you have a server running, the PDF will load successfully!** 🎉
