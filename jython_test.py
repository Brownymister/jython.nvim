from gamegrid import *

FENSTER_BREITE = 800
FENSTER_HOEHE = 800

makeGameGrid(FENSTER_BREITE,
             FENSTER_HOEHE,
             1,
             Color.black,
             False,
             keyRepeated=keyCallback)

setTitle("OOPong")
addStatusBar(20)
setStatusText(
    "Leertaste zum starten druecken. Linker Spieler (w&s); Rechter Spieler (i&k)"
)
