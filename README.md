# dotfiles

my dotfiles, if you use these your on your own ~

![risk.png](./img.png)

yet to add linux files...



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
winget install --id JesseDuffield.lazygit
```

misc: for yt-dlp
```pwsh
winget install --id=DenoLand.Deno
```

Config Locations

| File | Target Location |
|------|-----------------|
| `vscode/settings.json` | `%APPDATA%\Code\User\settings.json` |
| `starship.toml` | `%USERPROFILE%\.config\starship.toml` |
| `windows/powershell/Microsoft.PowerShell_profile.ps1` | `%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` |
| `windows/windows-terminal/settings.json` | `%LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json` |
