@ECHO off
SET CHOCO_PATH="%ALLUSERSPROFILE%\chocolatey\bin\"
IF NOT EXIST %CHOCO_PATH%\* (
@powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH="%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)
echo yes