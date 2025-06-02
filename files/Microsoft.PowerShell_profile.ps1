#!/usr/bin/env powershell -File
# https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.5

# To reload the powershell profile run & $profile

Set-Alias -Name which -Value Get-Command
Set-Alias -Name cron -Value taskschd.msc
Set-Alias -Name ifconfig -Value ipconfig

$condition = where.exe python
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
# https://www.python.org/downloads/
# add to path
# C:\Program Files\Python312\Scripts\
# C:\Users\AAA3AZZ\AppData\Roaming\Python\Python312\site-packages\pre_commit
# PYTHONPATH
# PYTHONHOME
# C:\Users\AAA3AZZ\AppData\Roaming\Python\Python313\Scripts

# $condition = Test-Path -Path "C:\Python313"
# if ($condition) {
# Set-Alias python C:\Python313\python
# }

# Set-Alias python.exe C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python

Function touch
{
    $file = $args[0]
    if($null -eq $file) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        Write-Output $null > $file
    }
}


$condition = where.exe tail
if ($condition) {
}
else
{
  Write-Output "Add GNU utilities for Win32"
  Write-Output "https://unxutils.sourceforge.net"
}
$condition = where.exe choco
if ($condition) {
}
else
{
  Write-Output "https://chocolatey.org/install"
  Write-Output "https://community.chocolatey.org/api/v2/package/chocolatey"
}

