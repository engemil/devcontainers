@echo off


echo.
echo ================================================================================
echo Directory Check
echo ================================================================================
echo.

echo Checking the current directory...
echo.

REM Check if current directory is "script_files"
REM Get the current directory path
set "currentDir=%CD%"
REM Extract the last component of the current directory path (the folder name)
for %%A in ("%currentDir%") do set "currentFolder=%%~nxA"
REM Check if the current folder name is "script_files"
if /I "%currentFolder%" EQU "script_files" (
    REM echo Current directory is "script_files"
    echo Already in correct directory, "script_files".
) else (
    REM echo Current directory is not "script_files"
    
    cd script_files

    REM Check if the directory change was successful
    if %errorlevel% neq 0 (
        echo Failed to change directory to "script_files".
        exit /b 1
    ) else (
        echo Successfully changed directory to "script_files".
    )
    
)


echo.
echo ================================================================================
echo Running windows-start-docker.bat
echo ================================================================================
echo.

call windows-start-docker.bat

echo.
echo ================================================================================
echo Running windows-install-usbipd.bat
echo ================================================================================
echo.

call windows-install-usbipd.bat

echo.
echo ================================================================================
echo Running windows-usbipd-usb-to-wsl.bat
echo ================================================================================
echo.

call windows-usbipd-usb-to-wsl.bat


goto skip_windows_start_container
REM Instead spin up from a devcontainer

echo.
echo ================================================================================
echo Running windows-start-container.bat
echo ================================================================================
echo.

call windows-start-container.bat

:skip_windows_start_container


