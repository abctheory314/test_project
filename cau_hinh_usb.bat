@echo off
title Kiem Tra Cau Hinh Laptop
color 0A
echo ===================================================
echo         THONG TIN CAU HINH LAPTOP CUA BAN
echo ===================================================
echo.

echo [1] Ten may tinh va He dieu hanh:
hostname
wmic os get Caption,OSArchitecture /value | findstr "="
echo ---------------------------------------------------

echo [2] Thong tin Chip (CPU):
wmic cpu get Name /value | findstr "="
echo ---------------------------------------------------

echo [3] Dung luong RAM:
wmic computersystem get TotalPhysicalMemory /value | findstr "="
echo (Luu y: Don vi Byte, hay chia cho 1073741824 de ra GB)
echo ---------------------------------------------------

echo [4] Thong tin o cung:
wmic diskdrive get Model,Size /value | findstr "="
echo ---------------------------------------------------

echo Tác vu hoan thanh!
pause