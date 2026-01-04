# 🔧 DEPLOYMENT FAILED - TROUBLESHOOTING GUIDE

**Status**: ❌ FTP Deployment Failed  
**Date**: January 4, 2026  
**Root Cause**: Need to diagnose

---

## 🚨 WHAT WENT WRONG?

The FTP deployment step in GitHub Actions failed. This usually means one of these:

```
1. ❌ FTP Credentials are WRONG
   - FTP_HOST incorrect
   - FTP_USERNAME incorrect
   - FTP_PASSWORD incorrect
   - FTP_PORT wrong

2. ❌ FTP Server Issues
   - Server down or unreachable
   - Firewall blocking connections
   - Too many connection attempts

3. ❌ Directory Path Issue
   - FTP_DIR path doesn't exist
   - Wrong directory specified
   - Permission issues

4. ❌ Build Failed
   - dist/ folder not created properly
   - Missing files before upload
```

---

## 🔍 HOW TO DIAGNOSE

### Step 1: Check GitHub Actions Logs

1. Go to: https://github.com/iamGoldenOla/christthehavenschool/actions
2. Click the **failed workflow** (red X)
3. Click the **"Deploy to cPanel via FTP"** step
4. **Look for error message** - this tells you what went wrong

### Step 2: Common Error Messages

#### Error: "Authentication failed"
```
This means: Wrong FTP credentials
Solution:
1. Check FTP_USERNAME = christt2 (correct? or typo?)
2. Check FTP_PASSWORD is set (copy-paste correctly?)
3. Check FTP_HOST = 163.61.188.6 (correct?)
4. Check FTP_PORT = 21 (standard port)
```

#### Error: "Connection refused" or "Connection timeout"
```
This means: Can't reach FTP server
Solution:
1. Is FTP server running? (try pinging 163.61.188.6)
2. Is port 21 open? (firewall might block it)
3. Try FTP client on your computer to test
4. Contact LyteHosting support
```

#### Error: "File not found" or "No such directory"
```
This means: FTP_DIR path wrong or doesn't exist
Solution:
1. Check FTP_DIR = public_html/ (with trailing slash?)
2. Verify path exists in cPanel File Manager
3. Check if directory needs to be created first
```

#### Error: "Permission denied"
```
This means: User doesn't have write access
Solution:
1. Check file permissions on FTP server
2. Verify christt2 user has write access
3. Contact hosting provider to fix permissions
```

---

## ✅ SOLUTION: TEST YOUR FTP CREDENTIALS FIRST

### Option A: Test Manually with FTP Client

**Windows Users (FileZilla):**
1. Download FileZilla: https://filezilla-project.org/
2. Enter these details:
   ```
   Host: 163.61.188.6
   Username: christt2
   Password: (your password)
   Port: 21
   ```
3. Click "Connect"
4. If it connects → credentials are GOOD ✅
5. If it fails → credentials are WRONG ❌

**macOS/Linux Users (Terminal):**
```bash
# Test FTP connection
ftp -p 163.61.188.6
# When prompted, login as: christt2
# Password: (your password)
```

### Option B: Use Our FTP Test Script

1. In your project folder, run:
```bash
bash test-ftp.sh
```

2. Or with credentials:
```bash
bash test-ftp.sh 163.61.188.6 christt2 "your-password" 21 "public_html/"
```

3. Script will show:
   - ✅ Connection successful
   - ❌ Connection failed (shows why)

---

## 🔐 VERIFY GITHUB SECRETS

Your credentials must be stored CORRECTLY in GitHub Secrets:

### How to Check/Fix GitHub Secrets

1. Go to: https://github.com/iamGoldenOla/christthehavenschool
2. Click: **Settings** (top menu)
3. Go to: **Secrets and variables** → **Actions**
4. You should see:
   ```
   ✅ FTP_HOST          (value: 163.61.188.6)
   ✅ FTP_USERNAME      (value: christt2)
   ✅ FTP_PASSWORD      (value: ****) [hidden]
   ✅ FTP_PORT          (value: 21)
   ✅ FTP_DIR           (value: public_html/)
   ```

### If Any Are Missing or Wrong:

1. Click the secret to edit
2. Update the value
3. Save
4. Re-run workflow

---

## 🛠️ FIX: Use New Improved Workflow

I've created a **better FTP workflow** that's more reliable. Let me push it:

```bash
# This uses lftp instead of a third-party action
# More robust and shows better error messages
```

