#Prompt
Import-Module posh-git
#Import-Module oh-my-posh
#Get-PoshThemes Paradox
#Set-PoshPrompt mojada
#Set-PoshPrompt iterm2 
#Set-PoshPrompt powerlevel10k_rainbow

#Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'powerlevel10k_rainbow.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

#Icons
Import-Module -Name Terminal-Icons

#PsReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None 
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionViewStyle ListView

#Fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl-f' -PSReadlineChordReverseHistory 'Ctrl-r'

#Alias
Set-Alias vim nvim 
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias -Name 'gs' -Value 'git stValueatus'

#Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction ModuleName
}
