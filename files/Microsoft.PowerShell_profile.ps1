# https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
# To turn off powershell autocomplete
Set-PSReadLineOption -PredictionSource None
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force

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

Import-Module posh-git


# Difftastic
# https://github.com/Wilfred/difftastic/releases/download/0.53.1/difft-x86_64-pc-windows-msvc.zip
# https://difftastic.wilfred.me.uk/git.html
# git config --global diff.external difft

# https://github.com/cli/cli/releases/download/v2.43.1/gh_2.43.1_windows_amd64.msi

Import-Module Terminal-Icons

# https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-i686-pc-windows-msvc.zip

# https://github.com/junegunn/fzf/releases/download/0.32.1/fzf-0.32.1-windows_amd64.zip
# add to windows path
# add windows environment variable 
# Variable Name: fzf_default_opts 
# Variable Value: --height 40% --border
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

Set-Alias which where.exe

function env()
    {
        Get-ChildItem env:
    }
    
function pwd()
    {
        powershell -Command pwd
    }
function e()
    {
        explorer .
    }
    
Set-Alias neovim nvim.exe
Set-Alias vim nvim.exe
Set-Alias vi nvim.exe

# https://3mhealth.atlassian.net/wiki/spaces/HIS/pages/12995020/Fed+Statically+Compiled+Federation+CLI
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

# https://curlie.io/
# curl.exe -A "MS" https://webinstall.dev/curlie | powershell

# https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Windows_x86_64.zip

Set-Alias g glow

function repo()
    {
        cd 'C:\Users\AAA3AZZ\OneDrive - Solventum\Documents\GitHub\'

    }

# https://github.com/eza-community/eza/releases/download/v0.17.0/eza.exe_x86_64-pc-windows-gnu.tar.gz
function ll()
    {
        eza -l --git --icons --all
    }

function lt()
    {
        eza --tree --git --icons --all
    }
Set-Alias ls eza
Set-Alias -Name dir -Value eza -Option AllScope

# https://gigenet.dl.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-setup.exe
# add C:\Program Files (x86)\GnuWin32\bin\ to path

# alacritty --version
# https://github.com/alacritty/alacritty/releases
# %APPDATA%\alacritty\alacritty.toml

# https://jqlang.github.io/jq/

# https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-i686-pc-windows-msvc.zip

# https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-i686-pc-windows-msvc.zip

# https://www.python.org/downloads/

Set-Alias python C:\Users\AAA3AZZ\AppData\Local\Programs\Python\Python312\python

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
function chlab()
    {
        jira issue list -q "project IN ('CHLAB') AND status != Closed AND component IN ('HCC-Collaborate','HCC Collaborate','CAPD')"
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

Set-Alias tunnel tunnel.ps1

# https://github.com/atanunq/viu/releases

# https://github.com/nickgerace/gfold/releases

# https://mmodal.atlassian.net/wiki/spaces/HCC/pages/42436191/Get+things+to+work+with+3M+s+custom+CA

