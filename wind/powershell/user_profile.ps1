

Import-Module posh-git

$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
#oh-my-posh init pwsh --config ‘cinnamon’ | Invoke-Expression
oh-my-posh init pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

#PS ReadLine
Set-PSReadLineOption -PredictionViewStyle  ListView
Set-PSReadLineOption -PredictionSource  History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'


# Alias
Set-Alias -Name vim -Value nvim
Set-Alias vi nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
