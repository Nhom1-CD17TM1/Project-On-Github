cls
@ECHO OFF
title Folder Private
if EXIST "Folder Protector" goto UNLOCK
if NOT EXIST Private goto MDLOCKER
:CONFIRM
echo Are you sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren Private "Folder Protector"
attrib +h +s "Folder Protector"
echo Folder locked
goto End
:UNLOCK
echo Enter password to unlock folder
set/p "pass=>"
if NOT %pass%== 123 goto FAIL
attrib -h -s "Folder Protector"
ren "Folder Protector" Private
echo Folder Unlocked successfully
goto End
:FAIL
echo Invalid password
goto end
:MDLOCKER
md Private
echo Private created successfully
goto End
:End