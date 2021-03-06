# Import
Import-Module -Name Terminal-Icons
Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSFzf

# Load Custom Prompt
function Get-ScriptDirectory {
    Split-Path $MyInvocation.ScriptName
}
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'pet.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
# fzf Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl-r'

# Alias
Set-Alias .. cd..
Set-Alias vim nvim
Set-Alias rn Rename-Item
Set-Alias im Import-Module
Set-Alias c clear

# functions
function gitall([string]$msg) {
    git add .
    git commit -m $msg
    git push
}
function ll { Get-ChildItem | Format-Wide }
    
