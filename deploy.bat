@echo off
REM FTP Deployment Script for Christ The Haven School
REM This script uploads the dist folder to cPanel via FTP

setlocal enabledelayedexpansion
cd /d "c:\Users\Akinola Olujobi\Documents\Christthehavenschool"

REM Create FTP script
(
  echo open 163.61.188.6 21
  echo christt2
  echo YOUR_FTP_PASSWORD_HERE
  echo cd public_html
  echo mput dist\*.html
  echo cd assets
  echo mput dist\assets\*
  echo quit
) > ftp_upload.txt

REM Execute FTP
ftp -s:ftp_upload.txt

REM Clean up
del ftp_upload.txt

echo Deployment complete!
pause
