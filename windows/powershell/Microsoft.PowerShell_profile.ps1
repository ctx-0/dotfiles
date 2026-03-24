# -- shell customisation

Invoke-Expression (&starship init powershell)

# Telemetry off
$env:POWERSHELL_TELEMETRY_OPTOUT = "1"
$env:DOTNET_CLI_TELEMETRY_OPTOUT = "1"

# Error view (concise - less verbose errors)
$ErrorView = "ConciseView"

if (Get-Module PSReadLine) {
    # Search history with arrows (type then press ↑)
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    # Emacs keys (Ctrl+A/E for start/end)
    Set-PSReadLineOption -EditMode Emacs

    # IntelliSense style prediction
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle InlineView
}

# -- alias
Set-Alias lg lazygit

# Quick navigation (works with zoxide below)
function .. { z .. }
function ... { z ../.. }
function .... { z ../../.. }

# -- chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# -- restic
$env:RESTIC_REPOSITORY = "D:\backup-restic"

# -- atuin
atuin init powershell | Out-String | Invoke-Expression

# -- zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
