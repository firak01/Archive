//KOS Dokumentation:
https://github.com/Erendrake/KOS/blob/master/README.md

//Folgende zwei Dateien gehören in das Repository und sind über GIT zu speichern.
//Die zu pflegende Liste mit den KOS Befehlen (autocomplete) über die Tasten strg + space liegt hier:
C:\Program Files (x86)\Notepad++\plugins\APIs\KOSbyFGL.xml

Dabei ist zu beachten, dass nur Unterstriche als Trennmöglichkeit der "Klasse" und der "Methode" möglich ist.
Alle andereren Sonderzeichen - inklusive Punkt - führen zu einem Compilier/Interpreterfehler im KOS - Interpreter.


Die Datei mit den benutzerdefinierten Sprachen liegt hier:
C:\Users\lindhaueradmin\AppData\Roaming\Notepad++\userDefineLang.xml
Die Sprache wird aber als KOSbyFGL.udl aus dem Repository importiert und wieder exportiert.




//######################################
//###### TODO : Ausprobieren ##################
 CTRL + SHIFT + X soll den KOS Terminal schliessen.

 //###########
 Sensoren abfragen:
  The sensor suffix has been renamed to "sensors".
    So instead of "print ship:sensor:acc:mag" you have to use "print ship:sensors:acc:mag" 

#########################
Einen Node setzen:
when I'm trying to set a node if I do add node (time+30,0,0,400). it tells me that time does not return a number value. if I do add node (0,0,0,400). it makes a node 3 hours in the past... did the behavior of this change or am I doing something wrong?
try node (time:seconds+30,0,0,400) instead. 
//######################################
//Klappt um tipparbeit zu sparen
You can still reference Archie as volume 0. I doubt we would change that as there is no need, and it is a nice convenience

//Merke: Aenderungen, die an den Dateien gespeichert werden, werden sofort auch in ein laufendes Programm uebernommen. 
//           Das scheint aber nicht für das "Hauptprogramm" zu gelten.

//Merke: Fehlermeldungszeilen bestehen aus Leerzeichenzeilen plus den Zeilen der aufgerufenen Programme

//#########################################
//##### PROGRAMME ########## ################
# Werden mit run ... gestartet.

# Aufruf- und Namensstruktur als Konvention:
job... => prg...=> sub...=> fun...
Merke: Code auf Jobebene kann nicht "on the fly im laufenden Program geändert werden, sonst schon."

lang... dient der Deklaration von Konstanten und globalen Variablen für den "Kernel".
          Darin definierte Konstanten haben lang als Präfix.
		  
lib... dient der deklaration von constanten und globalen variablen. Muss mit "run" eingebunden werde, am besten auf Job-Ebene, da ja global.
       Darin definierte Konstanten haben lib als Präfix.
	   
test... Kennzeichnet spezielle Testfunktionen, die mit der API arbeiten.

_ Kennzeichnet private Programme, z.B. _OBJECT_isList.txt
      Hier wird Code ausgeführt, der nicht von woanders aufgerufen werden soll. 
	  Im Beispiel wird beim Testen der Datentypen ein gewollter Fehler erzeugt.
	  Im eigentlichen Programm wird dann die Consolenfehlerausgabe wieder gelöscht.
	  
ABSCDE_yxc.txt Kennzeichnet "Klassen und deren 'statische Methoden'"	   


#Übergabewerte als Konvention:
Eingabewert von prg ist eine LIST beliebigen Namens.
Eingabewerte von fun sind frei definiert und auch beliebige Namen.
Nur prg und fun geben Werte zurück. 
Rückgabewert von prg ist eine LIST namens prgXyz. An erster Stelle steht ein StatusKey: prgXyz:STATUS mit den Werten TRUE, FALSE, ERROR
                                                                               weitere Stellen der Liste können dann noch gefüllt werden.
Rückgabewert von fun ist beliebiger Wert.


# Allgemeion gilt für Übergabeparameter von Funktionen:
//FRAGE: Können die Paramternamen von denen der übergebenen Variablennamen abweichen?
//FGL:     DAS IST NUR BEIM ersten Paramter der Fall, die anderen müssen den gleichen Namen haben "sind also global"



###########################################
######### VARIABLEN #######################
//Alle Variablen sind global, so dass sie nicht explizit einer Methode uebergeben werden muessen.
//ABER: In einer Funktion eine Variable hochzaehlen, in einer Schleife
Schleifenstart ....
z.B. set icount to icount +1.
dann unterfunktion aufrufen
run mySub().
Schleifenende. Zurück zum Start.

