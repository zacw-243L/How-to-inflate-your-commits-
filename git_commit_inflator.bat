@echo off
:: Change directory to the specified Git repository
cd "C:\Github staging area\git comit inflator"

:: Loop to continuously update the file, commit, and push
:loop
    :: Generate a random line of text and append it to the file
    echo %RANDOM% >> file.txt

    :: Stage the file
    git add file.txt

    :: Commit the changes with a message including the current timestamp
    git commit -m "Update made at %date% %time%"

    :: Push the commit to the remote repository
    git push origin main

    :: Wait for 1 second before the next iteration
    timeout /t 1 >nul
goto loop
