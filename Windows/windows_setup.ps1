$downloadUrl = "https://github.com/Miquest/ohg_auto_login/archive/main.zip"
$extractedFolderPath = "ohg_login_windows"
$savePath = "ohg_auto_download.zip"

Invoke-WebRequest -Uri $downloadUrl -OutFile $savePath

# Überprüfe, ob der Download erfolgreich war
if (Test-Path $savePath) {
    Write-Host "Download erfolgreich! Die Zip-Datei wurde unter $savePath gespeichert."

    # Entpacke die Zip-Datei in den angegebenen Ordner
    Expand-Archive -Path $savePath -DestinationPath $extractedFolderPath

    # Überprüfe, ob die Entpackung erfolgreich war
    if (Test-Path $extractedFolderPath) {
        Write-Host "Entpacken erfolgreich! Die Dateien wurden unter $extractedFolderPath gespeichert."
    } else {
        Write-Host "Entpacken fehlgeschlagen."
    }
} else {
    Write-Host "Download fehlgeschlagen."
}