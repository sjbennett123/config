#!/bin/bash
if  command -v exa > /dev/null; then
        alias ls='exa --git --color-scale'
        alias ll='exa -l --git --color-scale'
        alias lt='exa --git --tree --color-scale'
        alias lll='exa --git --extended --long --color-scale'
else
        alias ll='ls -l'
fi
