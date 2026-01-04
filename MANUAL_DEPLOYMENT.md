# 📤 MANUAL DEPLOYMENT TO cPANEL - BACKUP METHOD

**Use this if automated FTP deployment continues to fail**

---

## ✅ OPTION 1: Upload via cPanel File Manager (EASIEST)

### Step 1: Download dist.zip
From your computer:
```bash
cd Christthehavenschool
# Compress dist folder
# Windows: Right-click dist → Send to → Compressed (zipped) folder
# Or use 7-Zip, WinRAR, etc.
# Result: dist.zip
```

### Step 2: Login to cPanel
```
URL: https://lytehosting.com (or your cPanel URL)
Username: Your cPanel username
Password: Your cPanel password
```

### Step 3: Open File Manager
In cPanel Dashboard:
1. Find **File Manager** (left sidebar)
2. Click it
3. You should see folders listed

### Step 4: Navigate to public_html
```
Folder list on left:
├── public_html  ← Click this
```

### Step 5: Upload ZIP File
```
In public_html folder:
1. Right-click empty space
2. Select "Upload" 
3. Choose your "dist.zip" file
4. Click "Open"
5. Wait for upload to complete (progress bar)
```

### Step 6: Extract ZIP
```
After upload:
1. Right-click "dist.zip"
2. Select "Extract"
3. Confirm extraction
4. Files should appear in public_html/
```

### Step 7: Verify Files
```
You should see:
├── index.html      ✓
├── assets/         ✓
├── .htaccess       ✓
├── robots.txt      ✓
└── favicon.ico     ✓
```

### Step 8: Test Domain
```
Visit: https://christthehavenschool.com
Expected: Homepage loads
```

**Time**: 5-10 minutes  
**Difficulty**: ⭐ Easy  
**Success Rate**: 99%

---

## ✅ OPTION 2: Upload via FTP Client

### Prerequisites
Download one of these FTP clients:
- **FileZilla** (Free): https://filezilla-project.org/
- **WinSCP** (Free): https://winscp.net/
- **Cyberduck** (Free, macOS): https://cyberduck.io/

### Step 1: Open FTP Client
Launch FileZilla or your FTP client

### Step 2: Enter FTP Details
```
Host:     163.61.188.6
Port:     21
Username: christt2
Password: (your FTP password)
Protocol: FTP (not SFTP)
```

### Step 3: Connect
```
Click "Quickconnect" or "Connect"
Status should show: "Connected to..."
```

### Step 4: Navigate to Server Folder
```
Left side: Your computer (local)
Right side: Server folders

On right side:
1. Double-click "public_html" folder
2. This is where files need to go
```

### Step 5: Upload dist Contents
```
On LEFT side (your computer):
1. Find your "dist" folder
2. Open it
3. Select ALL files inside (Ctrl+A)

Drag to RIGHT side (server public_html)
Or: Right-click → Upload
```

### Step 6: Wait for Upload
```
Progress bar shows upload status
This takes 2-5 minutes for all files
```

### Step 7: Verify on Server
```
Files in public_html should be:
├── index.html      ✓
├── assets/         ✓
├── .htaccess       ✓
├── robots.txt      ✓
└── favicon.ico     ✓
```

### Step 8: Test Domain
```
Visit: https://christthehavenschool.com
Expected: Homepage loads
```

**Time**: 10-15 minutes  
**Difficulty**: ⭐⭐ Medium  
**Success Rate**: 98%

---

## ✅ OPTION 3: Upload via SSH/Terminal (ADVANCED)

### Prerequisites
```
- SSH access enabled on hosting
- Terminal/Command line experience
- SSH client (PuTTY on Windows, Terminal on Mac/Linux)
```

### Step 1: Connect via SSH
```bash
ssh christt2@163.61.188.6
# Enter password when prompted
```

### Step 2: Navigate to public_html
```bash
cd public_html
ls -la  # List current files
```

### Step 3: Upload via SCP (from your computer)
```bash
# From your local machine:
scp -r ./dist/* christt2@163.61.188.6:/home/christt2/public_html/

# Or if path is different:
scp -r ./dist/* christt2@163.61.188.6:~/public_html/
```

### Step 4: Verify Upload
```bash
# SSH back in and check
ssh christt2@163.61.188.6
ls -la ~/public_html/
```

### Step 5: Test Domain
```
Visit: https://christthehavenschool.com
Expected: Homepage loads
```

