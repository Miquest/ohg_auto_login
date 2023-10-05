# Automatischer WIFI Login

Dieses kleine Programm soll den WLAN Zugang im Otto-Hahn-Gymnasium Göttingen erleichtern.
Es wird alle 30 Sekunden ein Ping zu den Google Servern gesendet. Schlägt dieser fehl, wird der Authentifizierungsprozess automatisch aufgerufen. Die maximale Zeit ohne Internet beträgt also 30 Sekunden.

## Installation

#### Linux
Lade dir aus den Releases die Datei "linux_setup.sh" herunter. Gehe in den entsprechenden Ordner und öffne ein Terminal. 
Nun musst du folgenden Befehl eingeben: "sudo bash ./linux_setup.sh". Das Setup Skript erledigt nun den Rest. Stelle bitte sicher,
dass du bei der Installation eine Internetverbindung hast! Ohne Internet kann das Setup die benötigten Dateien nicht laden und die Installation schlägt fehl.

Um zu überprüfen, ob der Service schon läuft, kannst du in der Konsole "sudo systemctl status ohg_auto_login.service" eingeben.
Vergiss nicht, mit "sudo nano /etc/ohg_auto_login/config.json" deine Benutzerdaten in die Programmkonfiguration einzugeben!

Wenn du das Skript deinstallieren willst, gib einfach "sudo bash /etc/ohg_auto_login/linux_uninstaller.sh" in die Konsole ein. Alle Skripte werden
jetzt deinstalliert!

#### Windows
Lade dir aus den Releases die Datei "windows_installer.bat" herunter. Führe diese Datei nun mit Administratorrechten
aus. Die Programmdateien werden jetzt heruntergeladen und installiert. Es wird auch eine Startup Verknüpfung erstellt, die
das Programm beim Systemstart direkt mit startet.
Installiert wird in den Ordner "C:\scripts\ohg_auto_login". 
Hier kannst du nun die Dateie manuell ausführen, wenn du sie brauchst.

Zur Konfiguration und Deinstallation des Programmes wurde die Verknüpfung "OHG Login Einstellungen" in das Startmenü platziert. Hier kannst du
deine Login Informationen abändern, sowie das Skript komplett deinstallieren!

#### MacOS
Aktuell nicht unterstützt

## DISCLAIMER
Das Skript ist experimentell, es gibt keine Garantie für die Funktionsfähigkeit!
Es kann unter Linux und Windows zu Fehlern kommen, wenn du nicht genau so vorgehst wie in der Anleitung beschrieben!
Bei Fehlern, melde gerne einen Issue auf der Github Issue Seite!