In der Unterfuntion den Wert ausgeben lassen, funktioniert.
print icount.

wieder zurück und die unterfunktion neu aufrufen.
ABER: icount wird nicht verändert sein!!!!

Noch schlimmer: Nach dem Rücksprung in die Hauptfunktion hat iCount wieder den alten Wert!!!
Variablentausch bietet keine Lösung.
Einzige LÖSUNG: Deklariere eine globale Variable in einem anderen Program.
              z.B. set langCountGlobal to 0.
---------------------------------------------------------------------------------------

// Strings, die einer Zahl entsprechen können ausgedruckt werden.
// und auf deren wert kann "gewartet" werden.
set sZahl to "2".
wait sZahl. 


###################################################
######## Funktionen zum Testen der Datentypen #####
Da es keine Möglichkeit gibt einen Fehler abzufangen, muss man wie folgt verfahren:
Man muss mit einem "gewollten Fehler" arbeiten. Im Fehlerfall wird das Programm zwar abgebrochen
aber es wird im aufrufenden Programm fortgefahren. 
Dort kann ein ReturnWert, der am Anfang des Programms in einer globalen Variablen gespeichert ist abgeprüft werden. 
Dieser Returnwert wird erst den "false-Fall" beinhalten. Funktioniert der Test, wird er mit "true" ersetzt.
Merke: Damit die oben in der Console stehenden Fehlerzeilen nicht stören, 
       lagert man den eigentlichen Test in einem PRIVATEN Programm aus. 
       Solch ein Private Program wird mit einem beginnenden Unterstrich gekennzeichnet und heisst so wie das Ausgangsprogramm.


Beispiele: Object - Klasse
OBJECT_isList
OBJECT_isNumeric

############################################
######### LISTEN ###########################
//Merke:
https://github.com/erendrake/KOS/wiki/List
//SET FOO TO LIST().   // Creates a new list in FOO variable
//SET FOO:ADD TO 5.    // Adds a new element to the end of the list
//SET FOO:ADD TO ALTITUDE. // eg 10000
//SET FOO:ADD TO ETA:APOAPSIS. // eg 30 
//FOR BAR IN FOO { PRINT BAR. }. // Prints 5, then 10000, then 30
//PRINT BAR. // ERROR, BAR doesn't exist outside the for statement

//Listen gehen so:
set args TO LIST().
set args:ADD to libLaunchSpeedMin.  //Startgeschwindigkeit
set x to 2334234.
set args:ADD to x.

set t to args:LENGTH.
set iIndex to -1.
set iIndexToReturn to 0.
if iIndexToReturn < 1 {
run printDebug("7").
	for argIn IN args {
	print "8". wait 1.
		set iIndex to iIndex + 1.
		if iIndex = iIndexToReturn {
		print "9". wait 1.
		set constLaunchSpeedMin to argIn.
		print "10". wait 1.
		break. }.
	}.
}.
//Merke: argIn ist ausserhalb der liste nicht deklariert.

############################
Gezielt auf ein Element der Liste zugreifen:
set iIndexMax to countList#0.

Maybe its the thing called "ITERATOR" that does it, but if so it's not mentioned how to use it anywhere on the page.
I Added index grammar along with the list and it actually took quite a bit of work so of course I failed to include it in the docs
SET foo TO bar#3.

alternatively you can use a variable to index into a list
SET blarg TO 3.
SET foo TO bar#blarg.

Unfortunately, I don't have the following statement working yet.
SET bar#3 TO "foo"
the ITERATOR is a structure that was built before I added the FOR command


//#########################################
Man kann eine Liste als Parameter übergeben
Folgends gibt für den Parameter a2 (eine liste), lediglich den 
Namen der C# Klasse System.GenericCollection.... zurück

set a2 to LIST().
set b2 to LIST().

set iIndex to -1.
set iIndexToReturn to 5.
set iTemp to 0.
if iIndexToReturn >= 1 {
	run printDebug("starte schleife lists").
	for argIn IN argsIn {		
		set iIndex to iIndex + 1.
		if iIndex = 0 {
			run printDebug("try to copy list 'a'").
			set a2 TO argIn:COPY.
			run printDebug("list 'a' copied").
			run printDebug("a2="+a2).
			wait 10.
			print "Anzahl von parametern in a2= " + a2:LENGTH.
		}.
		if iIndex = 1 {
			run printDebug("try to copy list 'b'").
			set b2 TO argIn:COPY.
			run printDebug("list 'b' copied").
			run printDebug("b2="+b2).
			print "Anzahl von parametern in b2= " + b2:LENGTH.
		}.
	}.
}.

