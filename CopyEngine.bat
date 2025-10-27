@echo off
setlocal enabledelayedexpansion
echo Haciendo copia de seguridad de los archivos seleccionados en copy.cfg

REM Comprueba los archivos de Copy ======================================================
pause

:compcopy
if not exist copy1.cfg (
    echo No existe copy.cfg
    goto error
    cls
)

set "copy1="
for /f "delims=" %%a in (copy1.cfg) do (
    set "copy1=%%a"
)

if not defined copy1 (
    goto error
) else (
    goto confirm
)


REM =========================================================

REM Guarda la ruta en variable y hace copia =================
:confirm
for /f "delims=" %%a in (copy1.cfg) do (
    set "copy1rute=%%a"
)
echo Se hara una copia de seguridad de la ruta: %copy1rute%
pause
goto copy
REM RIM ROM RUM RAM
color 47
echo Ha ocurrido un error al leer los archivos de configuracion.
pause
exit /b

REM ================================================
:copy
echo Haciendo la copia de Copy1
pause

REM Establece la fecha y hora para la carpeta destino
for /f "tokens=2 delims==." %%A in ('wmic os get LocalDateTime /value ^| find "="') do set "ldt=%%A"
set "timestamp=%ldt:~0,8%_%ldt:~8,6%"
set "dest=%APPDATA%\AutoCopy\Backups\Copy1\%timestamp%"
REM ================================================ todo esto para poner la fecha y hora XD

if not defined copy1rute (
    echo Variable copy1rute no definida.
    goto error
)

if not exist "%copy1rute%" (
    echo La ruta de origen no existe: "%copy1rute%"
    goto error
)

if not exist "%dest%" mkdir "%dest%"
if exist "%copy1rute%\" (
    xcopy "%copy1rute%\*" "%dest%\" /E /H /C /I /Y
) else (
    xcopy "%copy1rute%" "%dest%\" /H /C /I /Y
)

echo Copia hecha en "%dest%"
pause
goto :eof

REM ================================================

:error
color c
echo No se puedo hacer una copia de seguridad
exit /b

endlocal

















REM adios