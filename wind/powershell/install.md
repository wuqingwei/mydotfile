set http_proxy=http://127.0.0.1:7897
set https_proxy=http://127.0.0.1:7897

# 设置 Scoop 全局 HTTP 代理
scoop config proxy 127.0.0.1:7890

# 再次尝试更新
scoop update

scoop install curl sudo jq
scoop install neovim

mkdir .\.config\powershell

nvim.exe $PROFILE.CurrentUserCurrentHost

. $env:USERPROFILE\.config\powershell\user_profile.ps1

winget install --id Git.Git -e --source winget
winget install JanDeDobbeleer.OhMyPosh --source winget

Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

Import-Module Terminal-Icons
Install-Module -Name z -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle  ListView
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force

which node
