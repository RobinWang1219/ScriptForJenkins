::MMDD_hhmm_sha«e¤­½X
@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set GetCommitTime="C:\Program Files\Git\bin\git.exe" show -s --format=%%cd --date=format:%%Y%%m%%d_%%H%%M
set GetCommitSha="C:\Program Files\Git\bin\git.exe" show -s --format=%%h

%GetCommitTime% %GIT_COMMIT% > CommitTime.txt
set /p _CommitTime=<CommitTime.txt
%GetCommitSha% %GIT_COMMIT% > CommitSha.txt
set /p _CommitSha=<CommitSha.txt
set _FileName=%_CommitTime%_%_CommitSha:~0,5%
echo _FileName=%_FileName% > _FileName.txt

SETLOCAL DISABLEDELAYEDEXPANSION
@echo on

::echo set _FileName_New=%_FileName% >> Env.bat