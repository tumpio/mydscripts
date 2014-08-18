@ECHO OFF
ECHO Running automatic Games Directory list generation..
ECHO.
SET LIST=%~2
:Loop
FOR /F "TOKENS=1* DELIMS=/" %%A IN ("%LIST%") DO (
  IF NOT "%%A"=="0" ECHO Processing: %%A & CALL dirMyD /S %1 %%A
  SET LIST=%%B
  ECHO.
)
IF NOT "%LIST%"=="" GOTO :Loop
ECHO Finishing list generation..
CALL dirMyD scr
EXIT /B