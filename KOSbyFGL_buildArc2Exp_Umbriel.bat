REM Verwendet wird ant. Voraussetzung ist also das Java Ant - Tool installiert ist.
REM Unbedingt mit call aufrufen, sonst werden nachfolgende Anweisungen nicht mehr ausgeführt.
echo start Arc2Exp fuer Umbriel

call ant -buildfile KOSbyFGL_buildArc2Exp_Umbriel.xml

echo Ende Arc2Exp fuer Umbriel
pause
REM timeout /T 20 /nobreak