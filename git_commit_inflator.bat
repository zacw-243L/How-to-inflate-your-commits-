@echo off
:: Change directory to the specified Git repository
cd "C:\Github staging area\How-to-inflate-your-commits-"

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
