#!/usr/bin/env powershell -File
# https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
# To turn off powershell autocomplete

Set-PSReadLineOption -PredictionSource None
Set-Alias which where.exe

$condition = which python
if ($condition) {
}
else
{
	Write-Output "https://www.python.org/downloads/windows/"
	Write-Output "https://www.python.org/ftp/python/3.13.3/python-3.13.3-amd64.exe"
	Write-Output "add to path"
	Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python313"
	Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python313\Scripts\"
}

Function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}


$condition = which tail
if ($condition) {
}
else
{
	Write-Output "Add GNU utilities for Win32"
	Write-Output "https://unxutils.sourceforge.net"
}
$condition = which choco
if ($condition) {
}
else
{
	Write-Output "https://chocolatey.org/install"
	Write-Output "https://community.chocolatey.org/api/v2/package/chocolatey"
}
 
$condition = which scoop
if ($condition) {
}
else
{
	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
	Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

$condition = which less
if ($condition) {
}
else
{
	scoop install less
}

$condition = which bat
if ($condition) {
}
else
{
	scoop install bat
}

function history_full()
    {
        cat (Get-PSReadlineOption).HistorySavePath
    }
Set-Alias history history_full

# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force


function slack()
    {
        C:\Users\AAA3AZZ\AppData\Local\slack\slack.exe
    }

$condition = Test-Path -Path "$env:ProgramFiles\Typora\Typora.exe"
if ($condition) {
  Set-Alias typora "$env:ProgramFiles\Typora\Typora.exe"
}
else
{
  Write-Output "Install Typora Markdown Editor"
  Write-Output "https://typora.io"
  Write-Output "https://download.typora.io/windows/typora-setup-x64.exe"
}
	Set-Alias system_properties sysdm.cpl

$condition = Test-Path -Path "$env:ProgramFiles\powertoys\winui3apps\powertoys.environmentvariables.exe"
if ($condition) {
  Set-Alias env_edit $env:ProgramFiles\powertoys\winui3apps\powertoys.environmentvariables.exe
  Set-Alias env_config env_edit
}
else
{
  Write-Output "Install Powertoys"
	Write-Output "# https://learn.microsoft.com/en-us/windows/powertoys/environment-variables"
	Write-Output "https://github.com/microsoft/PowerToys/releases/tag/v0.90.1" 
}

Set-Alias recycle Clear-RecycleBin
# to hide recycle bin from desktop
# personalization > themes > desktop icon settings 

#     _______ __
#   / ____(_) /_
#  / / __/ / __/
# / /_/ / / /_
# \____/_/\__/

# https://git-scm.com/download/win

# <git-install-root>\etc\gitconfig

# git config --global core.longpaths true
# git config --global --type bool push.autoSetupRemote true
# git config --global windows.appendAtomically false


$condition = which tig
if ($condition) {
    function blame()
        {
            tig blame $($args)
        }
    Set-Alias annotate blame
}
else
{
	Write-Output "https://gitforwindows.org/"
    Write-Output "make sure that the bin for git is in the PATH"
    Write-Output "so you get the tig git history viewer"
    Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Git\bin\ to path"
	Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Git\cmd"
}




# https://github.com/dahlbyk/posh-git
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git

$condition = which github
if ($condition) {
	Set-Alias ghd github
}
else
{
	echo "install github desktop"
}



$condition = which fd-find
if ($condition) {
    function fd()
    {
        fd-find --hidden $($args)
    }
    function fdg()
    {
        fd-find $($args)
    }
}
else
{
    Write-Output "install the fd find tool"
    Write-Output "https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-i686-pc-windows-msvc.zip"
}

$condition = which difft
if ($condition) {
}
else
{
  Write-Output "Install Difftastic the fantastic diff tool"
  Write-Output "https://github.com/Wilfred/difftastic/releases/download/0.53.1/difft-x86_64-pc-windows-msvc.zip"
  Write-Output "https://difftastic.wilfred.me.uk/git.html"
  Write-Output "git config --global diff.external difft"
}


# https://github.com/cli/cli/releases/download/v2.43.1/gh_2.43.1_windows_amd64.msi

# https://www.nerdfonts.com
Import-Module Terminal-Icons


$condition = which bat
if ($condition) {
}
else
{
	echo "# https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-i686-pc-windows-msvc.zip"
}

$condition = which rustc
if ($condition) {
}
else
{
	echo "install rust"
}

$condition = which fzf
if ($condition) {
}
else
{
	Write-Output "Install the FZF Fuzzy Finder"
  Write-Output "https://github.com/junegunn/fzf/releases/download/0.32.1/fzf-0.32.1-windows_amd64.zip"
}

if ($Env:fzf_default_opts) 
{}
else{
	Write-Output "Variable Name: fzf_default_opts"
	Write-Output "Variable Value: --height 40% --border"
}

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+k -Function DeleteToEnd
(Get-PSReadLineOption).HistorySearchCaseSensitive = $false

# https://github.com/PowerShell/psreadline
# Make it so that Control D exits a powershell window
# https://learn.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.5



# https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-7.4

# fix this up so that it works like which in unix where it checks a path then checks for alias or function

function art($program)
    {
        where.exe $program
        Get-Alias -Name $program
    }

function gum()
    {
        # Get the latest metadata
        $current_branch = git rev-parse --abbrev-ref HEAD
        git fetch
        git switch main
        git pull
        git switch $current_branch
        git merge main
    }

$condition = which gh
if ($condition) {
}
else
{
   Write-Output "https://cli.github.com/"
}

function pr()
    {
        gh pr list
    }

function prv($pull_request_number)
    {
        gh pr view $pull_request_number
    }

function env()
    {
        Get-ChildItem env:
    }

function pwd()
    {
        powershell -Command pwd
    }

function ga()
    {
        gh run list
    }
Set-Alias gha ga

function gb()
    {
        gh browse
    }
function e()
    {
        explorer . &
    }

function gr()
    {
        cd "$(git rev-parse --show-toplevel)"
    }




$condition = Test-Path -Path "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
if ($condition) {
    Set-Alias chrome "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
}
else
{
    Write-Output "install google chrome"
    Write-Output "https://www.google.com/chrome/dr/download"
}



$condition = which nvim
if ($condition) {
	Set-Alias vim nvim.exe
	Set-Alias vi nvim.exe
}
else
{
	# let g:loaded_perl_provider = 0
	# C:\Users\AAA3AZZ\AppData\Local\nvim/init.lua
	# https://gist.github.com/jeffcasavant/6ff061d5fd32ed3a7d3eb27639cd223f
	# https://github.com/dense-analysis/ale
	# https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-win64.msi
	# https://github.com/neovide/neovide/releases/download/0.15.0/neovide.msi
}

$condition = Test-Path -Path "$env:ProgramFiles\Typora\Typora.exe"
if ($condition) {
    Set-Alias typora "$env:ProgramFiles\Typora\Typora.exe"
}
# C:\Users\AAA3AZZ\AppData\Local\Programs\Caprine
$condition = which Caprine.exe
if ($condition) {
    Set-Alias fb "$env:ProgramFiles\Caprine\Caprine.exe"
    Set-Alias messenger "$env:ProgramFiles\Caprine\Caprine.exe"
}
else
{
	Write-Output "https://github.com/sindresorhus/caprine"
	Write-Output "https://github.com/sindresorhus/caprine/releases/latest"
}


# https://3mhealth.atlassian.net/wiki/spaces/HIS/pages/12995020/Fed+Statically+Compiled+Federation+CLI
# https://github.3mhealth.com/3MHISCloudEngineering/fed
# fed requires google chrome https://www.google.com/chrome/

# USAC username used to authenticate [%FED_USERNAME%]
# USAC password used to authenticate [%FED_PASSWORD%]
# alias jitney='fed --manual --idp jitney'

function fl()
    {
        fed --manual --idp jitney list
    }
function fu($envname)
    {
        fed --manual --idp jitney up $envname
    }
function creds()
    {
        np $env:homedrive\$env:homepath\.aws\credentials
    }

function config()
    {
        np $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
    }
    Set-Alias config_edit config



function marketplace()
    {
        chrome https://www.facebook.com/marketplace
    }

function standup()
    {
        chrome https://3mhealth.atlassian.net/wiki/spaces/OCDI/pages/995572603/OCDI+Standup+Agenda
    }
function ocdi_twa()
    {
        chrome https://3mhealth.atlassian.net/wiki/spaces/OCDI/pages/995559324/Onboarding+Team+Working+Agreement+Definition+of+Ready+Definition+of+Done+CapEx
    }
Set-Alias twa ocdi_twa

function ocdi_roadmap()
    {
        chrome https://3mhealth.atlassian.net/wiki/spaces/OCDI/pages/995575505/OCDI+Pre-Visit+Post-Visit+and+Reporting+Roadmap
    }
Set-Alias roadmap ocdi_roadmap
function pulse()
    {
        chrome https://3mhealth.atlassian.net/wiki/spaces/OCDI/pages/995571909/Team+Pulse+2025
    }
  Set-Alias teampulse pulse

function okta()
    {
        chrome https://3mhealth.okta.com
    }

function jitney()
    {
        chrome https://jitney.ujpnp-1.us.amz.3mhis.net
    }

function config_git()
    {
        difft $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
        cp $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1
        cd "$env:OneDrive\Documents\GitHub\config"
        # Invoke-ScriptAnalyzer files/Microsoft.PowerShell_profile.ps1
        git pull
        git add files\Microsoft.PowerShell_profile.ps1
        git commit -m "updated Powershell configuration"
        git push
        cd -
    }

function config_update()
    {
        cd $env:OneDrive\Documents\GitHub\config
        git pull
        cd -
        difft $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
        cp  $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
        # hide config files
		$condition = Test-Path -Path "$env:USERPROFILE/.bash_history"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.bash_history" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.git-credentials"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.git-credentials" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.gitconfig"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.gitconfig" -Name Attributes -Value Hidden
    }
		$condition = Test-Path -Path "$env:USERPROFILE/.viminfo"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.viminfo" -Name Attributes -Value Hidden
    }
		$condition = Test-Path -Path "$env:USERPROFILE/.lesshst"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.lesshst" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/_lesshst"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/_lesshst" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.tig_history"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.tig_history" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.yamllint"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.yamllint" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.wslconfig"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.wslconfig" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.affinity"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.affinity" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.android"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.android" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.rustup"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.rustup" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.python_history"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.python_history" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.config"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.config" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.cargo"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.cargo" -Name Attributes -Value Hidden
		}
		$condition = Test-Path -Path "$env:USERPROFILE/.rustup"
		if ($condition) {
			Set-ItemProperty -Path "$env:USERPROFILE/.rustup" -Name Attributes -Value Hidden
		}
}
function ssh_config()
    {
      np $env:homedrive\$env:homepath\.ssh\config
    }


