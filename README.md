# dotfiles

## windows

Always install modern [PowerShell](https://github.com/PowerShell/PowerShell) and ditch legacy Windows PowerShell.
Modern PowerShell provides better performance, more features, and active support.

Check using `$PSVersionTable`

```pwsh
winget install Microsoft.PowerShell
$PSVersionTable.PSVersion  # Check version (should be 7.x)
```
Also install `PSReadLine`
```pwsh
Install-Module PSReadLine -Force
```

Install Tooling

```pwsh
winget install --id Starship.Starship
winget install -e Atuinsh.Atuin
winget install --exact --id restic.restic --scope Machine
winget install eza-community.eza
winget install ajeetdsouza.zoxide
```
