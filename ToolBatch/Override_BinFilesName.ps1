# @echo off

if ($args[0] -eq $null) {exit 1}
if ($args[1] -eq $null) {exit 1}
if ($args[2] -eq $null) {exit 1}

Get-Content "_FileName.txt" | Foreach-Object{
   $var = $_.Split('=')
   New-Variable -Name $var[0] -Value $var[1]
}
if (${_FileName} -eq $null) {exit 1}

#::::::::::::::::::::::::::::::::::::
$_WorkingFolder=$args[0]
$_BinName_ORG=$args[1]
$_TargetFolder=$args[2]
#$_BinName_New=$args[3]

# Trim spaces from the end of a string via substitution
$_BinName_New=$_FileName.Trim()+(Get-Item $_WorkingFolder\$_BinName_ORG).Extension

# Rename the output bin file
# Rename-Item ${_BinName_ORG} ${_BinName_New}

# Copy bios bin file to specific folder
if (!(Test-Path -Path ${_TargetFolder})) { New-Item -Path ${_TargetFolder} -ItemType Directory }
Copy-Item ${_WorkingFolder}\${_BinName_ORG} ${_TargetFolder}\${_BinName_New}

# @echo on
