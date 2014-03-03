REM Verwendet wird ant. Voraussetzung ist also das Java Ant - Tool installiert ist.
REM Unbedingt mit call aufrufen, sonst werden nachfolgende Anweisungen nicht mehr ausgeführt.
echo start Exp2Art fuer Patton

call ant -buildfile KOSbyFGL_buildExp2Arc_Patton.xml

echo Ende Exp2Arc fuer Patton
pause
REM timeout /T 20 /nobreak

