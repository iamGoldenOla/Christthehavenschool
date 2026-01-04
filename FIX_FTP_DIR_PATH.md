# 🔧 FIX FTP_DIR PATH - Update GitHub Secret

## The Issue
The FTP directory path needs to be the **absolute path** on your server, not just `public_html/`

## Correct Path
```
/home/christt2/public_html/
```

---

## ✅ How to Update GitHub Secret

### Step 1: Go to GitHub Repository Settings
1. Visit: https://github.com/iamGoldenOla/christthehavenschool
2. Click **Settings** tab (top navigation)
3. Click **Secrets and variables** (left sidebar)
4. Click **Actions**

### Step 2: Edit FTP_DIR Secret
1. Find **FTP_DIR** in the list
2. Click the **pencil icon** (edit button)
3. Change the value from:
   ```
   public_html/
   ```
   To:
   ```
   /home/christt2/public_html/
   ```
4. Click **Update secret**

### Step 3: Verify All Secrets
Make sure you have these 5 secrets with correct values:

```
✅ FTP_HOST     = 163.61.188.6
✅ FTP_USERNAME = christt2
✅ FTP_PASSWORD = (your password - hidden)
✅ FTP_PORT     = 21
✅ FTP_DIR      = /home/christt2/public_html/  ← UPDATED
```

---

## 🚀 After Updating

1. **Go to cPanel** and update the `.htaccess` file with the improved rules (if not done yet)
2. **Push a test change** to GitHub:
   ```bash
   git add AUTO_DEPLOY_ACTIVATED.md
   git commit -m "Update FTP directory path"
   git push origin main
   ```
3. **Monitor deployment**:
   - Go to: https://github.com/iamGoldenOla/christthehavenschool/actions
   - Watch the workflow run
   - Should complete in 7-13 minutes

---

## Why This Matters

- ❌ `public_html/` = Relative path (FTP client interprets differently)
- ✅ `/home/christt2/public_html/` = Absolute path (exact server location)

The absolute path ensures FTP knows exactly where to upload files on your cPanel server.

---

## Expected Result After Fix

✅ Workflow connects to FTP successfully  
✅ Files upload to correct directory  
✅ Site goes live: https://christthehavenschool.com  
✅ No more MIME type or 404 errors  

---

## Reference

**Your cPanel Details**:
- Host: 163.61.188.6
- Username: christt2
- Port: 21
- Upload Directory: /home/christt2/public_html/

This is the standard path structure for cPanel servers with the username "christt2".
