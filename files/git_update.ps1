#!/usr/bin/env powershell -File
$gitdirs = Get-ChildItem -Directory

foreach ($dir in $gitdirs)
{
  Set-Location $dir
  $is_git_directory = git rev-parse --is-inside-work-tree 2>$null
  if ($is_git_directory -eq "true") {
    git fetch --all -q
    git pull --all  -q
    Set-Location ..
  }
}
