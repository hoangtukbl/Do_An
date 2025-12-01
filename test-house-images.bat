@echo off
chcp 65001 > nul
echo ========================================
echo TEST HOUSE IMAGE MANAGEMENT
echo ========================================
echo.

REM Get admin token first
echo [1/5] Dang dang nhap voi tai khoan Admin...
curl -s -X POST http://localhost:3001/api/auth/login ^
  -H "Content-Type: application/json" ^
  -d "{\"Email\":\"admin@example.com\",\"Password\":\"admin123\"}" > temp_login.json

powershell -Command "$json = Get-Content temp_login.json | ConvertFrom-Json; $json.token" > temp_token.txt
set /p TOKEN=<temp_token.txt
del temp_login.json temp_token.txt

if "%TOKEN%"=="" (
    echo [ERROR] Khong the dang nhap. Kiem tra lai thong tin tai khoan admin.
    pause
    exit /b 1
)

echo [SUCCESS] Da dang nhap thanh cong!
echo.

REM Get a house with images
echo [2/5] Test: Lay thong tin nha co hinh anh...
curl -s -X GET "http://localhost:3001/api/admin/houses?page=1&pageSize=10" ^
  -H "Authorization: Bearer %TOKEN%" > temp_houses.json

powershell -Command "$json = Get-Content temp_houses.json | ConvertFrom-Json; $houseWithImages = $json.data | Where-Object { $_.Images -and $_.Images.Count -gt 0 } | Select-Object -First 1; if($houseWithImages) { $houseWithImages.HouseID } else { 'NONE' }" > temp_houseid.txt
set /p HOUSE_ID=<temp_houseid.txt
del temp_houseid.txt temp_houses.json

if "%HOUSE_ID%"=="NONE" (
    echo [WARNING] Khong co nha nao co hinh anh trong database.
    echo Vui long them hinh anh cho mot so nha truoc khi test chuc nang nay.
    echo.
    pause
    exit /b 0
)

echo [SUCCESS] Tim thay nha co hinh anh: ID=%HOUSE_ID%
echo.

REM Get house detail with images
echo [3/5] Test: Lay chi tiet nha va danh sach hinh anh...
curl -s -X GET "http://localhost:3001/api/admin/houses/%HOUSE_ID%" ^
  -H "Authorization: Bearer %TOKEN%" > test_image_result_1.json
powershell -Command "Get-Content test_image_result_1.json | ConvertFrom-Json | ConvertTo-Json -Depth 5" > test_image_result_1_formatted.json
echo [SUCCESS] Ket qua: test_image_result_1_formatted.json
echo.

REM Get first non-cover image ID
powershell -Command "$json = Get-Content test_image_result_1.json | ConvertFrom-Json; $nonCoverImage = $json.data.Images | Where-Object { $_.IsCover -eq 0 } | Select-Object -First 1; if($nonCoverImage) { $nonCoverImage.ImageID } else { 'NONE' }" > temp_imageid.txt
set /p IMAGE_ID=<temp_imageid.txt
del temp_imageid.txt

if "%IMAGE_ID%"=="NONE" (
    echo [INFO] Nha nay chi co mot hinh cover. Skip test set cover.
    goto skip_set_cover
)

REM Test 4: Set cover image
echo [4/5] Test: Dat hinh anh lam cover ImageID=%IMAGE_ID%...
curl -s -X PUT "http://localhost:3001/api/admin/houses/%HOUSE_ID%/images/%IMAGE_ID%/set-cover" ^
  -H "Authorization: Bearer %TOKEN%" > test_image_result_2.json
powershell -Command "Get-Content test_image_result_2.json | ConvertFrom-Json | ConvertTo-Json" > test_image_result_2_formatted.json
echo [SUCCESS] Ket qua: test_image_result_2_formatted.json
echo.

:skip_set_cover

REM Get another image to delete
powershell -Command "$json = Get-Content test_image_result_1.json | ConvertFrom-Json; $imageToDelete = $json.data.Images | Where-Object { $_.IsCover -eq 0 } | Select-Object -Last 1; if($imageToDelete) { $imageToDelete.ImageID } else { 'NONE' }" > temp_imageid2.txt
set /p IMAGE_ID_DELETE=<temp_imageid2.txt
del temp_imageid2.txt

if "%IMAGE_ID_DELETE%"=="NONE" (
    echo [INFO] Khong co hinh anh nao khac de xoa (chi con cover image).
    echo Test xoa hinh anh se bi bo qua.
    goto skip_delete
)

REM Test 5: Delete image
echo [5/5] Test: Xoa hinh anh ImageID=%IMAGE_ID_DELETE%...
curl -s -X DELETE "http://localhost:3001/api/admin/houses/%HOUSE_ID%/images/%IMAGE_ID_DELETE%" ^
  -H "Authorization: Bearer %TOKEN%" > test_image_result_3.json
powershell -Command "Get-Content test_image_result_3.json | ConvertFrom-Json | ConvertTo-Json" > test_image_result_3_formatted.json
echo [SUCCESS] Ket qua: test_image_result_3_formatted.json
echo.

:skip_delete

echo ========================================
echo TAT CA TEST IMAGE DA HOAN THANH!
echo ========================================
echo.
echo Ket qua da duoc luu vao cac file:
echo - test_image_result_1_formatted.json (Chi tiet nha + hinh anh)
echo - test_image_result_2_formatted.json (Dat hinh cover)
echo - test_image_result_3_formatted.json (Xoa hinh anh)
echo.
echo Luu y: Mot so test co the bi bo qua neu khong co du hinh anh.
echo.
pause
