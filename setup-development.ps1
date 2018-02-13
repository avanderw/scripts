$CHOCO_PATH="%ALLUSERSPROFILE%\chocolatey\bin\"
Write-Host "Configuring chocolatey..."
if(!(Test-Path -Path $CHOCO_PATH )){
	Write-Debug "Installing chocolatey..."
	#[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
Write-Debug "... Chocolatey configured"