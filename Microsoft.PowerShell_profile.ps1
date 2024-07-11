# utf-8
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding('utf-8')

# pwsh
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Import-Module Terminal-Icons

# posh-git
Import-Module posh-git

# Git Aliases
function rm-merged-local() {
  git fetch -p && git branch --merged | ?{$_.StartsWith('*') -eq $False} | %{git branch -d $_.Trim()}
}

# GitHub CLI
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# Starship
Invoke-Expression (&starship init powershell)

# rustup
Invoke-Expression -Command $(rustup completions powershell | Out-String)
