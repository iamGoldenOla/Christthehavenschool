#!/bin/bash

# FTP Connection Diagnostic Script
# Run this to test if your FTP credentials work

echo "======================================"
echo "FTP Connection Diagnostic"
echo "======================================"
echo ""

# Get FTP credentials from GitHub Secrets (you'll need to input these manually)
FTP_HOST="${1:-163.61.188.6}"
FTP_USER="${2:-christt2}"
FTP_PASS="${3:-}"
FTP_PORT="${4:-21}"
FTP_DIR="${5:-public_html/}"

echo "Testing FTP connection..."
echo "Host: $FTP_HOST"
echo "Port: $FTP_PORT"
echo "Username: $FTP_USER"
echo "Directory: $FTP_DIR"
echo ""

# Check if lftp is installed
if ! command -v lftp &> /dev/null; then
    echo "❌ lftp not installed. Installing..."
    sudo apt-get update && sudo apt-get install -y lftp
fi

# Test FTP connection
echo "Attempting connection..."
lftp -e "
set ftp:ssl-allow no
set net:max-retries 1
set net:timeout 5
open -u $FTP_USER,$FTP_PASS $FTP_HOST:$FTP_PORT
pwd
ls -la
bye
" 2>&1 | tee ftp-test.log

if grep -q "Error\|failed\|Connection refused" ftp-test.log; then
    echo ""
    echo "❌ FTP Connection FAILED"
    echo ""
    echo "Possible issues:"
    echo "1. Wrong FTP credentials (check in GitHub Secrets)"
    echo "2. FTP server is down"
    echo "3. Firewall blocking port $FTP_PORT"
    echo "4. Wrong directory path"
    exit 1
else
    echo ""
    echo "✅ FTP Connection SUCCESSFUL!"
    echo ""
    echo "Your FTP credentials are working."
    exit 0
fi
