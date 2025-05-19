#!/usr/bin/env powershell -File
$gitdirs = Get-ChildItem -Directory
foreach ($dir in $gitdirs)
{
  Set-Location $dir
  git pull -q
  Set-Location ..
}
