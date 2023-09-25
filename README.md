# Automatischer WIFI Login

Dieses kleine Programm soll den WLAN Zugang im Otto-Hahn-Gymnasium Göttingen erleichtern.
Es wird alle 30 ein Ping zu den Google Servern gesendet. Schlägt dieser fehl, wird der Authentifizierungsprozess automatisch aufgerufen. Die maximale Zeit ohne Internet beträgt also 30 Sekunden.

## Wie es funktioniert
Zum Ausführen des Skriptes muss Python 3 installiert sein (getestet auf Python 3.11). Die eigenen Login Daten müssen in der config.json eingetragen werden. Um das Skript zu starten, muss die ohg-auto-login-daemon.py per Doppelklick gestartet werden. Das Skript bleibt im Hintergrund aktiv, es öffnet sich kein Fenster.
Falls der WiFi Login nicht funktioniert, kann die "ohg-authenticator.log" für Informationen geöffnet werden. Hier stehen eventuelle Fehlermeldungen

## DISCLAIMER
Das Skript ist experimentell, es gibt keine Garantie für die Funktionsfähigkeit!
Neuere Versionen werden ein Installer Skript beinhalten, welches den Einrichtungsprozess automatisiert und einen Task (bei Windows) oder einen Crontab (Linux) erstellt, damit das Skript ab Systemstart ausgeführt wird. 
Außerdem wird die Abhängigkeit einer Python Installation unter Windows entfernt werden.
