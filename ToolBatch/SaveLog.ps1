# @echo off

if ($args[0] -eq $null) {exit 1}
if ($args[1] -eq $null) {exit 1}

Get-Content "_FileName.txt" | Foreach-Object{
   $var = $_.Split('=')
   New-Variable -Name $var[0] -Value $var[1]
}
if (${_FileName} -eq $null) {exit 1}

#::::::::::::::::::::::::::::::::::::
$_WorkingFolder=$args[0]
# $_BinName_ORG=$args[1]
$_TargetFolder=$args[1]
#$_BinName_New=$args[3]
$_BuildHistory="BuildHistory.txt"

# Trim spaces from the end of a string via substitution
# $_BinName_New=$_FileName.Trim()+(Get-Item $_WorkingFolder\$_BinName_ORG).Extension
$_BinName_New=$_FileName.Trim()

# Rename the output bin file
# Rename-Item ${_BinName_ORG} ${_BinName_New}

if (!(Test-Path -Path ${_TargetFolder}\${_BuildHistory})) { New-Item -Path ${_TargetFolder}\${_BuildHistory} -ItemType File }

# Copy bios bin file to specific folder
If (!(Get-Childitem -Path "${_TargetFolder}\${_BinName_New}*.*")) { 
  # Get-Content ${_TargetFolder}\${_BuildHistory} -replace 'org', 'mod' | Out-File -encoding ASCII ${_TargetFolder}\${_BuildHistory}
  Add-Content ${_TargetFolder}\${_BuildHistory} "${_BinName_New}=FAIL"
} Else {
  $_SEL= (Select-String -Path ${_TargetFolder}\${_BuildHistory} -Pattern "${_BinName_New}=FALSE" )
  If (${_SEL} -eq $null) {
    Add-Content ${_TargetFolder}\${_BuildHistory} "${_BinName_New}=PASS"
  } Else {
    (Get-Content ${_TargetFolder}\${_BuildHistory}) -replace "${_BinName_New}=FALSE", "${_BinName_New}=PASS" | Out-File -encoding ASCII ${_TargetFolder}\${_BuildHistory}
  }
  
}

# @echo on
