#!/bin/bash
# Verification script for Christ The Haven School deployment

echo "================================"
echo "🔍 DEPLOYMENT VERIFICATION SCRIPT"
echo "================================"
echo ""

# Check 1: Verify source index.html has correct title
echo "✓ Checking source index.html title..."
if grep -q '<title>Christ The Haven School</title>' index.html; then
    echo "  ✅ Source title is correct"
else
    echo "  ❌ Source title is incorrect"
fi

# Check 2: Verify dist/index.html exists and has correct title
echo ""
echo "✓ Checking dist/index.html..."
if [ -f dist/index.html ]; then
    if grep -q '<title>Christ The Haven School</title>' dist/index.html; then
        echo "  ✅ Dist index.html has correct title"
    else
        echo "  ❌ Dist index.html title is incorrect"
    fi
else
    echo "  ❌ dist/index.html not found"
fi

# Check 3: Verify dist folder size
echo ""
echo "✓ Checking dist folder..."
DIST_SIZE=$(du -sh dist 2>/dev/null | awk '{print $1}')
if [ ! -z "$DIST_SIZE" ]; then
    echo "  ✅ dist/ folder size: $DIST_SIZE"
else
    echo "  ❌ dist/ folder not found"
fi

# Check 4: Verify .github/workflows/deploy.yml exists
echo ""
echo "✓ Checking GitHub workflow..."
if [ -f .github/workflows/deploy.yml ]; then
    echo "  ✅ deploy.yml exists"
else
    echo "  ❌ deploy.yml not found"
fi

# Check 5: Verify git main branch latest commit
echo ""
echo "✓ Checking git status..."
LAST_COMMIT=$(git log -1 --pretty=%B | head -1)
echo "  Latest commit: $LAST_COMMIT"

# Check 6: Count files to upload
echo ""
echo "✓ Counting files for upload..."
FILE_COUNT=$(find dist -type f | wc -l)
echo "  Total files: $FILE_COUNT"

# Check 7: Summary
echo ""
echo "================================"
echo "📋 SUMMARY"
echo "================================"
echo "✅ Build output ready: $([ -d dist ] && echo 'YES' || echo 'NO')"
echo "✅ GitHub workflow configured: $([ -f .github/workflows/deploy.yml ] && echo 'YES' || echo 'NO')"
echo "✅ Latest code on main: $LAST_COMMIT"
echo ""
echo "🚀 NEXT STEP: Verify GitHub Secrets are set:"
echo "   Go to: https://github.com/iamGoldenOla/christthehavenschool/settings/secrets/actions"
echo "   Required: FTP_HOST, FTP_USERNAME, FTP_PASSWORD, FTP_PORT, FTP_DIR"
echo ""
echo "📍 Then trigger deployment from:"
echo "   https://github.com/iamGoldenOla/christthehavenschool/actions"
echo ""
