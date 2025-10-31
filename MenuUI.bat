@echo off
setlocal enabledelayedexpansion
echo Esperando una senal de la UI
start autocopy-ui\autocopy-ui.exe
:waitsignal
if exist autocopy-ui\resources\go.temp (
    call CopyEngine.bat
    taskkill /F /IM autocopy-ui.exe
    del autocopy-ui\resources\go.temp
    exit
) 

timeout /t 3 /nobreak >nul
goto waitsignal



:readsignal

