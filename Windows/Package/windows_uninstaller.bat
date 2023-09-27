@echo off
:: Überprüfen, ob das Skript mit Administratorrechten ausgeführt wird
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" || (
    echo Die Deinstallation dieses Skripts erfordert Administratorrechte! Bitte starte es mit Administratorrechten!
    pause
    goto :eof
)

echo "Deinstalliere ohg_auto_login und alle seine Komponenten..."
del "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ohg_auto_login_startup.lnk"
del "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OHG Login\OHG Login Einstellungen.lnk"

echo Deinstallation erfolgreich! Enter zum beenden!
pause
rmdir /s /q "C:\scripts\"