**Time**: 5 minutes  
**Difficulty**: ⭐⭐⭐ Hard  
**Success Rate**: 99%

---

## 🔧 TROUBLESHOOTING MANUAL UPLOADS

### Problem: "Permission Denied" During Upload

**For cPanel File Manager:**
1. In File Manager, right-click dist.zip
2. Select "Change Permissions"
3. Set to: 644
4. Try extracting again

**For FTP Client:**
1. Ensure you're uploading to correct directory
2. Check if directory has write permissions
3. Try uploading one file first
4. Contact hosting provider if still blocked

### Problem: Upload Very Slow

**Cause**: Large files (especially images)  
**Solution**:
- Upload in background while working
- Can take 10-15 minutes for all files
- Don't close connection during upload

### Problem: "File Already Exists"

**For cPanel:**
1. Delete old files first
2. Then upload new ZIP
3. Or overwrite when prompted

**For FTP:**
1. Right-click → Delete old files
2. Then upload new files
3. Or enable "Overwrite" option

### Problem: Site Shows Blank Page After Upload

**Causes:**
- Missing .htaccess file
- Files not extracted properly
- Browser cache issue

**Solutions:**
1. Verify .htaccess is in public_html root
2. Check all files extracted (ls -la or File Manager)
3. Clear browser cache: Ctrl+Shift+Delete
4. Hard refresh: Ctrl+F5

### Problem: 404 Error When Clicking Links

**Cause**: .htaccess file missing or wrong

**Solution:**
1. Verify .htaccess exists in public_html
2. Check content (should allow routing to index.html)
3. If missing, upload it separately
4. File is in: dist/.htaccess

---

## ✅ VERIFICATION CHECKLIST

After any upload method:

- [ ] index.html uploaded
- [ ] assets/ folder uploaded
- [ ] .htaccess uploaded (CRITICAL)
- [ ] robots.txt uploaded
- [ ] favicon.ico uploaded
- [ ] Domain accessible: https://christthehavenschool.com
- [ ] No 404 errors on home page
- [ ] Navigation links work
- [ ] Browser console clean (F12)
- [ ] Images display correctly

---

## 📊 COMPARISON: Upload Methods

| Method | Time | Difficulty | Reliability | Best For |
|--------|------|------------|-------------|----------|
| **cPanel File Manager** | 5-10 min | ⭐ Easy | 99% | Most users |
| **FTP Client** | 10-15 min | ⭐⭐ Medium | 98% | Advanced users |
| **SSH/SCP** | 5 min | ⭐⭐⭐ Hard | 99% | Developers |

**Recommended**: Option 1 (cPanel File Manager) - Easiest!

---

## 🎯 QUICKSTART: Use cPanel File Manager

```
1. Create dist.zip on your computer
2. Login to https://lytehosting.com
3. File Manager → public_html
4. Upload dist.zip
5. Extract
6. Visit domain
7. Done! ✅
```

Takes **5 minutes**!

---

## 📱 IF YOU NEED HELP

### Step 1: Tell Me What You Tried
- Did you use File Manager, FTP, or SSH?
- What error did you get?

### Step 2: I'll Help Troubleshoot
- Check error message
- Provide specific fix
- Step-by-step guide

### Step 3: Get Back Online
- We'll get your site live
- Usually takes 5-10 minutes

---

## ✨ IMPORTANT NOTES

**About .htaccess:**
- ⚠️ **CRITICAL FILE** - Don't skip it!
- Enables React Router to work
- Without it: 404 errors on navigation
- File is in: dist/.htaccess

**About File Permissions:**
- Set to 644 for files
- Set to 755 for folders
- cPanel handles this automatically

**About Overwriting:**
- Safe to overwrite old files
- New version will replace old one
- Users see new version immediately

**About Browser Cache:**
- If site looks old: Clear cache
- Ctrl+Shift+Delete → Clear All
- Or hard refresh: Ctrl+F5

---

## 🚀 NEXT STEPS

1. **Choose a method** (File Manager recommended)
2. **Prepare dist.zip** on your computer
3. **Upload to cPanel** (5-10 minutes)
4. **Verify site** works
5. **Share with team** or go live!

---

**Status**: Ready for manual deployment  
**Time Estimate**: 5-15 minutes depending on method  
**Success Rate**: 98-99%  

**Go live! 🚀**
