@ECHO OFF&SET MYD=%PROGRAMFILES%\MyDefrag v4.3.1\MyDefrag.exe
IF NOT EXIST "%MYD%" SET MYD=MyDefrag.exe
IF NOT EXIST "%MYD%" ECHO MyDefrag not found! Put the file to MyDefrag install directory.&PAUSE&EXIT/B
SET FOLDER=%1&SET FILE=%~dp0\_tmp.MyD
IF [%1]==[] CALL:Drop 
CALL:Defrag %FOLDER%&EXIT/B
:Drop
ECHO Drag and drop your game folder and press enter:&set /p FOLDER=&GOTO:EOF
:Zone
SET S=%S% FileSelect %~1 FileActions %~2 FileEnd&GOTO:EOF
:Defrag
FOR %%A IN ("%~1") DO SET DIR=%%~nxA
SET C=SetFileColor(&SET M=Message("Zone %%1u of %%2u", "
SET S=Title("GameDirDefrag.bat") WindowSize(Fixed) WhenFinished(Exit) %M%Defragmenting game folder: %DIR%")
SET S=%S% %C%All,33,25,25) %C%Selected,17,112,91) %C%Processed,41,119,10)
SET S=%S% VolumeSelect CommandlineVolumes() VolumeActions
CALL:Zone "DirectoryPath('%~1')" SortByName(Ascending)
SET Q=Defragment rest of the drive
VER | FIND "XP">nul
IF "%ERRORLEVEL%"=="0" ( SET /P A=%Q% [Y,N]? ) ELSE ( CHOICE /M "%Q%" )
IF DEFINED A CALL:Check
GOTO:%ERRORLEVEL%
:1
SET S=%S% %M%Defragmenting disk")
CALL:Zone SelectNtfsSystemFiles(yes) "PlaceNtfsSystemFiles(Ascending,MftSize * 0.01)"
CALL:Zone Directory(yes) FastFill()
CALL:Zone All "Defragment(Fast) Defragment() FastFill()"
:2
SET S=%S% VolumeEnd
ECHO %S%>"%FILE%"
START "" "%MYD%" "%FILE%" %~d1&ping 1.1.1.1 -n 1 -w 1000>NUL
DEL "%FILE%"&GOTO:EOF
:Check
SET ERRORLEVEL=2
IF /I "%A%"=="Y" SET ERRORLEVEL=1