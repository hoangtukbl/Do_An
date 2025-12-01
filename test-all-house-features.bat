@echo off
chcp 65001 > nul
echo ========================================
echo COMPREHENSIVE HOUSE MANAGEMENT TESTS
echo ========================================
echo.
echo Test suite nay se chay tat ca cac test tu dong:
echo 1. Backend API Tests (House Management)
echo 2. Backend API Tests (Image Management)
echo 3. Frontend UI Tests (Manual in Browser)
echo.
echo ========================================
echo.

echo [STEP 1/3] Running Backend API Tests - House Management...
echo.
call test-house-management.bat
echo.
echo ========================================
echo.

echo [STEP 2/3] Running Backend API Tests - Image Management...
echo.
call test-house-images.bat
echo.
echo ========================================
echo.

echo [STEP 3/3] Opening Frontend UI for Manual Testing...
echo.
call test-house-ui.bat
echo.
echo ========================================
echo.

echo TAT CA TEST DA HOAN THANH!
echo.
echo TONG KET:
echo - Backend API: Xem cac file test_result_*_formatted.json
echo - Frontend UI: Da mo trinh duyet de test thu cong
echo.
echo TIEP THEO:
echo 1. Kiem tra cac ket qua test trong cac file JSON
echo 2. Thu cac chuc nang tren giao dien web
echo 3. Bao cao bat ky loi nao neu phat hien
echo.
pause
