$OPEN_TTD="https://binaries.openttd.org/releases/1.7.2/openttd-1.7.2-windows-win64.zip"

Write-Host "Configuring OpenTTD ..."

if(!(Test-Path -Path "$PSScriptRoot\OpenTTD" )){
    Write-Host "Downloading OpenTTD ..."
    (New-Object System.Net.WebClient).DownloadFile("$OPEN_TTD", "$PSScriptRoot\OpenTTD.zip")

    Write-Host "Extracting OpenTTD ..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory("$PSScriptRoot\OpenTTD.zip", "$PSScriptRoot\OpenTTD")

    Out-File -FilePath "$PSScriptRoot\OpenTTD\openttd.cfg"
    Remove-Item -path "$PSScriptRoot\OpenTTD.zip"
}

Write-Host "... Configured OpenTTD"
