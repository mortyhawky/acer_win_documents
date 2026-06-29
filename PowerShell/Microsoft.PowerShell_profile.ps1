clear
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -ViModeIndicator Cursor

$Env:XDG_CONFIG_HOME      = "$HOME\.config"
$Env:KOMOREBI_CONFIG_HOME = "$HOME\.config\komorebi"

$PSVersion=$PSVersionTable.PSVersion
Write-Host "pwsh version              = $PSVersion"
Write-HOST "`$Env:USERNAME             = $Env:USERNAME"
Write-HOST "`$Env:TERM                 = $Env:TERM"
#Write-Host "`$HOME                     = $HOME"
Write-HOST "`$Env:USERPROFILE          = $Env:USERPROFILE"
Write-HOST "`$Env:XDG_CONFIG_HOME      = $Env:XDG_CONFIG_HOME"
Write-HOST "`$Env:LOCALAPPDATA         = $Env:LOCALAPPDATA"
Write-HOST "`$Env:APPDATA              = $Env:APPDATA"
Write-HOST "`$Env:KOMOREBI_CONFIG_HOME = $Env:KOMOREBI_CONFIG_HOME"
$Processes = $(Get-Process).Count
Write-Host "Processes                 = $Processes"

function Edit-Profile {
	nvim.exe $PROFILE
	. $PROFILE
}

function Edit-Tmux {
	nvim.exe "~\.config\psmux\psmux.conf"
}

function Edit-Vimrc {
	nvim.exe "$env:LOCALAPPDATA\nvim\init.lua"
}

function Invoke-Bat {
        bat @args
}

function Invoke-Eza {
  eza.exe                 `
   --almost-all            `
   --git                    `
   --group-directories-first `
   --icons=auto               `
   --ignore-glob "ntuser.*|NTUSER.*|desktop.ini"  `
    @args

  Git-Remote
  Git-Status
}
function Invoke-EzaLong {
    Invoke-Eza --long @args
}

function Invoke-CdEza {
	Set-Location @args
	Invoke-Eza
}

function Edit-Alacritty {
    nvim "$Env:APPDATA\alacritty\alacritty.toml" "$Env:APPDATA\alacritty\keybindings.toml"
}

function Update-Scoop {
        . "A:\win\01install-win11\scoop\Update-Scoop.ps1"
}

function Invoke-Fastfetch {
        Clear-Host
        fastfetch.exe
}

Set-Alias -Name b         -Value Invoke-Bat
Set-Alias -Name b         -Value bat
Set-Alias -Name c         -Value Invoke-CdEza
Set-Alias -Name ea        -Value Edit-Alacritty
Set-Alias -Name ep        -Value Edit-Profile
Set-Alias -Name et        -Value Edit-Tmux
Set-Alias -Name ff        -Value Invoke-Fastfetch
Set-Alias -Name l         -Value Invoke-Eza
Set-Alias -Name ll        -Value Invoke-EzaLong
Set-Alias -Name poweroff  -Value Stop-Computer
Set-Alias -Name reboot    -Value Restart-Computer
Set-Alias -Name t         -Value tmux
Set-Alias -Name v         -Value nvim
Set-Alias -Name vf        -Value vifm

###################################
##  GIT ALIASES
###################################
function Git-Remote { git remote --verbose 2>$null        }
function Git-Status { git status --short   2>$null        }
function Git-Add    { git add --all --verbose             }
function Git-Commit { git commit --message "$(date)"      }
function Git-Push   { git push --set-upstream origin main }
function Git-All    { gr; gs; ga; gc; gp; gs		  }
Set-Alias -Name gr        -Value Git-Remote
Set-Alias -Name gs        -Value Git-Status
Set-Alias -Name ga        -Value Git-Add
Set-Alias -Name gc -Force -Value Git-Commit
Set-Alias -Name gp -Force -Value Git-Push
Set-Alias -Name gitall	  -Value Git-All
