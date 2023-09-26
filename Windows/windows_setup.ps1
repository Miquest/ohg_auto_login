$downloadUrl = "https://github.com/Miquest/ohg_auto_login/archive/main.zip"
$extractedFolderPath = "ohg_login_windows"
$savePath = "ohg_auto_download.zip"
$installDirectory = "C:\scripts\ohg_auto_login\"

Invoke-WebRequest -Uri $downloadUrl -OutFile $savePath

# Check if the download was successful
if (Test-Path $savePath) {
    Write-Host "Download der Programmdateien erfolgreich!"

    # Unzip the .zip archive folder
    Expand-Archive -Path $savePath -DestinationPath $extractedFolderPath

    # Check if the files were extracted 
    if (Test-Path $extractedFolderPath) {
        Write-Host "Entpacken der Dateien erfolgreich! Installation wird gestartet"

        Write-Information "Die Dateien werden in den Dokumentenordner entpackt!"
        Remove-Item -Path "ohg_login_windows/ohg_auto_login-main/Linux" -Recurse

        mkdir $installDirectory

        if (Test-Path $installDirectory){
            Write-Debug "Installationsordner wurde erstellt! Verschiebe die Dateien in installationsordner..."

            Copy-Item -Path "ohg_login_windows/ohg_auto_login-main/Windows/Package/*" -Destination $installDirectory -Recurse
            # Remove installation Script from installation folder
            Remove-Item -Path "C:\scripts\ohg_auto_login\windows_setup.ps1"

        } else {
            Write-Error "Erstellen des Installationsverzeichnisses fehlgeschlagen!"
        }

    } else {
        Write-Host "Entpacken fehlgeschlagen."
    }
} else {
    Write-Host "Download fehlgeschlagen."
}

Remove-Item -Path "ohg_login_windows" -Recurse
Remove-Item -Path $savePath
Write-Host "Programm wurde in 'C:\scripts\ohg_auto_login' installiert. Zum Starten, bitte die Datei 'ohg-script-daemon.pyw' ausführen!"