$condition = which glow
if ($condition) {
  Set-Alias g glow
}
else
{
  Write-Output "Install Glow"
  Write-Output "https://github.com/charmbracelet/glow" 
  Write-Output "https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Windows_x86_64.zip"
}

function dropbox()
    {
      cd $env:homedrive\$env:homepath\Dropbox
    }

function paper()
    {
      chrome https://www.dropbox.com/paper
    }

function repo()
    {
        cd $env:OneDrive\Documents\GitHub\$($args)
    }

function dl()
    {
        cd $env:homedrive\$env:homepath\Downloads\
    }

function desktop()
    {
        cd $env:OneDrive\Desktop\
    }
Set-Alias desk desktop

function pictures()
    {
        cd $env:OneDrive\Pictures\
    }
Set-Alias pics pictures


$condition = which eza
if ($condition) {
    Set-Alias ls eza
    Set-Alias -Name dir -Value eza -Option AllScope
    
    function ll()
    {
        eza -l --git --icons $($args)
    }
    function lt()
    {
        eza --tree --git --icons $($args)
    }
}
else
{
    Write-Output "install the LS alterantive eza"
    Write-Output "https://github.com/eza-community/eza/releases/download/v0.17.0/eza.exe_x86_64-pc-windows-gnu.tar.gz"

}






