$WindowsIdentity = [system.security.principal.windowsidentity]::GetCurrent()
$Principal = New-Object System.Security.Principal.WindowsPrincipal($WindowsIdentity)
$AdminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if ($Principal.IsInRole($AdminRole))
{
    Write-Host -ForegroundColor Green "Elevated PowerShell session detected. Continuing."
}
else
{
    Write-Host -ForegroundColor Red "This application/script must be run in an elevated PowerShell window. Please launch an elevated session and try again."
    Break
}

function Get-StatusFromValue
{
    Param($SV)

    switch($SV)
    {
        0 { "Disconnected" }
        1 { "Connecting" }
        2 { "Connected" }
        3 { "Disconnecting" }
        4 { "Hardware not present" }
        5 { "Hardware disabled" }
        6 { "Hardware malfunction" }
        7 { "Media disconnected" }
        8 { "Authenticating" }
        9 { "Authentication succeeded" }
        10 { "Authentication failed" }
        11 { "Invalid Address" }
        12 { "Credentials Required" }
        Default { "Not connected" }
    }
}

function Get-ProxyFromByte
{
    Param($byte)
    
    switch($byte) 
    {
        1 {"Proxy off"}
        3 {"Use a proxy server for your LAN"}
        5 {"Use automatic configuration script"}
        7 {"Use automatic configuration & Use a proxy server for your LAN"}
        9 {"Automatically detect settings"}
        15 {"All proxy settings enabled"}
        Default {"Not configured"}
    }
}

$Local = Get-WmiObject win32_networkadapter -Filter "netconnectionid = 'Local Area Connection'"
$Wifi = Get-WmiObject win32_networkadapter -Filter "netconnectionid = 'Wireless Network Connection'"

$RegKey = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections'
$Settings = (Get-ItemProperty -Path $RegKey).DefaultConnectionSettings

if ($Local.NetConnectionStatus -eq 2) {
    Write-Host Switching to Wifi
    $Local.Disable() | Out-Null
    $Wifi.Enable() | Out-Null
    $Settings[8] = 1
} else { # Default to local
    Write-Host Switching to Local
    $Local.Enable() | Out-Null
    $Wifi.Disable() | Out-Null
    $Settings[8] = 15
}

Set-ItemProperty -Path $RegKey -Name DefaultConnectionSettings -Value $Settings
Get-ProxyFromByte $Settings[8]

Start-Sleep 5

$Local = Get-WmiObject win32_networkadapter -Filter "netconnectionid = 'Local Area Connection'"
$Wifi = Get-WmiObject win32_networkadapter -Filter "netconnectionid = 'Wireless Network Connection'"

$Local | Select-Object NetConnectionID, @{LABEL="Status";EXPRESSION={Get-StatusFromValue $_.NetConnectionStatus}}
$Wifi | Select-Object NetConnectionID, @{LABEL="Status";EXPRESSION={Get-StatusFromValue $_.NetConnectionStatus}}