##########################################
Man kann die elemente einer Liste auch nicht über den Index ansprechen.
run printDebug("argsIn[0]="+argsIn[0]).

TODO: Ausprobieren:

##########################################
//o.k. es kann nur 1 Parameter String/zahl sinnvoll übergeben werden!
//Die übergebenen Parameter müssen nicht extra Deklariert werden. 
//Nur die Übernahme der Parameter muss mit DECLARE PARAMETER angezeigt werden.
run printCaller (langCallerName).
############################################

//Verbesserung:
//Man kann auch eine Liste übergeben.
set args TO LIST().
set args:ADD to libLaunchSpeedMin.  //Startgeschwindigkeit
set x to "testparam 1".
set y to "testparam 2".
set args:ADD to x.
set args:ADD to y.
run prgPlaneStart (args).

//und in dem Programm
//die so übergebenen Werte kann man in einer Schleife durchgehen.
set iIndex to -1.
set iIndexToReturn to 5.
set iTemp to 0.
if iIndexToReturn >= 1 {
	run printDebug("starte schleife").
	for argIn IN argsIn {
		run printDebug("Wert: " + argIn). //argIn gilt nur innerhalb der Schleife...
		set iIndex to iIndex + 1.
		if iIndex = 1 {
			set constLaunchSpeedMin to argIn.
			run printDebug("Speed = " + constLaunchSpeedMin).
		}.
		if iIndex = 2 {
			run printDebug("param 1 = " + argIn).
		}.
		if iIndex = 3 {
			run printDebug("param 2 = " + argIn).
		}.
	}.
}.


//Aber: Man kann sie nicht explizit abfragen:
//Dies gibt die Fehlermeldung: "Suffix liblaunchspeedmin not found."
print "was ist launchspeedmin". wait 5.
set test to argsIn:libLaunchSpeedMin.
print test. wait 5.



print "was ist launchspeedmin". wait 5.
set test to argsIn:libLaunchSpeedMin.
print test. wait 5.






#################################################



//Hinweis: Weitere rudimentaere Befehle
//https://github.com/Erendrake/KOS
https://github.com/erendrake/KOS/wiki/LIST
https://github.com/erendrake/KOS/wiki/Vessel


	

    Quote Originally Posted by togfox View Post
    How do I determine compass heading from eular notation?
    Here's how I'd try to solve it. (Caveat: I haven't tested this. This is just how I'd try to solve it if I was trying to):

    Step 1: Get the tfDirtoUnitV and tfXYZtoENU programs I put on the Wiki here. Using tfXYZtoENU (which in turn calls tfDirToUnitV, which is why you need both of them) you can take any arbitrary vector in the underlying KSP's X,Y,Z axes and get what that vector would be if it was expressed in a frame of reference in which the axes were along your current East, North, and Up directions.
    Thus instead of having 3 scalars representing the X component, Y component, and Z component of your vector, you can instead have 3 scalars representing the East component, North component, and Up component.

    Step 2: Use tfXYZtoENU to obtain the East,North,Up of your current SURFACE velocity. (Note, depending on what you're trying to do with it you might be interested in the ORBITAL velocity instead. But I suspect you're doing something with the surface velocity if its something where you care about compass heading. The compass heading you get from the surface velocity will be different from the compass heading you get from the orbital velocity in all cases other than exactly 90 degrees (or 270 degrees if going faster than the planet's rotation. If going slower than the planet rotation then a 270 orbital heading will flip to a 90 surface heading).

    Step 3: If you think about it, a compass heading is a case of doing trigonometry in which North is the X axis and East is the Y axis. (0 = north, 90 degrees = east, 180 degrees = negative north (south) and 270 degrees = negative wast (west). Therefore you can get your compass heading by plugging the North and the East components of your velocity vector into ARCTAN2().

    If interested, you can do the same sort of thing to get your pitch but first you need the length of the velocity vector projected onto the east/north plane. Use the pathagorean theorem on just the east and north components (without the Up component) to get the length of that projection, then plug it into ARCTAN2() along with the Up component to get the pitch (you are obtaining the angle between the direction you're actually going with the Up component present versus the direction you would have been going had the Up component been zero.) 
	
	
	
	
	

