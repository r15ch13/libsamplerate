@ECHO OFF
REM Echos a windows pathname in short form without spaces
REM    example:
REM       shortname.cmd "C:\Program Files\"
REM    returns:
REM       C:\PROGRA~1
echo %~s1
