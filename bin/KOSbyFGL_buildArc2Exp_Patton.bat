REM Verwendet wird ant. Voraussetzung ist also das Java Ant - Tool installiert ist.
REM Unbedingt mit call aufrufen, sonst werden nachfolgende Anweisungen nicht mehr ausgeführt.
echo start Arc2Exp fuer Patton

call ant -buildfile KOSbyFGL_buildArc2Exp_Patton.xml

echo Ende Arc2Exp fuer Patton
pause
REM timeout /T 20 /nobreak