@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

if "%1" == "" goto Exit
if "%2" == "" goto Exit
if "%3" == "" goto Exit
if "%4" == "" goto Exit

::::::::::::::::::::::::::::::::::::
set _WorkingFolder=%1
set _BinName_ORG=%2
set _TargetFolder=%3
set _BinName_New=%4
:: Trim spaces from the end of a string via substitution
set _BinName_New=%_BinName_New%##
set _BinName_New=%_BinName_New: ##=%
set _BinName_New=%_BinName_New:##=%


if not exist %_TargetFolder% (
  mkdir %_TargetFolder%
)

::::::::::::::::::::::::::::::::::::
:: Get Batch File Url ::
::SET mypath=%~dp0
::SET mypath=%mypath:~0,-1%
:::::::::::::::::::::::


for /F "tokens=*" %%A in ('dir /ON /B "%_BinName_ORG%"') do (
set ORG_Name=%%A
set find=!ORG_Name:~0,8!
call set MOD_Name=%%ORG_Name:!find!=!_BinName_New!%%
echo copy "%_WorkingFolder%\!ORG_Name!" to "%_TargetFolder%\!MOD_Name!"
copy "%_WorkingFolder%\!ORG_Name!" "%_TargetFolder%\!MOD_Name!"
)

:Exit

SETLOCAL DISABLEDELAYEDEXPANSION
@echo on

::echo F|xcopy "%_WorkingFolder%\!ORG_Name!" "%_TargetFolder%\!MOD_Name!" /Y"