@echo off

echo Abriendo el servidor...
timeout 2 > NUL
C:\dlls\FXServer.exe +exec PUTYOURPATH\server.cfg +set onesync on 1