The new workflow file: `.github/workflows/ftp-deploy.yml`

**Benefits:**
- ✅ Better error messages
- ✅ Faster uploads
- ✅ More reliable connection
- ✅ Shows exactly what's wrong

### To Use New Workflow:

1. The file is already created locally
2. I'll push it to GitHub
3. New deployments will use it automatically
4. More reliable FTP connection

---

## 🚀 NEXT STEPS: QUICK FIX

### Step 1: Verify Credentials (5 minutes)
```
Do this on your computer:
1. Open FileZilla or command line
2. Try to connect to: 163.61.188.6:21
3. Username: christt2
4. Password: (yours)
5. Navigate to: public_html/
```

### Step 2: If Connection Works
```
✅ Credentials are CORRECT
→ Proceed to Step 3
```

### Step 3: If Connection Fails
```
❌ Credentials are WRONG
→ Contact LyteHosting support
→ Get correct FTP credentials
→ Update GitHub Secrets
→ Re-run workflow
```

### Step 4: Manual Backup Upload (If FTP Still Fails)
```
If FTP won't work:
1. Download dist.zip from your computer
2. Upload manually to cPanel File Manager
3. Site will go live immediately
```

---

## 📋 TROUBLESHOOTING CHECKLIST

- [ ] **Credentials Verified**
  - [ ] FTP_HOST correct (163.61.188.6)
  - [ ] FTP_USERNAME correct (christt2)
  - [ ] FTP_PASSWORD correct and set
  - [ ] FTP_PORT correct (21)
  - [ ] FTP_DIR correct (public_html/)

- [ ] **GitHub Secrets Updated**
  - [ ] All 5 secrets exist in GitHub
  - [ ] Values match your FTP account
  - [ ] No typos or extra spaces

- [ ] **FTP Server Status**
  - [ ] Server is reachable (can ping)
  - [ ] Port 21 is open
  - [ ] User has write permissions
  - [ ] Directory exists

- [ ] **Build Status**
  - [ ] npm ci succeeded
  - [ ] npm run build succeeded
  - [ ] dist/ folder created
  - [ ] Files are in dist/

- [ ] **Workflow File**
  - [ ] Using new ftp-deploy.yml
  - [ ] Secrets referenced correctly
  - [ ] No syntax errors

---

## 🆘 NEED HELP?

### For FTP Issues
- Test with FileZilla first (shows exact error)
- Check LyteHosting documentation
- Contact: support@lytehosting.com

### For GitHub Actions Issues
- Check workflow logs (most important!)
- Verify all secrets are set correctly
- Look for typos in secret names

### For General Issues
- See DEPLOYMENT_CHECKLIST.md
- See MANUAL_DEPLOYMENT.md (fallback method)
- Ask me directly

---

## 📱 MANUAL DEPLOYMENT: FALLBACK PLAN

If FTP automation continues to fail:

### Method 1: Manual cPanel Upload (10 minutes)
1. Download dist.zip from your computer
2. Login to cPanel (lytehosting.com)
3. File Manager → public_html
4. Upload dist.zip
5. Right-click → Extract
6. Done!

### Method 2: FTP Client Upload (5 minutes)
1. Use FileZilla
2. Connect to: 163.61.188.6:21
3. Upload dist/ contents to public_html/
4. Done!

Both methods work perfectly fine as backup.

---

## ✅ SUCCESS CRITERIA

Deployment is successful when:

```
✅ GitHub Actions shows all GREEN checkmarks
✅ No error messages in workflow logs
✅ All files uploaded to cPanel
✅ https://christthehavenschool.com loads
✅ No 404 errors
✅ Navigation works
```

If any of above fails, follow troubleshooting guide above.

---

## 📊 SUMMARY

**Problem**: FTP deployment failed  
**Cause**: To be diagnosed (check logs)  
**Solution**: Verify credentials → Use improved workflow → Retry  
**Time to Fix**: 5-10 minutes  
**Backup Plan**: Manual upload via cPanel  

---

## 🎯 IMMEDIATE ACTION

1. **Now**: Check GitHub Actions logs for exact error
2. **Next 5 min**: Verify FTP credentials with FileZilla
3. **Next 10 min**: Update GitHub Secrets if needed
4. **Final**: Push new workflow and retry

---

**Need the exact error message from GitHub Actions to proceed further.**

Could you share:
- What error shows in the GitHub Actions logs?
- Screenshot of the error?
- Or tell me what it says?

That will help me fix it immediately! 🚀