$condition = Test-Path -Path "$env:ProgramFiles\Notepad++\notepad++.exe"
if ($condition) {
    Set-Alias n $env:ProgramFiles\Notepad++\notepad++.exe
    Set-Alias np $env:ProgramFiles\Notepad++\notepad++.exe
    Set-Alias notepad $env:ProgramFiles\Notepad++\notepad++.exe
    Set-Alias n++ $env:ProgramFiles\Notepad++\notepad++.exe
}
else
{
    Write-Output "https://notepad-plus-plus.org/downloads/"
}
# https://gigenet.dl.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-setup.exe
# add C:\Program Files (x86)\GnuWin32\bin\ to path


$condition = which alacritty
if ($condition) {
    function alacritty_config()
        {
            alacritty --version
            Write-Output "https://github.com/alacritty/alacritty/release"b
            chrome https://alacritty.org/config-alacritty.html
            s $env:APPDATA\alacritty\alacritty.toml
        }
}
else
{
    Write-Output "Install the Alactritty Terminal"
    Write-Output "https://github.com/alacritty/alacritty/releases"
}

$condition = which jq
if ($condition) {

}
else
{
    Write-Output "Install jq JSON Parser"
    Write-Output "https://jqlang.github.io/jq/"
    Write-Output "scoop install jq"
}

