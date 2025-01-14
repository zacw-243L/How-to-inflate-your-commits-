@echo off
:: Ensure only one instance of this script runs
:: Create a unique mutex using a temporary file
set "lockfile=%TEMP%\git_commit_inflator.lock"
if exist "%lockfile%" exit
echo %date% %time% > "%lockfile%"

:: Change directory to the specified Git repository
cd "C:\Github staging area\git comit inflator"

:: Ensure the branch name is correct (replace master with your branch if needed)
SET BRANCH=master

:: Loop to continuously update the file, commit, and push
:loop
    :: Suppress LF to CRLF warnings for this repository
    git config core.autocrlf false

    :: Generate a random line of text and append it to the file
    echo %RANDOM% >> file.txt

    :: Stage the file
    git add file.txt

    :: Commit the changes with a message including the current timestamp
    git commit -m "Update made at %date% %time%"

    :: Push the commit to the correct branch
    git push origin %BRANCH%

    :: Wait for 1 second before the next iteration
    timeout /t 1 >nul
goto loop

:: Cleanup the lockfile on exit
:cleanup
del "%lockfile%"
exit
