@echo off
set IDF_PATH=C:\Users\User\esp\v5.5-rc1\esp-idf
set PYTHON=C:\Users\User\.espressif\python_env\idf5.5_py3.12_env\Scripts\python.exe
set PATH=C:\Users\User\.espressif\tools\cmake\3.30.2\bin;C:\Users\User\.espressif\tools\ninja\1.12.1;C:\Users\User\.espressif\tools\xtensa-esp-elf\esp-14.2.0_20241119\xtensa-esp-elf\bin;C:\Users\User\.espressif\python_env\idf5.5_py3.12_env\Scripts;%PATH%
set IDF_TOOLS_PATH=C:\Users\User\.espressif
set ESP_IDF_VERSION=5.5

cd /d C:\Users\User\OneDrive\ESPS3_cam\esps3_cam
echo Building firmware...
%PYTHON% %IDF_PATH%\tools\idf.py build
if %ERRORLEVEL% neq 0 (
    echo BUILD FAILED
    pause
    exit /b 1
)
echo Build successful! Flashing...
%PYTHON% %IDF_PATH%\tools\idf.py flash monitor
