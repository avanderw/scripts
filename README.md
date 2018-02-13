# scripts

-  [setup development](#setup-development) - install development software
-  [setup portable](#setup-portable) - install apps for a portable device
-  [switch-connection](#switch-connection) - switches between "Local Area Connection" and "Wireless Network Connection"

## setup development

installs software required for my development 

- [chocolatey](https://chocolatey.org/)

cmd.exe

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))"

powershell.exe

	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))

### running behind a proxy

cmd.exe

	@powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))"

powershell.exe

	[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-development.ps1'))

## setup portable

installs portable software for use with a flash disk

- [openttd](https://www.openttd.org/)
- [tetrinet](http://tetrinet.info/)

cmd.exe

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-portable.ps1'))"

powershell.exe

	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-portable.ps1'))

### running behind a proxy

cmd.exe

	@powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-portable.ps1'))"

powershell.exe

	[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/setup-portable.ps1'))

## switch connection

- switches between "Local Area Connection" and "Wireless Network Connection"
- turns off proxy for "Wireless Network Connection"
- turns on proxy for "Local Area Connection"

cmd.exe

	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/switch-connection.ps1'))"

powershell.exe

	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/switch-connection.ps1'))

### running behind a proxy

cmd.exe

	@powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/switch-connection.ps1'))"

powershell.exe

	[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/avanderw/scripts/master/switch-connection.ps1'))