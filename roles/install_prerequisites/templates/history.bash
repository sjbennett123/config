# history
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000000
export HISTFILESIZE=100000000000
export HISTCONTROL=ignorespace
shopt -s histappend
PROMPT_COMMAND='history -a'
