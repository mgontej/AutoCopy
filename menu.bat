@echo off
:ini
cls
echo ==================================
echo =          -AutoCopy-            =
echo ==================================
echo - 1 Hacer copia de seguridad
echo - 2 Modificar rutas de copias de seguridad
echo - 3 Desactivar/Activar Copias Automaticas
set /p option="Selecciona una opcion: "

if %copy%=1(
    start copy.bat
    cls
    pause
    goto ini
) else if %copy%=2 (
    goto modifrute
) else if %copy%=3 (
    goto switchcopies
) else (
    echo Opcion invalida
    goto top
)

:modifrute
echo espere...
if exist copy1.cfg (
    set copy1state=    SI
)
if exist copy2.cfg (
    set copy2state=    SI
)
if exist copy3.cfg (
    set copy3state=    SI
)
cls
echo ==================================
echo =          -AutoCopy-            =
echo ==================================
echo =  Nombre === Exsiste? =
echo = copy1.cfg =%copy1state%    =
echo = copy2.cfg =%copy2state%    =
echo = copy3.cfg =%copy3state%    =
set /p option="Selecciona un archivo de copia"
pause
