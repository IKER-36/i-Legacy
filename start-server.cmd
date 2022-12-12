@echo off

echo Abriendo el servidor...
timeout 2 > NUL
C:\dlls\FXServer.exe +exec E:\FiveM\iker-legacy\server.cfg +set onesync on 1
