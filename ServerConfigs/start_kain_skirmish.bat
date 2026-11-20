@echo off
setlocal enableextensions
chcp 65001 >nul
title KAIN SKIRMISH - Native Dedicated Server

set "PORT=7210"
set "CONFIG_FILE=kain_skirmish.txt"

set "SERVER_ROOT="
if exist "%~dp0bin\Win64_Shipping_Server\DedicatedCustomServer.Starter.exe" set "SERVER_ROOT=%~dp0"
if not defined SERVER_ROOT if exist "%~dp0..\bin\Win64_Shipping_Server\DedicatedCustomServer.Starter.exe" set "SERVER_ROOT=%~dp0..\"
if not defined SERVER_ROOT (
    echo [ОШИБКА] Не найден DedicatedCustomServer.Starter.exe в bin\Win64_Shipping_Server\.
    echo Скопируйте батник в корень выделенного сервера или папку ServerConfigs рядом с ним.
    pause
    exit /b 1
)

set "AUTH_TOKEN="
set "TOKEN_FILE="
if exist "%~dp0DedicatedCustomServerAuthToken.txt" set "TOKEN_FILE=%~dp0DedicatedCustomServerAuthToken.txt"
if not defined TOKEN_FILE if exist "%SERVER_ROOT%DedicatedCustomServerAuthToken.txt" set "TOKEN_FILE=%SERVER_ROOT%DedicatedCustomServerAuthToken.txt"
if not defined TOKEN_FILE if exist "%USERPROFILE%\Documents\Mount and Blade II Bannerlord\Tokens\DedicatedCustomServerAuthToken.txt" set "TOKEN_FILE=%USERPROFILE%\Documents\Mount and Blade II Bannerlord\Tokens\DedicatedCustomServerAuthToken.txt"

if defined TOKEN_FILE (
    for /f "usebackq delims=" %%A in ("%TOKEN_FILE%") do set "AUTH_TOKEN=%%A"
)

if not defined AUTH_TOKEN (
    echo [ОШИБКА] Не найден непустой токен DedicatedCustomServerAuthToken.txt!
    echo Положите файл DedicatedCustomServerAuthToken.txt рядом с батником или в:
    echo   "%USERPROFILE%\Documents\Mount and Blade II Bannerlord\Tokens\DedicatedCustomServerAuthToken.txt"
    pause
    exit /b 1
)

if not exist "%SERVER_ROOT%Modules\Native\%CONFIG_FILE%" (
    if exist "%~dp0%CONFIG_FILE%" (
        echo Копирование %CONFIG_FILE% в "%SERVER_ROOT%Modules\Native\"...
        copy /y "%~dp0%CONFIG_FILE%" "%SERVER_ROOT%Modules\Native\%CONFIG_FILE%" >nul
    )
)
if not exist "%SERVER_ROOT%Modules\Native\%CONFIG_FILE%" (
    echo [ОШИБКА] Не найден конфиг "%SERVER_ROOT%Modules\Native\%CONFIG_FILE%".
    pause
    exit /b 1
)

cd /d "%SERVER_ROOT%bin\Win64_Shipping_Server"

:loop
echo [%date% %time%] Запуск сервера KAIN SKIRMISH (порт %PORT%)...
DedicatedCustomServer.Starter.exe _MODULES_*Native*Multiplayer*_MODULES_ /port %PORT% /dedicatedcustomserverconfigfile %CONFIG_FILE% /dedicatedcustomserverauthtoken "%AUTH_TOKEN%"

echo [%date% %time%] Сервер остановился. Перезапуск через 5 секунд...
timeout /t 5 /nobreak >nul
goto loop
