$CHOCO_PATH="%ALLUSERSPROFILE%\chocolatey\bin\"
Write-Host "Installing chocolatey..."
if(!(Test-Path -Path $CHOCO_PATH )){
	[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
Write-Debug "... chocolatey done"