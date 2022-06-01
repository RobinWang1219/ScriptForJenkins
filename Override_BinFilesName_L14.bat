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

copy "%_WorkingFolder%\Build\Cezanne\RELEASE_VS2015x86_BIN\!ORG_Name!" "%_WorkingFolder%\!ORG_Name!"
if not exist %_TargetFolder% (
  mkdir %_TargetFolder%
)

::::::::::::::::::::::::::::::::::::
:: Get Batch File Url ::
::SET mypath=%~dp0
::SET mypath=%mypath:~0,-1%
:::::::::::::::::::::::


REM for /F "tokens=*" %%A in ('dir /ON /B "%_BinName_ORG%"') do (
REM set ORG_Name=%%A
REM REM set find=!ORG_Name:~0,8!
REM set find=!ORG_Name!
REM call set MOD_Name=%%ORG_Name:!find!=!_BinName_New!%%
REM echo copy "%_WorkingFolder%\!ORG_Name!" to "%_TargetFolder%\!MOD_Name!"
REM copy "%_WorkingFolder%\!ORG_Name!" "%_TargetFolder%\!MOD_Name!"
REM )

powershell -Command "dir !ORG_Name! | Rename-Item -NewName {$_.Basename.Replace($_.BaseName,"!_BinName_New!") + $_.extension}"

:Exit

SETLOCAL DISABLEDELAYEDEXPANSION
@echo on

::echo F|xcopy "%_WorkingFolder%\!ORG_Name!" "%_TargetFolder%\!MOD_Name!" /Y"