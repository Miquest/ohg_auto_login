# Automatischer WIFI Login

Dieses kleine Programm soll den WLAN Zugang im Otto-Hahn-Gymnasium Göttingen erleichtern.
Es wird alle 30 ein Ping zu den Google Servern gesendet. Schlägt dieser fehl, wird der Authentifizierungsprozess automatisch aufgerufen. Die maximale Zeit ohne Internet beträgt also 30 Sekunden.

## Installation

#### Linux
Lade dir aus den Releases die Datei "linux_setup.sh" herunter. Gehe in den entsprechenden Ordner und öffne ein Terminal. 
Nun musst du folgenden Befehl eingeben: "sudo ./linux_setup.sh". Das Setup Skript erledigt nun den Rest. Stelle bitte sicher,
dass du bei der Installation eine Internetverbindung hast! Ohne Internet kann das Setup die benötigten Dateien nicht laden und die Installation schlägt fehl.

Vergiss nicht, mit "sudo nano /etc/ohg_auto_login/config.json" deine Benutzerdaten in die Programmkonfiguration einzugeben!

#### Windows
Noch nicht unterstützt. Lade dir die Quelldateien runter, un das Skript zu benutzen. Du benötigst eine Installation von Python 3 oder höher!

#### MacOS
Aktuell nicht unterstützt

## DISCLAIMER
Das Skript ist experimentell, es gibt keine Garantie für die Funktionsfähigkeit!
Neuere Versionen werden ein Installer Skript beinhalten, welches den Einrichtungsprozess automatisiert und einen Task (bei Windows) oder einen Crontab (Linux) erstellt, damit das Skript ab Systemstart ausgeführt wird. 
Außerdem wird die Abhängigkeit einer Python Installation unter Windows entfernt werden.
