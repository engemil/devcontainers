@echo off

REM Start Container


REM Change directory
cd ..\docker_files

echo Starting container...

REM Start our container development environmente
docker compose -f docker-compose-from-hub.yml up -d
echo Container is now up and running!
echo.

REM Prompt the user to type "yes" or "no"
:prompt
set /p input="Do you want to prompt into the container? Type [Y/N]: "

REM Convert the input to lowercase for case-insensitive comparison
set "lowercaseInput=%input:~0,1%"
if /i "%lowercaseInput%"=="y" (
    echo Entering the container...
    echo.
    docker compose exec -it devenv /bin/bash
) else if /i "%lowercaseInput%"=="n" (
    echo Container continues to run in the background.
    echo.
) else (
    echo Invalid input. Please type 'Y' or 'N'.
    goto prompt
)