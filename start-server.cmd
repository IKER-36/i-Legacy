@echo off

echo Abriendo el servidor...
timeout 2 > NUL
C:\dlls\FXServer.exe +exec E:\FiveM\i-Legacy\i-Legacy\server.cfg +set onesync on 1