$condition = where.exe scoop
if ($condition) {
}
else
{
  Write-Output "https://scoop.sh"
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

$condition = where.exe less
if ($condition) {
}
else
{
  scoop install less
}

$condition = where.exe bat
if ($condition) {
}
else
{
  scoop install bat
}

function history_full()
    {
        Get-Content (Get-PSReadlineOption).HistorySavePath
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
# git config --global credential.helper "store"
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"

$condition = where.exe tig
if ($condition) {
    function blame()
        {
            tig blame $($args)
        }
    Set-Alias annotate blame
}
else
{
  Write-Output "https://gitforwindows.org"
  Write-Output "make sure that the bin for git is in the PATH"
  Write-Output "so you get the tig git history viewer"
  Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Git\bin\ to path"
  Write-Output "C:\Users\AAA3AZZ\AppData\Local\Programs\Git\cmd"
}

# https://github.com/dahlbyk/posh-git
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Import-Module PSCalendar
# Install-PSResource PSCalendar
# https://github.com/jdhitsolutions/PSCalendar
$condition = where.exe github
if ($condition) {
  Set-Alias ghd github
}
else
{
  Write-Output "install github desktop"
}

$condition = where.exe fd-find
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

$condition = where.exe difft
if ($condition) {
}
else
{
  Write-Output "Install Difftastic the fantastic diff tool"
  Write-Output "https://github.com/Wilfred/difftastic/releases/download/0.53.1/difft-x86_64-pc-windows-msvc.zip"
  Write-Output "https://difftastic.wilfred.me.uk/git.html"
  Write-Output "git config --global diff.external difft"
}



# https://www.nerdfonts.com
Import-Module Terminal-Icons
# scoop bucket add nerd-fonts
# scoop install Cascadia-Code


$condition = where.exe bat
if ($condition) {
}
else
{
  Write-Output "# https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-i686-pc-windows-msvc.zip"
}

$condition = where.exe rustc
if ($condition) {
}
else
{
  Write-Output "install rust"
}

$condition = where.exe fzf
if ($condition) {
    Import-Module PSFzf
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
  Write-Output "Variable Value: --height 40% --border --bind '?:toggle-preview' --preview-window=:hidden"
}

# To turn off powershell autocomplete
Set-PSReadLineOption -PredictionSource None
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+k -Function DeleteToEnd
(Get-PSReadLineOption).HistorySearchCaseSensitive = $false

# https://github.com/PowerShell/psreadline
# Make it so that Control D exits a powershell window
# https://learn.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.5

function gum()
    {
        # Get the latest metadata
        $current_branch = git rev-parse --abbrev-ref HEAD
        git fetch
        git switch main
        git pull -q
        git switch $current_branch
        git merge main
    }

$condition = where.exe gh
if ($condition) {
}
else
{
   Write-Output "https://cli.github.com/"
   Write-Output "https://github.com/cli/cli/releases/download/v2.43.1/gh_2.43.1_windows_amd64.msi"
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
        # gh run list -b main -L 1
    }
Set-Alias gha ga

function gb()
    {
        gh browse
    }

function e()
    {
        explorer .
    }
function explorer_restart()
    {
            Get-Process Explorer | Stop-Process
            Start-Process Explorer
    }


function gr()
    {
        Set-Location "$(git rev-parse --show-toplevel)"
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

$condition = where.exe nvim
if ($condition) {
  Set-Alias vim nvim.exe
  Set-Alias vi nvim.exe
}
else
{
  # let g:loaded_perl_provider = 0
  # https://gist.github.com/jeffcasavant/6ff061d5fd32ed3a7d3eb27639cd223f
  Write-Output "https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-win64.msi"
  Write-Output "https://github.com/neovide/neovide/releases/download/0.15.0/neovide.msi"
}

$condition = Test-Path $env:LOCALAPPDATA\nvim\init.vim -PathType Leaf
if ($condition) {
}
else
{
     Write-Output "create your init.vim at the following location"
     Write-Output "$env:LOCALAPPDATA\nvim\init.vim"
     
   # https://github.com/dense-analysis/ale
}

$condition = Test-Path -Path "$env:ProgramFiles\Typora\Typora.exe"
if ($condition) {
    Set-Alias typora "$env:ProgramFiles\Typora\Typora.exe"
}
# C:\Users\AAA3AZZ\AppData\Local\Programs\Caprine
$condition = where.exe Caprine.exe
if ($condition) {
    Set-Alias -Name fb -Value "Caprine.exe"
    Set-Alias -Name messenger -Value "Caprine.exe"
}
else
{
  Write-Output "https://github.com/sindresorhus/caprine"
  Write-Output "https://github.com/sindresorhus/caprine/releases/latest"
}


# https://3mhealth.atlassian.net/wiki/spaces/HIS/pages/12995020/Fed+Statically+Compiled+Federation+CLI
# https://teams.microsoft.com/l/channel/19%3Aa683a8d136774d7ebb297da5d09b6ab7%40thread.tacv2/Fed%20-%20Support?groupId=fc1db881-0935-4edc-9869-c7a4f3f1977e&tenantId=c3bf4e61-4ab4-4b2b-bd3a-fc85c7a1c0f1
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

function onedrive()
    {
        chrome https://3mhealth-my.sharepoint.com
    }

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
        Copy-Item $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1
        Set-Location "$env:OneDrive\Documents\GitHub\config"
        # Install-PSResource -Name PSScriptAnalyzer -Reinstall
        # https://learn.microsoft.com/en-us/powershell/utility-modules/psscriptanalyzer/overview?view=ps-modules
        # Invoke-ScriptAnalyzer files/Microsoft.PowerShell_profile.ps1
        git pull -q
        git add files\Microsoft.PowerShell_profile.ps1
        git commit -m "updated Powershell configuration"
        git push
        Set-Location -
    }

function config_update()
    {
        Set-Location $env:OneDrive\Documents\GitHub\config
        git pull -q
        Set-Location -
        difft $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
        Copy-Item  $env:OneDrive\Documents\GitHub\config\files\Microsoft.PowerShell_profile.ps1 $env:OneDrive\Documents\Powershell\Microsoft.PowerShell_profile.ps1
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
    $condition = Test-Path -Path "$env:USERPROFILE/.cache"
    if ($condition) {
      Set-ItemProperty -Path "$env:USERPROFILE/.cache" -Name Attributes -Value Hidden
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

function ssh_config_update()
    {
        Set-Location $env:OneDrive\Documents\GitHub\config
        git pull -q
        Set-Location -
        difft $env:OneDrive\Documents\GitHub\config\files\ssh_config $env:homepath\.ssh\config
        Copy-Item $env:OneDrive\Documents\GitHub\config\files\ssh_config $env:homepath\.ssh\config
    }

function ssh_config_git()
    {
        difft $env:homepath\.ssh\config $env:OneDrive\Documents\GitHub\config\files\ssh_config
        Copy-Item $env:homepath\.ssh\config $env:OneDrive\Documents\GitHub\config\files\ssh_config
        Set-Location "$env:OneDrive\Documents\GitHub\config"
        git pull -q
        git add files\ssh_config
        git commit -m "updated Solventum ssh configuration"
        git push
        Set-Location -
    }

$condition = where.exe glow
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
      Set-Location $env:homedrive\$env:homepath\Dropbox
    }

function paper()
    {
      chrome https://www.dropbox.com/paper
    }

function repo()
    {
        Set-Location $env:OneDrive\Documents\GitHub\$($args)
    }

function stat()
    {
      Get-Item $($args) | Format-List
    }

function repo_update()
    {
        Set-Location $env:OneDrive\Documents\GitHub\
        $gitdirs = Get-ChildItem -Directory
        foreach ($dir in $gitdirs)
        {
          Set-Location $dir
          git pull -q
          Set-Location ..
        }
        Set-Location -
    }

function gitc()
    {   
        Set-Location "$(git rev-parse --show-toplevel)";
        git pull -q;
        git add .;
        git commit -m updates;
        git push;
        cd -;
    }

function downloads()
    {
        Set-Location $env:homedrive\$env:homepath\Downloads\
    }
Set-Alias dl downloads


function desktop()
    {
        Set-Location $env:homedrive\$env:homepath\Desktop\
    }
Set-Alias desk desktop

function pictures()
    {
        Set-Location $env:OneDrive\Pictures\
    }
Set-Alias pics pictures

$condition = where.exe eza
if ($condition) {
    Set-Alias ls eza
    Set-Alias -Name dir -Value eza -Option AllScope
    function ll()
    {
        eza -l --git --icons --hyperlink --group-directories-first $($args)
    }
    function ld()
    {
        eza -l --git --icons --total-size --hyperlink --group-directories-first$($args)
    }
    function lt()
    {
        eza --tree --git --icons --hyperlink $($args)
    }
}
else
{
    Write-Output "install the LS alterantive eza"
    Write-Output "https://github.com/eza-community/eza/releases/download/v0.21.3/eza.exe_x86_64-pc-windows-gnu.zip"ll
}

$condition = where.exe notepad++.exe
if ($condition) {
    Set-Alias n notepad++.exe
    Set-Alias np n
    Set-Alias notepad n
    Set-Alias n++ n
}
else
{
    Write-Output "https://notepad-plus-plus.org/downloads/"
    Write-Output "add to path"
    Write-Output "C:\Program Files\Notepad++"
}
$condition = where.exe wget.exe
if ($condition) {

}
else
{
    Write-Output "https://gigenet.dl.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-setup.exe"
    Write-Output "add C:\Program Files (x86)\GnuWin32\bin\ to path"
}


$condition = where.exe alacritty
if ($condition) {
    function alacritty_config()
        {
            alacritty --version
            Write-Output "https://github.com/alacritty/alacritty/release"b
            chrome https://alacritty.org/config-alacritty.html
            Start-Process $env:APPDATA\alacritty\alacritty.toml
        }
}
else
{
    Write-Output "Install the Alactritty Terminal"
    Write-Output "https://github.com/alacritty/alacritty/releases"
}

$condition = where.exe jq
if ($condition) {
}
else
{
    Write-Output "Install jq JSON Parser"
    Write-Output "https://jqlang.github.io/jq/"
    Write-Output "scoop install jq"
}

$condition = where.exe rg
if ($condition) {
}
else
{
    Write-Output "Install Ripgrep search tool"
    Write-Output "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-i686-pc-windows-msvc.zip"
}

$condition = where.exe jira
if ($condition) {
}
else
{
    Write-Output "install the ira cli"
    Write-Output "https://github.com/ankitpokhrel/jira-cli/releases/download/v1.5.1/jira_1.5.1_windows_x86_64.zip"
    Write-Output "uses api token from https://id.atlassian.com/manage-profile/security/api-tokens"
    Write-Output "Set JIRA_API_TOKEN env variable"
    Write-Output "jira init"
    Write-Output "for server enter"
    Write-Output "https://mmodal.atlassian.net"
    Write-Output "Set JIRA_PAGER env variable to bat or glow if you like!"
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

function jenny()
    {
        jira issue list -q "project IN ('OCDI','HCC') and assignee = '70121:4978c4d9-686d-41d9-9c16-8dfe84615137' and status NOT IN ('closed','resolved')" --order-by updated
    }

function jenny_ocdi()
    {
        jira issue list -q "project IN ('OCDI') and assignee = '70121:4978c4d9-686d-41d9-9c16-8dfe84615137' and status NOT IN ('closed','resolved')" --order-by updated
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
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate','CAPD') and key NOT IN('CHPROD-46823','CHPROD-48189')"
    }

function chprod_hcc()
    {
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate')"
    }

function chprod_capd()
    {
        jira issue list -q "project IN ('CHPROD') AND status != Closed AND component IN ('CAPD') and key and key NOT IN('CHPROD-46823','CHPROD-48189') "
    }

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
Set-Alias ocdi_tunnel ocditunnel.ps1



$condition = where.exe gfold
if ($condition) {
  Set-Alias gf gfold
}
else
{
  Write-Output "git clone https://github.com/nickgerace/gfold.git; cd gfold; cargo install"
}

# https://mmodal.atlassian.net/wiki/spaces/HCC/pages/42436191/Get+things+to+work+with+3M+s+custom+CA

Set-Alias s start

$condition = where.exe onefetch
if ($condition) {
  Set-Alias of onefetch
}
else
{
  Write-Output "https://github.com/o2sh/onefetch/releases"
}

$condition = where.exe onefetch
if ($condition) {
  Set-Alias of onefetch
}
else
{
  Write-Output "https://github.com/o2sh/onefetch/releases"
}

$condition = where.exe ncat
if ($condition) {
  Set-Alias nc ncat
}
else
{
  Write-Output "Install Netcat"
  Write-Output "https://nmap.org/ncat/"
}


$condition = where.exe neofetch
if ($condition) {
  Set-Alias nf neofetch
}
else
{
  scoop install neofetch
}

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
    Write-Output ("curls endpoints and gives the current version.")
    Write-Output ("Current options are gi https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info")
    Write-Output ("Current options are ci https://ocdi.ucd-ci.us.amz.3mhis.net/ocdi-services-backend/actuator/info")

  }
    }

function nexus()
    {
    chrome https://nexus.udapp-appsec.us.amz.3mhis.net/#browse/browse:hcbg-docker-us-east-1-hosted-sandbox
    }


$condition = where.exe yq
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
        Get-Content $jsonfile | yq -P >> $jsonfile_dot_yaml
        dos2unix -q $jsonfile_dot_yaml
    }

$condition = where.exe roll
if ($condition){
}
else
{
    pip install dice
}


$condition = where.exe chafa
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


$condition = where.exe scoop
if ($condition)
{}
else
{
Write-Output "https://scoop.sh"
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

$condition = where.exe chafa
if ($condition)
{
    Set-Alias img chafa
}
else
{
  Write-Output "chafa image viewer"
  Write-Output "https://github.com/hpjansson/chafa"
  scoop install chafa
}

$condition = where.exe magick
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

$condition = where.exe curl
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

$condition = where.exe pastel
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

$condition = where.exe gcalcli
if ($condition) {
    Set-Alias gcal gcalcli
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
        # 
        difft $env:localappdata\gcalcli\config.toml $env:OneDrive\Documents\GitHub\config\files\gcalcli_config.toml
        Copy-Item $env:localappdata\gcalcli\config.toml $env:OneDrive\Documents\GitHub\config\files\gcalcli_config.toml
        Set-Location "$env:OneDrive\Documents\GitHub\config"
        git pull -q
        git add files\gcal_config.toml
        git commit -m "updated gcalcli configuration"
        git push
        Set-Location -
        }
    function gcal_config_update(){
        Copy-Item "$env:OneDrive\Documents\GitHub\config"
        difft  $env:OneDrive\Documents\GitHub\config\files\gcalcli_config.toml $env:localappdata\gcalcli\config.toml
        Copy-Item $env:OneDrive\Documents\GitHub\config\files\gcalcli_config.toml $env:localappdata\gcalcli\config.toml
        git pull -q
        Set-Location -
        }}
else
{
    Write-Output "https://github.com/insanum/gcalcli"
    pip install gcalcli --upgrade
    Write-Output "~\AppData\Local\gcalcli\config.toml"
    Write-Output "you will need a token from"
    Write-Output "https://console.cloud.google.com"
    Write-Output "In Microsoft Terminal"
    Write-Output "gcalcli init"
}


$condition = Get-Service ssh-agent | Where-Object {$_.Status -eq "Stopped"}
if ($condition) {
    Write-Output "Start the ssh agent service"
    Write-Output "open services and start the service and set the startup type to Automatic"
    Write-Output "OpenSSH Authentication Agent"
}


$condition = where.exe watchexec
if ($condition) {}
else
{
    Write-Output "https://watchexec.github.io/downloads/watchexec/"
}

$condition = where.exe pre-commit
if ($condition) {
}
else
{
    Write-Output "https://pre-commit.com/"
    # https://pre-commit.com/#install
    # https://github.com/pre-commit/pre-commit.com/blob/main/sections/advanced.md
    Write-Output  "Set environment variable to skip ansible lint"
    Write-Output  "SKIP=ansible-lint"
    pip install pre-commit
}

$condition = where.exe j2lint
if ($condition) {}
else
{
    Write-Output "https://pypi.org/project/j2lint/"
    pip install j2lint
}

$condition = where.exe hugo
if ($condition) {}
else
{
  Write-Output "http://hugo.io/"
  scoop install hugo-extended
}

$condition = Get-Command session-manager-plugin.exe
if ($condition) {
function ssm {
        param($profile, $instanceid)
        
        if ($profile -eq 830301468378){
          Set-Variable -Name "profile" -Value "us-catalyst-dev"
        }
        if ($profile -eq 316401171432){
          Set-Variable -Name "profile" -Value "us-catalyst-nonprod-phi"
        }
        if ($profile -eq 557690604736){
          Set-Variable -Name "profile" -Value "us-ocdi-prod-phi"
        }
        if ($profile -eq 030442966757){
          Set-Variable -Name "profile" -Value "3mhis-catalyst"
        }
        if ($profile -eq 692859943168){
          Set-Variable -Name "profile" -Value "us-ocdi-non-prod-non-phi"
        }
        aws ec2 describe-tags --profile $profile --filters "Name=resource-id,Values=$instanceid" "Name=key,Values=Name" |jq -r .Tags[].Value
        aws ssm start-session --profile $profile --target $instanceid
    }
}
else
{
    Write-Output "install the session manager plugin"
    Write-Output "https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-windows.html"
    Write-Output "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/windows/SessionManagerPluginSetup.exe"
}
$condition = where.exe aws
if ($condition) {
  
}
else
{
    Write-Output "https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    Write-Output "https://awscli.amazonaws.com/AWSCLIV2.msi"
    Write-Output "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/windows/SessionManagerPluginSetup.exe"
}

$condition = where.exe termdown
if ($condition) {
}
else
{
  pip install termdown
}


# C:\Users\AAA3AZZ\AppData\Local\Postman
# choco install postman


$condition = where.exe ffmpeg
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

$condition = where.exe yamllint
if ($condition) {
}
else
{
  pip install yamllint
}

$condition = where.exe dos2unix
if ($condition) {
}
else
{
  Write-Output "https://sourceforge.net/projects/dos2unix/files/latest/download"
}

$condition = where.exe git
if ($condition) {
}
else
{
  Write-Output "install git"
}

$condition = where.exe spt.exe
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

# https://crates.io/crates/du-dust


# $condition = which netlify
# if ($condition) {
# }
# else
# {
#	npm set strict-ssl false
#  npm install -g netlify-cli
# }

#  _            _
# | |_ ___   __| | ___
# | __/ _ \ / _` |/ _ \
# | || (_) | (_| | (_) |
#  \__\___/ \__,_|\___/

# https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/

# remove context menu entries
# Disable file locksmith in powertoys
# Disable powerrename in powertoys

# HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions
# https://menumaid.en.softonic.com/download
# https://www.elevenforum.com/t/add-or-remove-edit-in-notepad-context-menu-in-windows-11.20485/

# Remove open with visual studio code
# HKEY_CLASSES_ROOT\Directory\Background\shell
# HKEY_CLASSES_ROOT\Directory\shell\
# DELETE KEY ----- AnyCode


# Remove open Git Gui Here and Git Bash Here
# delete the below keys
# HKEY_CLASSES_ROOT\Directory\shell\git_gui
# HKEY_CLASSES_ROOT\Directory\shell\git_shell
# HKEY_CLASSES_ROOT\LibraryFolder\background\shell\git_gui
# HKEY_CLASSES_ROOT\LibraryFolder\background\shell\git_shell
# HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_gui
# HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_shell

# jless -- Rust JSON viewer https://jless.io/
# windows support is planned

# https://github.com/sassman/t-rec-rs
# windows support coming soon!



# https://sshx.s3.amazonaws.com/sshx-x86_64-pc-windows-msvc.zip
