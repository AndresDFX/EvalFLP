@echo off

::STEP 1. Copy archives of tree a actual directory
setlocal enableextensions disabledelayedexpansion
set "rarCmd=%programFiles%\WinRAR\WinRAR.exe"
for /r "%cd%" %%a in (*.zip) do "%rarCmd%" x -or -y "%%~fa" * "%~dp0%%~na"
endlocal

::STEP 2. Create file with names archives *.rkt
for %%i in (*.rkt) do (
	echo include("%%i"^)>> list_groups.txt 
	)

echo Archivo .txt creado correctamente
exit
