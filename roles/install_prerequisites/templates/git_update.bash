#!/bin/bash
set -x
for dir in */; do
  cd "$dir" || exit ; 
  if [[ $(git branch 2> /dev/null)  ]]; then 
    git fetch --all -q
    git pull --all -q;
  fi
  cd ~-  || exit; 
done
