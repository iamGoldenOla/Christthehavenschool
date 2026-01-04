# Quick Upload to cPanel - Step by Step

## OPTION 1: Upload ZIP File (Easiest)

### Step 1: Create dist.zip
```bash
# In your project root directory
# Navigate to dist folder and create ZIP file
```

### Step 2: Login to cPanel
- Go to: https://lytehosting.com (or your cPanel URL)
- Login with your credentials
- Look for "File Manager" icon

### Step 3: Upload ZIP
- Click "File Manager"
- Navigate to `public_html` folder
- Click "Upload" button
- Select your `dist.zip` file
- Wait for upload to complete

### Step 4: Extract ZIP
- Right-click on `dist.zip` in File Manager
- Click "Extract" 
- Choose destination: `public_html`
- Click "Extract File(s)"

### Step 5: Clean Up
- Delete the `dist.zip` file (optional)
- All contents are now in `public_html`

### Step 6: Add .htaccess
- In `public_html` folder, create new file `.htaccess`
- Copy contents from `dist/.htaccess` in your project
- This enables React Router to work properly

---

## OPTION 2: Upload via Git (More Reliable)

### Step 1: In cPanel
- Go to "Git Version Control" in cPanel
- Click "Create" or "Clone Repository"
- Repository URL: `https://github.com/iamGoldenOla/christthehavenschool`
- Branch: `main`
- Repository path: `/home/yourusername/public_html`

### Step 2: Install Dependencies
- After clone, SSH into your server or use cPanel's terminal
- Run:
```bash
cd /home/yourusername/public_html
npm install
npm run build
```

### Step 3: Verify
- Your built files will be in `dist/` folder
- Configure Apache to serve from `dist/` folder

---

## OPTION 3: Upload via FTP

### Step 1: Get FTP Credentials
- In cPanel, look for "FTP Accounts"
- Create new FTP account or use main account
- Note username, password, hostname

### Step 2: Connect with FTP Client
- Download FileZilla or similar FTP client
- Connect to: `ftp.yourdomain.com`
- Username & Password from cPanel
- Port: 21 (standard)

### Step 3: Upload dist Folder
- Navigate to `public_html` on server
- Upload entire contents of `dist/` folder
- Upload `.htaccess` file separately

### Step 4: Done
- All files are now on your hosting

---

## After Upload - Verify Site Works

### Check 1: Domain Access
- Visit your domain: https://christthehavenschool.com
- Should see homepage with no 404 errors

### Check 2: Navigation
- Click navigation links
- Pages should load without full page reload (React Router working)
- Check address bar - URL should change

### Check 3: Developer Console (F12)
- Press F12 → Console tab
- Should have no red errors
- Yellow warnings are usually okay

### Check 4: Images
- All images should display
- Check Network tab if images not loading

---

## Common Issues & Fixes

### Issue: Blank Page
**Solution**: 
- Clear browser cache (Ctrl+Shift+Delete)
- Check .htaccess file is in public_html
- Check dist/ folder contents are in public_html root

### Issue: 404 Errors on Navigation
**Solution**: 
- Ensure .htaccess file exists in public_html
- Content should match `dist/.htaccess`

### Issue: CSS/JS Not Loading
**Solution**:
- Refresh page with Ctrl+F5 (hard refresh)
- Check browser DevTools Network tab
- Verify file paths are correct

### Issue: Images Not Showing
**Solution**:
- Check image files are in dist/assets/ folder
- Verify they were uploaded correctly
- Check file permissions (should be readable)

---

## Important Files to Upload

```
dist/
├── index.html          (MUST UPLOAD)
├── assets/             (ENTIRE FOLDER)
│   ├── *.js           (JavaScript bundles)
│   └── *.css          (CSS files)
├── robots.txt         (Optional but good)
└── .htaccess          (CRITICAL for routing)
```

---

## Domain Configuration

If your domain doesn't point to christthehavenschool yet:

### In cPanel:
1. Go to "Addon Domains"
2. Add your domain
3. Point to: `/public_html` folder
4. Wait 15-30 minutes for DNS propagation

### Or for Parked Domain:
1. Go to "Parked Domains"  
2. Add domain pointing to public_html

---

## Still Having Issues?

### Check Error Logs
- In cPanel: "Raw Access Logs" or "Error Logs"
- Look for HTTP 404 or 500 errors
- These logs show what's failing

### Contact Support
- LyteHosting Support: support@lytehosting.com
- Include:
  - Domain name
  - Error message screenshot
  - Browser console errors (F12)

---

## Success Indicators ✅

- [ ] Homepage loads at yourdomain.com
- [ ] No 404 errors in console
- [ ] Navigation works (URL changes without reload)
- [ ] Images display correctly
- [ ] Forms work (if you have any)
- [ ] Mobile view is responsive
- [ ] HTTPS/SSL works (green lock icon)

---

**You're ready to deploy! 🚀**

Next: Choose one of the 3 options above and follow the steps.
