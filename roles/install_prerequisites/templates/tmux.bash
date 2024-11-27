if command -v tmux > /dev/null; then
   alias tm='tmux attach || tmux new'
   if [[ $(tmux list-sessions 2> /dev/null)  ]] && [ ! -n "$TMUX" ]; then
    figlet -f big "TMUX"
    figlet -f small " Session"
    figlet -f small "  Found"
    echo "    connect to it with "
    echo "      tmux attach      "
  fi 
fi
