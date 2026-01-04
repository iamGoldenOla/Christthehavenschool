#!/usr/bin/env python3
"""
FTP Deploy Script for Christ The Haven School
Uploads dist folder to cPanel via FTP
"""

import ftplib
import os
from pathlib import Path

# FTP Configuration
FTP_HOST = "163.61.188.6"
FTP_USER = "christt2"
FTP_PASSWORD = input("Enter FTP password: ")
FTP_DIR = "public_html"

def upload_directory(ftp, local_path, remote_path=""):
    """Recursively upload directory to FTP server"""
    
    local_path = Path(local_path)
    
    if not local_path.exists():
        print(f"❌ Directory not found: {local_path}")
        return False
    
    print(f"📁 Uploading from: {local_path}")
    
    try:
        for item in local_path.rglob("*"):
            if item.is_file():
                relative_path = item.relative_to(local_path)
                remote_file_path = f"{remote_path}/{str(relative_path).replace(chr(92), '/')}"
                
                # Create remote directories if needed
                remote_dir = str(Path(remote_file_path).parent).replace(chr(92), '/')
                if remote_dir and remote_dir != ".":
                    try:
                        ftp.mkd(remote_dir)
                    except ftplib.all_errors as e:
                        if "exist" not in str(e):
                            print(f"⚠️  Could not create dir {remote_dir}: {e}")
                
                # Upload file
                with open(item, 'rb') as f:
                    ftp.storbinary(f'STOR {remote_file_path}', f)
                    print(f"✅ Uploaded: {remote_file_path}")
        
        return True
    
    except Exception as e:
        print(f"❌ Error uploading: {e}")
        return False

def main():
    try:
        print("🔗 Connecting to FTP server...")
        ftp = ftplib.FTP(FTP_HOST, FTP_USER, FTP_PASSWORD)
        ftp.set_pasv(True)
        print("✅ Connected!")
        
        # Change to public_html
        print(f"\n📂 Changing to directory: {FTP_DIR}")
        ftp.cwd(FTP_DIR)
        
        # Upload dist folder
        print("\n📤 Starting upload...")
        dist_path = Path("dist")
        
        if upload_directory(ftp, dist_path, ""):
            print("\n✅ Deployment successful!")
            print("🌐 Site will be updated at: https://christthehavenschool.com")
        else:
            print("\n❌ Deployment failed!")
        
        ftp.quit()
        
    except ftplib.all_errors as e:
        print(f"❌ FTP Error: {e}")
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main()
