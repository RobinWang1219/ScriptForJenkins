::YYYYMMDD_hhmm_rev
@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set GetCommitTime="C:\Program Files\TortoiseSVN\bin\svn.exe" info --show-item last-changed-date
set GetCommitRev="C:\Program Files\TortoiseSVN\bin\svn.exe" info --show-item last-changed-revision

%GetCommitTime% > CommitTime.txt
set /p _CommitTime=<CommitTime.txt
set _CommitTime=%_CommitTime:~0,4%%_CommitTime:~5,2%%_CommitTime:~8,2%_%_CommitTime:~11,2%%_CommitTime:~14,2%
%GetCommitRev% > CommitRev.txt
set /p _CommitRev=<CommitRev.txt
set _FileName=%_CommitTime%_%_CommitRev%
echo _FileName=%_FileName% > _FileName.txt

SETLOCAL DISABLEDELAYEDEXPANSION
@echo on

::echo set _FileName_New=%_FileName% >> Env.bat