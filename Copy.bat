@echo off
setlocal enabledelayedexpansion

REM Comprueba debug ===================
if not exist degub.cfg (
    set debug=n
) else (
    set debug=y
    echo debug activado
)
REM ===================================

echo Haciendo copia de seguridad de los archivos seleccionados en la carpeta de copy

REM Comprueba los archivos de Copy ======================================================
pause

:copy1
if not exist copy1.cfg (
    echo No existe copy1. El orden de los archivos debe ser copy1, copy2. ETC...
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
    goto copy2
)

:copy2
if not exist copy2.cfg (
    set copynum=1
    cls
    goto succesfull
)

set "copy2="
for /f "delims=" %%a in (copy2.cfg) do (
    set "copy2=%%a"
)

if not defined copy2 (
    set copynum=1
    goto succesfull
) else (
    goto succesfull
)

:copy3
if not exist copy3.cfg (
    set copynum=2
    cls
    goto succesfull
)

set "copy3="
for /f "delims=" %%a in (copy3.cfg) do (
    set "copy3=%%a"
)

if not defined copy3 (
    set copynum=2
    goto succesfull
) else (
    set copynum=3
    goto succesfull
)

REM =============================================================================

REM Guarda la ruta en variable y hace copia =================
:succesfull
echo Se hara copias a %copynum% carpetas
pause

if %copynum%==1 (
    for /f "delims=" %%a in (copy1.cfg) do (
        set "copy1rute=%%a"
    )
    goto copyfor1
) 

if %copynum%==2 (
    for /f "delims=" %%a in (copy1.cfg) do (
        set "copy1rute=%%a"
    )

    for /f "delims=" %%a in (copy2.cfg) do (
        set "copy2rute=%%a"
    )
    goto copyfor2
)

if %copynum%==3 (
    for /f "delims=" %%a in (copy1.cfg) do (
        set "copy1rute=%%a"
    )

    for /f "delims=" %%a in (copy2.cfg) do (
        set "copy2rute=%%a"
    )
    
    for /f "delims=" %%a in (copy3.cfg) do (
        set "copy3rute=%%a"
    )
    goto copyfor3
)

echo error
pause
exit /b

REM ================================================
:copyfor1
echo Haciendo la copia de Copy1
pause

REM wa ta heeeeeeeeeeeeeee
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

:copyfor2
echo Haciendo la copia de Copy1 y Copy2
pause

REM wa ta heeeeeeeeeeeeeee
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

echo Copia 1 hecha en "%dest%"

REM wa ta heeeeeeeeeeeeeee
for /f "tokens=2 delims==." %%A in ('wmic os get LocalDateTime /value ^| find "="') do set "ldt=%%A"
set "timestamp=%ldt:~0,8%_%ldt:~8,6%"
set "dest2=%APPDATA%\AutoCopy\Backups\Copy2\%timestamp%"
REM ================================================ todo esto para poner la fecha y hora XD

if not defined copy2rute (
    echo Variable copy2rute no definida.
    goto error
)

if not exist "%copy2rute%" (
    echo La ruta de origen no existe: "%copy2rute%"
    goto error
)

if not exist "%dest%" mkdir "%dest2%"
if exist "%copy2rute%\" (
    xcopy "%copy2rute%\*" "%dest2%\" /E /H /C /I /Y
) else (
    xcopy "%copy2rute%" "%dest2%\" /H /C /I /Y
)

echo Copia 2 hecha en "%dest2%"

pause
goto :eof

:copyfor3
echo Haciendo la copia de Copy1, Copy2 y Copy3
pause

REM wa ta heeeeeeeeeeeeeee
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

echo Copia 1 hecha en "%dest%"

REM wa ta heeeeeeeeeeeeeee
for /f "tokens=2 delims==." %%A in ('wmic os get LocalDateTime /value ^| find "="') do set "ldt=%%A"
set "timestamp=%ldt:~0,8%_%ldt:~8,6%"
set "dest2=%APPDATA%\AutoCopy\Backups\Copy2\%timestamp%"
REM ================================================ todo esto para poner la fecha y hora XD

if not defined copy2rute (
    echo Variable copy2rute no definida.
    goto error
)

if not exist "%copy2rute%" (
    echo La ruta de origen no existe: "%copy2rute%"
    goto error
)

if not exist "%dest%" mkdir "%dest2%"
if exist "%copy2rute%\" (
    xcopy "%copy2rute%\*" "%dest2%\" /E /H /C /I /Y
) else (
    xcopy "%copy2rute%" "%dest2%\" /H /C /I /Y
)

echo Copia 2 hecha en "%dest2%"

REM wa ta heeeeeeeeeeeeeee
for /f "tokens=2 delims==." %%A in ('wmic os get LocalDateTime /value ^| find "="') do set "ldt=%%A"
set "timestamp=%ldt:~0,8%_%ldt:~8,6%"
set "dest=%APPDATA%\AutoCopy\Backups\Copy3\%timestamp%"
REM ================================================ todo esto para poner la fecha y hora XD

if not defined copy3rute (
    echo Variable copy3rute no definida.
    goto error
)

if not exist "%copy3rute%" (
    echo La ruta de origen no existe: "%copy3rute%"
    goto error
)

if not exist "%dest3%" mkdir "%dest3%"
if exist "%copy3rute%\" (
    xcopy "%copy3rute%\*" "%dest3%\" /E /H /C /I /Y
) else (
    xcopy "%copy3rute%" "%dest3%\" /H /C /I /Y
)

echo Copia 3 hecha en "%dest3%"

pause
goto :eof

:error
color c
echo No se puedo hacer una copia de seguridad
exit /b

endlocal


REM hola