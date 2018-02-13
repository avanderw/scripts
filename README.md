# scripts

-  [setup development](#setup-development)

## setup development

cmd.exe

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))"

powershell.exe

	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))

### installing behind a proxy

cmd.exe

	@powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))"

powershell.exe

	[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))