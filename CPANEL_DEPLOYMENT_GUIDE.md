# cPanel Deployment Guide - christthehavenschool

## Summary of Issues Fixed ✅

1. **Merge Conflict Markers** - Resolved in:
   - `src/components/home/UpcomingEvents.tsx`
   - `src/components/home/TeamPreview.tsx`
   - `src/components/home/FeaturesSection.tsx`
   - `package-lock.json`

2. **Dependencies** - Regenerated package-lock.json

3. **Build Verification** - Successfully compiled both frontend and backend

---

## Project Structure

```
christthehavenschool/
├── Frontend (React + Vite)
│   ├── src/           # React source code
│   ├── dist/          # Built files (ready for cPanel)
│   ├── package.json
│   └── vite.config.ts
│
├── Backend (Node.js)
│   ├── src/
│   ├── package.json
│   └── tsconfig.json
```

---

## Deployment Steps

### **Step 1: Prepare the ZIP File**

The `dist/` folder contains the production-ready frontend (already built).

```bash
# If you need to rebuild:
npm run build
```

### **Step 2: Upload to cPanel**

#### Option A: Upload via cPanel File Manager
1. Log in to your cPanel account at `lytehosting.com`
2. Navigate to **File Manager**
3. Go to **public_html** directory
4. Extract the contents of `dist/` into `public_html/`

#### Option B: Upload via cPanel Uploading a ZIP
1. Go to **File Manager** → **public_html**
2. Click **Upload**
3. Upload the **dist.zip** (contents of dist folder)
4. Right-click and **Extract**
5. Move all files to the root of `public_html`

#### Option C: Use Git Deployment (Recommended)
1. In cPanel, go to **Git Version Control**
2. Clone your repository:
   ```
   Repository: https://github.com/iamGoldenOla/christthehavenschool
   Branch: main
   ```
3. After cloning, run:
   ```bash
   npm install
   npm run build
   ```
4. Point your domain to the `dist` folder

### **Step 3: Configure Your Domain**

1. Go to **Addon Domains** or **Parked Domains**
2. Point your domain to the public_html folder (or `dist` subfolder if using Step 2C)
3. Wait for DNS propagation (usually 15-30 minutes)

### **Step 4: Setup .htaccess for React Router** (IMPORTANT)

Create a `.htaccess` file in your `public_html` directory:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  
  # Don't rewrite files or directories
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  
  # Rewrite to index.html for SPA routing
  RewriteRule ^ index.html [QSA,L]
</IfModule>
```

This ensures all routes are handled by React Router instead of looking for physical files.

### **Step 5: Backend Setup (If Using API)**

If your site needs the backend API:

1. **Option A: Use Shared Hosting**
   - Upload backend files via FTP
   - Use Node.js selector in cPanel to set up your app
   - Create an `.env` file with database credentials

2. **Option B: Separate Server**
   - Deploy backend to a Node.js hosting service
   - Update frontend API calls to point to your backend domain/API endpoint

---

## File Structure for cPanel Upload

Your ZIP file should contain:

```
dist/
├── index.html
├── assets/
│   ├── *.js (built JavaScript files)
│   └── *.css (compiled CSS files)
├── robots.txt
└── .htaccess (optional, create in cPanel)
```

---

## Troubleshooting

### **"Cannot GET /" Error**
- **Solution**: Add the `.htaccess` file from Step 4

### **Blank Page / 404 Errors**
- Check browser console for errors (F12 → Console)
- Verify all assets are loading correctly
- Check domain is pointing to correct folder

### **Images Not Loading**
- Ensure image paths are relative
- Check `src/assets/` are included in `dist/`

### **CSS/JS Not Loading**
- Clear browser cache (Ctrl + Shift + Delete)
- Check if assets have correct MIME types in cPanel

### **Backend API Not Working**
- Verify CORS is enabled in backend
- Check environment variables are set correctly
- Use browser DevTools to see API response

---

## Building the ZIP File

### On Windows:
```bash
cd dist
# Select all files
# Right-click → Send to → Compressed (zipped) folder
# Name it "dist.zip"
```

Or use 7-Zip/WinRAR to create the archive.

### Using Command Line:
```bash
# Make sure you're in the project root
npm run build
# Create ZIP of dist folder
# (Use your preferred compression tool)
```

---

## Key Environment Files

Make sure these are properly configured:

**Frontend (`.env` if needed):**
```
VITE_API_URL=https://yourdomain.com/api
```

**Backend (`.env` in backend folder):**
```
DATABASE_URL=your_database_url
JWT_SECRET=your_secret_key
NODE_ENV=production
```

---

## Post-Deployment Checklist

- [ ] Domain is accessible
- [ ] All pages load without 404 errors
- [ ] Navigation works (React Router functioning)
- [ ] Images display correctly
- [ ] Forms submit properly
- [ ] No console errors (F12)
- [ ] Mobile responsive design works
- [ ] SSL/HTTPS is enabled (cPanel auto-setup)

---

## Support

- **GitHub**: https://github.com/iamGoldenOla/christthehavenschool
- **cPanel Support**: Contact LyteHosting support
- **Domain**: lytehosting.com

---

## Notes

✅ All merge conflicts have been resolved
✅ Code builds successfully
✅ Ready for deployment

Last Updated: January 4, 2026
