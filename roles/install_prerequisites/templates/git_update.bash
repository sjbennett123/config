#!/bin/bash

for dir in */; do
  cd "$dir" || exit ; 
  git pull -q; 
  cd ~-  || exit; 
done
