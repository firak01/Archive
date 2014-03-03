REM Verwendet wird ant. Voraussetzung ist also das Java Ant - Tool installiert ist.
REM Unbedingt mit call aufrufen, sonst werden nachfolgende Anweisungen nicht mehr ausgeführt.
echo start Exp2Art fuer Umbriel

call ant -buildfile KOSbyFGL_buildExp2Arc_Umbriel.xml

echo Ende Exp2Arc fuer Umbriel
pause
REM timeout /T 20 /nobreak