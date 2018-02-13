$OPEN_TTD="https://binaries.openttd.org/releases/1.7.2/openttd-1.7.2-windows-win64.zip"
$TETRINET="http://www.avanderw.co.za/tetrinet.zip"

Add-Type -AssemblyName System.IO.Compression.FileSystem
Write-Host "Installing ..."

if(!(Test-Path -Path "$PSScriptRoot\OpenTTD" ))
{
    Write-Host "Downloading OpenTTD ..."
    (New-Object System.Net.WebClient).DownloadFile("$OPEN_TTD", "$PSScriptRoot\OpenTTD.zip")

    Write-Host "Extracting ..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory("$PSScriptRoot\OpenTTD.zip", "$PSScriptRoot\OpenTTD")

    Out-File -FilePath "$PSScriptRoot\OpenTTD\openttd.cfg"
    Remove-Item -path "$PSScriptRoot\OpenTTD.zip"
    Write-Host -ForegroundColor Green "... Configured OpenTTD"
    Write-Host
} else {
    Write-Host -ForegroundColor Green "`tOpenTTD exists"
}

if (!(Test-Path -Path "$PSScriptRoot\Tetrinet"))
{
    Write-Host "Downloading Tetrinet ..."
    (New-Object System.Net.WebClient).DownloadFile("$TETRINET", "$PSScriptRoot\Tetrinet.zip")

    Write-Host "Extracting ..."
    [System.IO.Compression.ZipFile]::ExtractToDirectory("$PSScriptRoot\Tetrinet.zip", "$PSScriptRoot\Tetrinet")
    
    Remove-Item -path "$PSScriptRoot\Tetrinet.zip"
    Write-Host -ForegroundColor Green "... Configured Tetrinet"
    Write-Host
} else {
    Write-Host -ForegroundColor Green "`tTetrinet exists"
}

Write-Host ... Done