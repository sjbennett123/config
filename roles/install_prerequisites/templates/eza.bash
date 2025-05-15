#!/bin/bash
if command -v eza > /dev/null ; 
then
        alias ls='eza --git --color-scale --hyperlink --group-directories-first'
        alias ll='eza -l --git --color-scale --hyperlink --group-directories-first'
        alias lt='eza --git --tree --color-scale --hyperlink --group-directories-first'
        alias lll='eza --git --extended --long --color-scale --hyperlink --group-directories-first'
else
        alias ll='ls -l'
fi
