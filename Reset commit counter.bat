@echo off

cd "C:\Github staging area\How-to-inflate-your-commits-"
SET BRANCH=master

git checkout %BRANCH%

:: Step 1: Clear out the files
echo. > "file.txt"
echo. > "file.py"

:: Step 2: Commit and push the cleared files
git add file.txt file.py
git commit -m "Clear out file.txt and file.py"
git push origin %BRANCH%

:: Step 3: Show current commit history
echo -------------------------------
echo Current commit history:
git log --oneline
echo -------------------------------

:: Step 4: Squash all commits into one
echo Finding root commit hash...
git rev-list --max-parents=0 HEAD > root_commit.txt
set /p FIRST_COMMIT=<root_commit.txt
echo First commit hash is: %FIRST_COMMIT%
if "%FIRST_COMMIT%"=="" (
    echo [ERROR] Could not determine the first commit hash.
    pause
    exit /b 1
)
del root_commit.txt

echo Running: git reset --soft %FIRST_COMMIT%
git reset --soft %FIRST_COMMIT%

:: Generate a random commit message
SET /A rand=%RANDOM% %% 5
SET COMMENT=

IF %rand%==0 SET COMMENT=A new start
IF %rand%==1 SET COMMENT=Reset
IF %rand%==2 SET COMMENT=Fresh start
IF %rand%==3 SET COMMENT=New origin
IF %rand%==4 SET COMMENT=History collapsed

:: Commit the changes with a random message
git commit -m "%COMMENT%"

:: Force-push the squashed commit
git push origin %BRANCH% --force

echo -------------------------------
echo Final commit history:
git log --oneline
echo -------------------------------

pause