$condition = which rg
if ($condition) {

}
else
{
    Write-Output "Install Ripgrep search tool"
    Write-Output "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-i686-pc-windows-msvc.zip"

        # https://github.com/phiresky/ripgrep-all
        # https://github.com/phiresky/ripgrep-all/releases/download/v0.10.6/ripgrep_all-v0.10.6-x86_64-pc-windows-msvc.zip
        # https://github.com/oschwartz10612/poppler-windows/releases/download/v24.08.0-0/Release-24.08.0-0.zip
}




# https://www.python.org/downloads/
# add to path
# C:\Program Files\Python312\Scripts\
# C:\Users\AAA3AZZ\AppData\Roaming\Python\Python312\site-packages\pre_commit
# https://pre-commit.com/#install

Set-Alias python C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python
Set-Alias python.exe C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python

$condition = which jira
if ($condition) {

}
else
{
    Write-Output "install the ira cli"
    Write-Output "https://github.com/ankitpokhrel/jira-cli/releases/download/v1.5.1/jira_1.5.1_windows_x86_64.zip"
    # uses api token from https://id.atlassian.com/manage-profile/security/api-tokens
    # Set JIRA_API_TOKEN env variable
    # jira init
    # for server enter
    # https://mmodal.atlassian.net
    # Set JIRA_PAGER env variable to bat or glow if you like! C:\Windows\System32\bat.exe C:\Windows\System32\glow.exe
}

function j()
    {
        jira issue list -q "project IN ('CHLAB','CHPROD','HCC','Write-Output','DECOM') AND assignee IN (currentUser()) AND status != Closed"
    }

function jh()
    {
        jira issue list --history -q "project IN ('CHLAB','CHPROD','HCC','Write-Output','DECOM')"
    }

function jv($a)
    {
        jira issue view $a
    }
function jo($a)
    {
        jira open $a
    }
function jt($a)
    {
        jira issue move $a
    }
function hcc()
    {
        jira issue list -q "project = HCC AND (labels in (HCC_DevOps, hcc-devops) OR component = 'HCC DevOps') AND status NOT IN ('Closed','Resolved')"
    }
function hcc_open()
    {q
        jira issue list -q "project = HCC AND (labels in (HCC_DevOps, hcc-devops) OR component = 'HCC DevOps') AND status = Open"
    }

function hcc_current()
    {
        jira issue list -q "project = HCC AND (labels in (HCC_DevOps, hcc-devops) OR component = 'HCC DevOps') AND status = 'In Development'"
    }

function capd()
    {
        jira issue list -q "project in ('CAPD', 'CHPROD', 'CHLAB') AND assignee in (618aea7df1ff560069c1ff24, 70121:b02faff2-b816-430d-b3bc-e7e08b7403bf, 6222858fb7e7c7007157fab1, 61a77f3e3618cd006feca193, 61dc62370586a20069a11899, 629df191932059006f8ec707, 5ffc99bd642089014136f0ad) AND summary !~ 'HCC' AND status NOT IN ('Closed','Resolved')"
    }
function capd_current()
    {
        jira issue list -q "project in ('CAPD', 'CHPROD', 'CHLAB') AND assignee in (618aea7df1ff560069c1ff24, 70121:b02faff2-b816-430d-b3bc-e7e08b7403bf, 6222858fb7e7c7007157fab1, 61a77f3e3618cd006feca193, 61dc62370586a20069a11899, 629df191932059006f8ec707, 5ffc99bd642089014136f0ad) AND summary !~ 'HCC' AND status IN ('In Development')"
    }

