#!/usr/bin/env powershell -File

$gitdirs = Get-ChildItem -Directory
foreach ($dir in $gitdirs)
{
  cd $dir
  git pull -q
  cd ..
}