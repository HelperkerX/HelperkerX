@echo off
setlocal

REM Definir el URL de descarga del repositorio
set REPO_URL=https://github.com/HelperkerX/HelperkerX_Blog/archive/refs/heads/main.zip

REM Definir la carpeta destino donde se descargará y extraerá el repositorio
set DEST_DIR=%cd%\HelperkerX_Blog

REM Comprobar si la carpeta existe y eliminarla si es así
if exist "%DEST_DIR%" (
    echo Eliminando la carpeta existente "%DEST_DIR%"...
    rmdir /s /q "%DEST_DIR%"
)

REM Descargar el archivo .zip del repositorio
echo Descargando el repositorio desde %REPO_URL%...
powershell -Command "Invoke-WebRequest -Uri %REPO_URL% -OutFile repo.zip"

REM Verificar si la descarga fue exitosa
if not exist repo.zip (
    echo Error al descargar el repositorio.
    pause
    exit /b
)

REM Extraer el archivo .zip en la misma carpeta destino
echo Extrayendo el repositorio...
powershell -Command "Expand-Archive -Path 'repo.zip' -DestinationPath '%cd%' -Force"

REM Eliminar el archivo .zip después de la extracción
del repo.zip

REM Renombrar la carpeta extraída a "HelperkerX_Blog" (si es necesario)
if exist "%cd%\HelperkerX_Blog-main" (
    echo Renombrando la carpeta a "HelperkerX_Blog"...
    ren "%cd%\HelperkerX_Blog-main" "HelperkerX_Blog"
)

echo Repositorio actualizado en la carpeta "%DEST_DIR%".
pause
