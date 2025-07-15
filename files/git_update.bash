#!/bin/bash
for dir in */; do
  cd "$dir" || exit ; 
  if [[ -n "$(git status -s 2> /dev/null)" ]]; then
    git fetch --all -q;
    git pull --all -q; 
  fi
  cd ~-  || exit; 
done
