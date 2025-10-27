@echo off
:intro
cls
echo ==================================
echo =          -AutoCopy-            =
echo ==================================
echo "By irongt :)"
pause
cls
:ini
cls
echo ==================================
echo =          -AutoCopy-            =
echo ==================================
echo - 1 Hacer copia de seguridad
echo - 2 Modificar ruta de copias de seguridad
echo - 3 Desactivar/Activar Copias Automaticas
color 17
set /p option="Selecciona una opcion: "

if "%option%"=="1" (
    color 07
    cls
    call CopyEngine.bat
    goto ini
)

if "%option%"=="2" (
    goto modifrute
)

if "%option%"=="3" (
    goto switchcopies
)

echo Opcion invalida
goto ini


:modifrute
echo espere...
cls
echo ==================================
echo =    Modificar Rutas de Copia    =
echo ==================================
set /p copydirtocopy="Escribe la ruta de la carpeta a guardar: "
del /F /Q copy1.cfg
<nul set /p="%copydirtocopy%" > copy1.cfg
if exist copy1.cfg (
    echo Ruta guardada correctamente.
    pause
    goto ini
) else (
    color 47
    echo Error al guardar la ruta.
    pause
    goto ini
)

