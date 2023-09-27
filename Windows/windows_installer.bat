@echo off
:: Überprüfen, ob das Skript mit Administratorrechten ausgeführt wird
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" || (
    echo Dieses Skript erfordert Administratorrechte. Bitte starte das Skript mit Administratorrechten!
    pause
    goto :eof
)

setlocal

set "downloadUrl=https://github.com/Miquest/ohg_auto_login/archive/main.zip"
set "extractedFolderPath=ohg_login_windows"
set "savePath=ohg_auto_download.zip"
set "installDirectory=C:\scripts\ohg_auto_login"
set "startupDirectory=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

set "programExecutable=ohg-script-daemon.exe"

echo Programmdateien werden heruntergeladen...

powershell -command "Invoke-WebRequest -Uri '%downloadUrl%' -OutFile '%savePath%'"

:: Überprüfen, ob der Download erfolgreich war
if exist "%savePath%" (
    echo Download der Programmdateien erfolgreich!
    
    :: Entzippen des ZIP-Archivs
    powershell -command "Expand-Archive -Path '%savePath%' -DestinationPath '%extractedFolderPath%'"
    
    :: Überprüfen, ob die Dateien entpackt wurden
    if exist "%extractedFolderPath%" (

        echo Entpacken der Dateien erfolgreich! Installation wird gestartet.
        
        echo Die Dateien werden in den Installationsordner verschoben...
        rmdir /s /q "ohg_login_windows\ohg_auto_login-main\Linux"
        
        mkdir "%installDirectory%"
        
        :: Überprüfen, ob das Installationsverzeichnis erstellt wurde
        if exist "%installDirectory%" (
            echo Installationsordner wurde erstellt! Verschiebe die Dateien in das Installationsverzeichnis...
            
            xcopy /s /e /i "ohg_login_windows\ohg_auto_login-main\Windows\Package\*" "%installDirectory%"
            
            :: Kopieren der Verknüpfung zum Programm in den Startup-Ordner
	    xcopy /s /e /i "%installDirectory%\ohg_auto_login_startup.lnk" "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
        
        mkdir "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OHG Login"
		xcopy /s /e /i "%installDirectory%\OHG Login Einstellungen.lnk" "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OHG Login\"
        rmdir /s /q "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\_internal"

        ) else (
            echo Erstellen des Installationsverzeichnisses fehlgeschlagen!
        )
    ) else (
        echo Entpacken fehlgeschlagen.
    )
) else (
    echo Download fehlgeschlagen.
)

:: Entfernen der temporären Dateien und Ordner
rmdir /s /q "ohg_login_windows"
del "%savePath%"

echo Das Programm wurde in 'C:\scripts\ohg_auto_login' installiert und zur automatischen Ausführung im Startup-Ordner hinzugefügt.
echo Zum Starten, bitte das Programm "login-script-daemon.exe" im Installationsverzeichnis ("C:\scripts\ohg_auto_login") ausfuehren.
echo Vergiss nicht, die config.json im Installationsverzeichnis zu bearbeiten, damit die Login Prozedur ablaeuft wie gewuenscht.
echo Bei Fehlern, schau dir die .log Datei im Installationsverzeichnis an.
echo Drücke die Enter-Taste, um deine Login Daten zu konfigurieren!
pause
./"C:\scripts\ohg_auto_login\windows_actions.exe"

