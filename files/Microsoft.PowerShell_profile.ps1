# https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
# To turn off powershell autocomplete
Set-PSReadLineOption -PredictionSource None
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force

Set-Alias typora "$env:ProgramFiles\Typora\Typora.exe"
Set-Alias env_edit $env:ProgramFiles\powertoys\winui3apps\powertoys.environmentvariables.exe
#     _______ __ 
#   / ____(_) /_
#  / / __/ / __/
# / /_/ / / /_  
# \____/_/\__/  
#               
# https://git-scm.com/download/win
# make sure that the bin for git is inthe PATH so you get the Tig git history viewer
# add  C:\Users\AAA3AZZ\AppData\Local\Programs\Git\bin\ to path
# <git-install-root>\etc\gitconfig

function blame()
    {
        tig blame $($args)
    }

# https://github.com/dahlbyk/posh-git
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
# 
Set-Alias ghd github

# Fix an alias for FD so that it searches hidden files.

function fd()
    {
        fd-find --hidden $($args)
    }

function fdg()
    {
        fd-find $($args)
    }
    
# Difftastic
# https://github.com/Wilfred/difftastic/releases/download/0.53.1/difft-x86_64-pc-windows-msvc.zip
# https://difftastic.wilfred.me.uk/git.html
# git config --global diff.external difft

# https://github.com/cli/cli/releases/download/v2.43.1/gh_2.43.1_windows_amd64.msi

# https://www.nerdfonts.com
Import-Module Terminal-Icons

# https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-i686-pc-windows-msvc.zip

# https://github.com/junegunn/fzf/releases/download/0.32.1/fzf-0.32.1-windows_amd64.zip
# add to windows path
# add windows environment variable 
# Variable Name: fzf_default_opts 
# Variable Value: --height 40% --border
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

function history_full()
    {
        cat (Get-PSReadlineOption).HistorySavePath
    }
Set-Alias history history_full

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias?view=powershell-7.4

Set-Alias which where.exe

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
        explorer .
    }

function gr()
    {
        cd "$(git rev-parse --show-toplevel)"
    }

# ~/AppData/Local/nvim/init.vim
# let g:loaded_perl_provider = 0
# C:\Users\AAA3AZZ\AppData\Local\nvim/init.lua
# https://github.com/dense-analysis/ale
Set-Alias vim nvim.exe
Set-Alias vi nvim.exe

Set-Alias typora "$env:ProgramFiles\Typora\Typora.exe"

Set-Alias fb "$env:ProgramFiles\Caprine\Caprine.exe"
Set-Alias messenger "$env:ProgramFiles\Caprine\Caprine.exe"

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

Set-Alias chrome "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"

function standup()
    {
        chrome https://mmodal.atlassian.net/wiki/spaces/OCDI/pages/1218314379/OCDI+Standup+Agenda
    }
function twa()
    {
        chrome https://mmodal.atlassian.net/wiki/spaces/OCDI/pages/1218019437/Onboarding+Team+Working+Agreement+Definition+of+Ready+Definition+of+Done+CapEx
    }
    
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
    }
# https://curlie.io/
# curl.exe -A "MS" https://webinstall.dev/curlie | powershell

# https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Windows_x86_64.zip

Set-Alias g glow

function dropbox()
    {
      cd c:\Users\deadk\Dropbox
    }

function repo()
    {
        cd $env:OneDrive\Documents\GitHub
    }
function dl()
    {
        cd $env:homedrive\$env:homepath\Downloads\
    }
    
function desktop()
    {
        cd $env:OneDrive\Desktop\
    }

# https://github.com/eza-community/eza/releases/download/v0.17.0/eza.exe_x86_64-pc-windows-gnu.tar.gz




function ll()
    {
        eza -l --git --icons --all $($args)
    }

function lt()
    {
        eza --tree --git --icons --all $($args)
    }

Set-Alias ls eza

Set-Alias -Name dir -Value eza -Option AllScope

# add nmap dir to path C:\Program Files (x86)\Nmap
Set-Alias -Name nc -Value ncat -Option AllScope

# add notepad++ dir to path C:\Program Files\Notepad++
Set-Alias n notepad++
Set-Alias np notepad++
Set-Alias notepad notepad++
Set-Alias n++ notepad++

# https://gigenet.dl.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-setup.exe
# add C:\Program Files (x86)\GnuWin32\bin\ to path

