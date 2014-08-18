@echo off
attrib -r %windir%\Prefetch\Layout.ini
IF %ERRORLEVEL% NEQ 0 (
ECHO ERROR: Cannot access the layout.ini file!
ECHO If you have UAC enabled give permission for the current user to access
ECHO the layout.ini file or the %windir%\Prefetch folder.
GOTO:END
)
echo Updating the prefetched files list, the layout.ini file.. 
echo This can take a while..
start /wait Rundll32.exe advapi32.dll, ProcessIdleTasks & echo Updated.
attrib +r %windir%\Prefetch\Layout.ini & echo Layout.ini file attribute set to read only.
:END
timeout /t 5
exit