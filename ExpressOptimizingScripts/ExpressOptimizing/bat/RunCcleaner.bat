@echo off
echo Running Ccleaner..
cd /d %programfiles%/ccleaner
IF DEFINED ProgramFiles(x86) (
START "Ccleaner" /WAIT CCLEANER64 /auto
) ELSE (
START "Ccleaner" /WAIT CCLEANER /auto
)
exit