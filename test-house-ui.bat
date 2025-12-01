@echo off
chcp 65001 > nul
echo ========================================
echo TEST FRONTEND HOUSE MANAGEMENT UI
echo ========================================
echo.
echo Test nay se mo giao dien quan ly nha trong trinh duyet.
echo Ban co the thu cac chuc nang:
echo.
echo 1. XEM DANH SACH NHA:
echo    - Xem tat ca nha
echo    - Loc theo trang thai duyet (Tat ca / Cho duyet / Da duyet / Tu choi)
echo    - Phan trang
echo.
echo 2. TIM KIEM VA LOC NANG CAO:
echo    - Tim kiem theo tieu de, dia chi, ID
echo    - Loc theo khoang gia
echo    - Loc theo dien tich
echo    - Loc theo trang thai nha (Con trong / Da ban / Da cho thue)
echo    - Xoa bo loc
echo.
echo 3. QUAN LY NHA:
echo    - Xem chi tiet nha
echo    - Chinh sua thong tin nha
echo    - Duyet nha
echo    - Tu choi nha (co ly do)
echo    - Xoa nha
echo.
echo 4. QUAN LY HINH ANH:
echo    - Xem gallery hinh anh
echo    - Xoa hinh anh (hover vao hinh)
echo    - Dat hinh cover (hover vao hinh)
echo.
echo 5. QUAN LY TRANG THAI:
echo    - Doi nhanh trang thai: Con trong / Da ban / Da cho thue
echo    - Cap nhat tu dong khi thay doi
echo.
echo ========================================
echo.

REM Check if servers are running
echo Dang kiem tra trang thai server...
powershell -Command "$beRunning = Test-NetConnection -ComputerName localhost -Port 3001 -InformationLevel Quiet -WarningAction SilentlyContinue; $feRunning = Test-NetConnection -ComputerName localhost -Port 5173 -InformationLevel Quiet -WarningAction SilentlyContinue; if(-not $beRunning) { Write-Host '[ERROR] Backend server khong chay (port 3001)' -ForegroundColor Red; exit 1 } if(-not $feRunning) { Write-Host '[ERROR] Frontend server khong chay (port 5173)' -ForegroundColor Red; exit 1 } Write-Host '[SUCCESS] Ca hai server dang chay binh thuong!' -ForegroundColor Green"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Vui long khoi dong server truoc:
    echo   - Backend: cd BE ^&^& node app.js
    echo   - Frontend: cd FE ^&^& npm run dev
    echo.
    pause
    exit /b 1
)

echo.
echo Dang mo trinh duyet...
echo.
echo URL: http://localhost:5173/admin/houses
echo.
echo THONG TIN DANG NHAP:
echo - Email: admin@example.com
echo - Password: admin123
echo.
echo Neu chua dang nhap, ban se bi chuyen huong den trang login.
echo Sau khi dang nhap, quay lai URL tren de test chuc nang.
echo.

start http://localhost:5173/admin/houses

echo.
echo Trinh duyet da duoc mo!
echo Hay thu cac chuc nang duoc liet ke o tren.
echo.
echo An phim bat ky de dong cua so nay...
pause > nul