function ocdi_backlog()
    {
        jira issue list -q "project in ('OCDI') AND status IN ('Open')"
    }

function ocdi_backlog_web()
    {
        chrome https://mmodal.atlassian.net/jira/software/c/projects/OCDI/boards/909/backlog
    }

function ocdi_epics()
    {
        jira issue list -q "project in ('OCDI')  and type = Epic AND status NOT IN ('Closed')" --order-by updated
    }

Set-Alias ocdi_epic ocdi_epics

function ocdi_epics_web()
    {
        chrome https://mmodal.atlassian.net/issues/?filter=40398
    }
Set-Alias ocdi_epic_web ocdi_epics_web


function ocdi()
    {
        jira issue list -q "project in ('OCDI') AND status IN ('In Development')"
    }

function ocdi_ready()
    {
        jira issue list -q "project in ('OCDI') AND status IN ('Ready for Development')"
    }
Set-Alias ocdi_todo ocdi_ready

function ocdi_cr()
    {
        jira issue list -q "project in ('OCDI') AND status IN ('Code Review')"
    }

function ja()
    {
        jira issue assign $($args) $(jira me)
    }

Set-Alias ocdi_codereview ocdi_cr
Set-Alias ocdi_code_review ocdi_cr


function chlab()
    {
        jira issue list -q "project IN ('CHLAB') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate','CAPD')"
    }
function carrie()
    {
        jira issue list -q "project IN ('OCDI','HCC') and assignee = 'Carolyn Williams' and status NOT IN ('closed','resolved')" --order-by updated
    }
function chlab_hcc()
    {
        jira issue list -q "project IN ('CHLAB') AND status != Closed AND component IN ('HCC Collaborate')"
    }

function chlab_capd()
    {
        jira issue list -q "project IN ('CHLAB') AND status != Closed AND component IN ('CAPD')"
    }

function chprod()
    {
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate','CAPD') and key NOT IN('CHPROD-46823','CHPROD-48189') "
    }
function chprod_hcc()
    {
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate')"
    }
function chprod_capd()
    {
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('CAPD') and key and key NOT IN('CHPROD-46823','CHPROD-48189') "
    }
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
else
{
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
}
# Remember to add the hcc and ocdi repos to your PATH
Set-Alias tunnel tunnel.ps1
Set-Alias ocditunnel ocditunnel.ps1




# https://github.com/nickgerace/gfold/releases
Set-Alias gf gfold

# https://mmodal.atlassian.net/wiki/spaces/HCC/pages/42436191/Get+things+to+work+with+3M+s+custom+CA


Set-Alias s start


$condition = which onefetch
if ($condition) {
	Set-Alias of onefetch
}
else
{
	Write-Output "https://github.com/o2sh/onefetch/releases"
}

$condition = which onefetch
if ($condition) {
	Set-Alias of onefetch
}
else
{
	Write-Output "https://github.com/o2sh/onefetch/releases"
}

$condition = which ncat
if ($condition) {
	Set-Alias nc ncat
}
else
{
	Write-Output "Install Netcat"
	Write-Output "https://nmap.org/ncat/"
	
}


$condition = which neofetch
if ($condition) {
	Set-Alias nf neofetch
}
else
{
	scoop install neofetch
}

# Control Panel

#git add .; git commit -m updates; git push

# sudo apt install neofetch
# iwr -useb get.scoop.sh | iex


