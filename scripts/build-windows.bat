@echo off
setlocal
cd /d "%~dp0\.."

call gradlew.bat clean test createDistributable
if errorlevel 1 exit /b %errorlevel%

set "PORTABLE=build\compose\binaries\main\app\MonitorDeNoticias"
if not exist "%PORTABLE%\MonitorDeNoticias.exe" (
  echo ERRO: executavel portable nao encontrado.
  exit /b 1
)
if not exist "%PORTABLE%\runtime\bin\server\jvm.dll" (
  echo ERRO: runtime JVM incompleto.
  exit /b 1
)

if not exist "%PORTABLE%\data\preferences" mkdir "%PORTABLE%\data\preferences"
if not exist "%PORTABLE%\logs" mkdir "%PORTABLE%\logs"

echo.
echo Build Portable concluido:
echo %PORTABLE%
echo Execute MonitorDeNoticias.exe mantendo app e runtime na mesma pasta.
endlocal