# alacritty --version
# https://github.com/alacritty/alacritty/releases
# https://alacritty.org/config-alacritty.html
# %APPDATA%\alacritty\alacritty.toml

# https://jqlang.github.io/jq/

# https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-i686-pc-windows-msvc.zip

# https://github.com/phiresky/ripgrep-all
# https://github.com/phiresky/ripgrep-all/releases/download/v0.10.6/ripgrep_all-v0.10.6-x86_64-pc-windows-msvc.zip
# https://github.com/oschwartz10612/poppler-windows/releases/download/v24.08.0-0/Release-24.08.0-0.zip

# https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-i686-pc-windows-msvc.zip

# https://www.python.org/downloads/
# add to path
# C:\Program Files\Python312\Scripts\
# C:\Users\AAA3AZZ\AppData\Roaming\Python\Python312\site-packages\pre_commit
# https://pre-commit.com/#install

Set-Alias python C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python
Set-Alias python.exe C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python

# Jira cli
# https://github.com/ankitpokhrel/jira-cli/releases/download/v1.5.1/jira_1.5.1_windows_x86_64.zip
# uses api token from https://id.atlassian.com/manage-profile/security/api-tokens
# Set JIRA_API_TOKEN env variable
# jira init
# for server enter 
# https://mmodal.atlassian.net
# Set JIRA_PAGER env variable to bat or glow if you like! C:\Windows\System32\bat.exe C:\Windows\System32\glow.exe


function j()
    {
        jira issue list -q "project IN ('CHLAB','CHPROD','HCC','ECHO','DECOM') AND assignee IN (currentUser()) AND status != Closed"
    }
    
function jh()
    {
        jira issue list --history -q "project IN ('CHLAB','CHPROD','HCC','ECHO','DECOM')"
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

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
# Remember to add the hcc and ocdi repos to your PATH
Set-Alias tunnel tunnel.ps1
Set-Alias ocditunnel ocditunnel.ps1

# https://github.com/atanunq/viu/releases

# https://github.com/nickgerace/gfold/releases
Set-Alias gf gfold

# https://mmodal.atlassian.net/wiki/spaces/HCC/pages/42436191/Get+things+to+work+with+3M+s+custom+CA


Set-Alias s start

# fzfenabled
# FED_PASSWORD
# FED_USERNAME
# Path

function path_check()
    {
        echo "tig"
        which tig
        echo "alacritty"
        which alacritty
        echo "touch"
        which touch
        echo "git"
        which git
        echo "fzf"
        which fzf
        echo "nvim"
        which nvim
        echo "notepad++"
        which notepad++
        echo "notepad++"
        which touch
        which difft
        # scoop install jq
        which jq
        which eza
        which gh
        which glow
        echo "ncat"
        which ncat
        # https://nmap.org/dist/ncat-portable-5.59BETA1.zip
        which rg
        which onefetch
    }
    
# Onefetch
# https://github.com/o2sh/onefetch/releases
Set-Alias of onefetch
# Set-Alias nc netcat

# Control Panel
Set-Alias system_properties sysdm.cpl

# https://learn.microsoft.com/en-us/windows/powertoys/environment-variables

Set-Alias env_edit $env:ProgramFiles\powertoys\winui3apps\powertoys.environmentvariables.exe
Set-Alias env_config env_edit 
#git add .; git commit -m updates; git push

# sudo apt install neofetch
# iwr -useb get.scoop.sh | iex
# scoop install neofetch


function ocdi_version($env)
    {
    if ($env -eq "ci") {
            curl -s https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info | jq .
    }
    if ($env -eq "gi") {
            curl -s https://ocdi.ucd-gi.us.amz.3mhis.net/ocdi-services-backend/actuator/info | jq .
    }
    else {
            Write-Host ("tomato")
          }
    }

# git config --global --type bool push.autoSetupRemote true


function nexus()
    {
    chrome https://nexus.udapp-appsec.us.amz.3mhis.net/#browse/browse:hcbg-docker-us-east-1-hosted-sandbox
    }

# https://github.com/mikefarah/yq
# scoop install yq
function yaml2json($yamlfile)
    {
        yq -o=json '.'  $yamlfile
    }
function json2yaml($jsonfile)
    {
            cat $jsonfile | yq -y
    }

# git config --system core.longpaths true
# pip install dice


# scoop install czkawka
function dup()
    {
        czkawka.exe dup  --directories .
    }