function ocdi_version($env)
    {
    if ($env -eq "ci") {
        if (curl -s --fail https://ocdi.ucd-ci.us.amz.3mhis.net/ocdi-services-backend/actuator/info)
        {
            figlet CI
            curl -s https://ocdi.ucd-ci.us.amz.3mhis.net/ocdi-services-backend/actuator/info | jq .
        }
        else
        {
            curl -v https://ocdi.ucd-ci.us.amz.3mhis.net/ocdi-services-backend/actuator/info
        }
    }
    elseif  ($env -eq "gi") {
        if (curl -s --fail https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info)
        {
            figlet GI
            curl -s https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info | jq .
        }
        else
        {
            curl -v https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info
        }
    }
    else 
	{
		Write-Host ("curls endpoints and gives the current version.")
		Write-Host ("Current options are gi and ci")
	}
    }



function nexus()
    {
    chrome https://nexus.udapp-appsec.us.amz.3mhis.net/#browse/browse:hcbg-docker-us-east-1-hosted-sandbox
    }


$condition = which yq
if ($condition){
	}
else
{
	Write-Output "https://github.com/mikefarah/yq"
    scoop install yq
}

function yaml2json($yamlfile)
    {
        $yamlfile_basename = (Get-Item $yamlfile ).Basename
        $yamlfile_dot_json = "$yamlfile_basename.json"
        yq -o=json '.'  $yamlfile > $yamlfile_dot_json
        
    }
function json2yaml($jsonfile)
    {
        $jsonfile_basename = (Get-Item $jsonfile ).Basename
        $jsonfile_dot_yaml = "$jsonfile_basename.yml"
        Write-Output "---" > $jsonfile_dot_yaml
        cat $jsonfile | yq -P >> $jsonfile_dot_yaml
        dos2unix -q $jsonfile_dot_yaml
    }

$condition = which roll
if ($condition){
}
else
{
    pip install dice
}


$condition = which chafa
if ($condition){
    function dup()
    {
        czkawka.exe dup  --directories .
    }
}
else
{
    scoop install czkawka
}


$condition = which scoop
if ($condition)
{}
else
{
Write-Output "https://scoop.sh"
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}



$condition = which chafa
if ($condition)
{
    Set-Alias img chafa

}
else
{
  Write-Output "chafa image viewer"
  Write-Output "https://github.com/hpjansson/chafa"
  scoop install chafa
  # https://github.com/atanunq/viu/releases


}


$condition = which magick
if ($condition)
{
function ico($image)
    {
       $image_basename = (Get-Item $image ).Basename
       $image_dot_ico = "$image_basename.ico"
       magick -density 512x512 -background none $image -resize 128x128 $image_dot_ico
    }
}
else
{
    Write-Output "https://imagemagick.org/archive/binaries/ImageMagick-7.1.1-47-Q16-HDRI-x64-dll.exe"
}

$condition = which curl
if ($condition)
{

}
else
{
    Write-Output "Install CuRL!"
    Write-Output "https://curl.se/windows/latest.cgi?p=win64-mingw.zip"
}


# $condition = which bandwhich
# if ($condition)
# {
# }
# else
# {
  # Write-Output "Install bandwhich badwidth tool in rust"
  # Write-Output "https://github.com/imsnif/bandwhich"
  # Write-Output "https://npcap.com/dist/npcap-1.81.exe"
# }



$condition = which pastel
if ($condition)
{
}
else
{
    Write-Output "install pastel color display"
    scoop install pastel
}

# $condition = which Invoke-ScriptAnalyzer
# if ($condition)
# {
# }
# else
# {
 # Write-Output "https://github.com/PowerShell/PSScriptAnalyzer"
 # Write-Output "Install-Module -Name PSScriptAnalyzer -Force"
 # Write-Output "Invoke-ScriptAnalyzer .\Microsoft.PowerShell_profile.ps1"
 # Set-ExecutionPolicy Unrestricted
# Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
# }




$condition = Test-Path -Path "$env:ProgramFiles\figlet4win\figlet.exe"
if ($condition) {
    Set-Alias figlet "$env:ProgramFiles\figlet4win\figlet.exe"
}
else
{
    Write-Output "https://github.com/Ace-Radom/figlet4win/releases/tag/1.0.1"
}




# https://stackoverflow.com/questions/25576159/how-can-i-quickly-get-a-count-of-the-messages-in-a-users-mailbox


# https://github.com/matriex/cmatrix
# Set-Executionpolicy remotesigned
# Import-Module .\cmatrix
# Set-ScreenSaverTimeout -Seconds 5
# Enable-ScreenSaver

# https://opensource.com/article/18/12/linux-toy-aafire

function fire {
  param(
    [int]$Height = 40,
    [int]$Width = 100,
    [int]$Iterations = 100
  )

  for ($i = 0; $i -lt $Iterations; $i++) {
    $fire = @()
    for ($y = 0; $y -lt $Height; $y++) {
      $line = ""
      for ($x = 0; $x -lt $Width; $x++) {
        if ($y -eq $Height - 1) {
          $line += "~"
        } else {
          $rand = Get-Random -Minimum 0 -Maximum 100
          if ($rand -lt 20) {
            $line += " "
          } elseif ($rand -lt 50) {
            $line += "."
          } elseif ($rand -lt 80) {
            $line += "o"
          } else {
            $line += "O"
          }
        }
      }
      $fire += $line
    }
    Clear-Host
    $fire
    Start-Sleep -Milliseconds 100
  }
}

# Install-Module -Name PsMermaidTools -Scope CurrentUser
# https://abbgrade.github.io/PsMermaidTools/

$condition = which gcalcli
if ($condition) {
    Set-Alias gcal gcalcli
    Set-Alias cal gcal
    Set-Alias calendar gcal

    function calw()
    {
        gcalcli calw $($args)
    }
    Set-Alias week calw
    function agenda()
    {
        gcalcli agenda $($args)
    }
    function gcal_web(){
      chrome https://calendar.google.com/calendar/u/0/r/week
    }
    Set-Alias gcalweb gcal_web
    function gcal_config_git(){
        difft $env:localappdata\gcalcli\config.toml $env:OneDrive\Documents\GitHub\config\files\gcal_config.toml
        cp $env:localappdata\gcalcli\config.toml $env:OneDrive\Documents\GitHub\config\files\gcal_config.toml
        cd "$env:OneDrive\Documents\GitHub\config"
        git pull
        git add files\gcal_config.toml
        git commit -m "updated gcalcli configuration"
        git push
        cd -
        }
    function gcal_config_update(){
        cd "$env:OneDrive\Documents\GitHub\config"
        difft  $env:OneDrive\Documents\GitHub\config\files\gcal_config.toml $env:localappdata\gcalcli\config.toml
        cp $env:OneDrive\Documents\GitHub\config\files\gcal_config.toml $env:localappdata\gcalcli\config.toml
        git pull
        cd -
        }}
else
{
    Write-Output "https://github.com/insanum/gcalcli"
    pip install gcalcli --upgrade
    Write-Output "~\AppData\Local\gcalcli\config.toml"
    Write-Output "you will need a token from"
    Write-Output "https://console.cloud.google.com"
}

$condition = which watchexec
if ($condition) {}
else
{
    Write-Output "https://watchexec.github.io/downloads/watchexec/"
}

$condition = which j2lint
if ($condition) {}
else
{
    Write-Output "https://pypi.org/project/j2lint/"
    pip install j2lint
}

$condition = which hugo
if ($condition) {}
else
{
  Write-Output "http://hugo.io/"
	scoop install hugo-extended

}

$condition = which aws
if ($condition) {
	
}
else
{
	  
    Write-Output "https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    Write-Output "https://awscli.amazonaws.com/AWSCLIV2.msi"
    Write-Output "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/windows/SessionManagerPluginSetup.exe"
}




$condition = which termdown
if ($condition) {
}
else
{
	pip install termdown
}

$condition = which ffmpeg
if ($condition) {
}
else
{
  Write-Output "https://www.ffmpeg.org"
	choco install ffmpeg-full
}

function dnd()
    {
        chrome https://scottjbennett.com/ttrpg/dnd/
    }

$condition = which dos2unix
if ($condition) {
}
else
{
	Write-Output "https://sourceforge.net/projects/dos2unix/files/latest/download"
}


$condition = which spt.exe
if ($condition) {
}
else
{
	Write-Output "https://github.com/Rigellute/spotify-tui"
	scoop bucket add scoop-bucket https://github.com/Rigellute/scoop-bucket
  scoop install spotify-tui
}

function lastpass()
    {
        chrome https://lastpass.com/vault/
    }

function owlbear()
    {
        chrome https://scottjbennett.com/owlbear
    }

#  _            _
# | |_ ___   __| | ___
# | __/ _ \ / _` |/ _ \
# | || (_) | (_| | (_) |
#  \__\___/ \__,_|\___/

# add netflify cli

# remove context menu entries
# Disable file locksmith in powertoys
# Disable powerrename in powertoys

# HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions
# https://menumaid.en.softonic.com/download
# https://www.elevenforum.com/t/add-or-remove-edit-in-notepad-context-menu-in-windows-11.20485/

# Remove open with visual studio code
# HKEY_CLASSES_ROOT\Directory\Background\shell
# AnyCode


# jless -- Rust JSON viewer https://jless.io/
# windows support is planned

# https://github.com/sassman/t-rec-rs
# windows support coming soon!