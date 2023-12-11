/*Eine Klasse zum schnellen erstellen von verschieden Leveln*/



class Level {
  int wolfStart;
  int sheepStart;
  float levelTimer;

  Level(int a, int b, float c) {
    wolfStart = a;
    sheepStart = b;
    levelTimer = c;
  }

  void set() {
    //set() setzt die timer und die Anzahl von Wölfen und Schafen auf die in Level() angegebenen Werte
    
    timer = levelTimer;
    sheepCount = sheepStart;
    wolfCount = wolfStart;
    //spawnt Wölfe
    for (int i = wolfCount; i>=0; i--) {
      wolf.add(new Wolf(random(0, width), height));
    }
    //spawnt Schafe
    for (int i = sheepStart; i>=0; i--) {
      sheep.add(new Sheep());
    }
  }

  void reset() {
    //reset() leert nach dem Ende des Levels die Listen für Schafe und Wölfe und setzt den Spielercharakter zurück
    for (int i = sheepCount; i>=0; i--) {
      sheep.remove(i);
    }
    for (int i = wolfCount; i>=0; i--) {
      wolf.remove(i);
    }
    theDog.reset();
  }

  void draw() {
    // draw() enthält alle Funktionen der anderen Objekte, die in der Haupt-draw-Schleife nötig sind
    //Der Hund
    theDog.move();
    theDog.draw();

    //die Schafe
    kill();
    for (int i = sheepCount; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      aSheep.move();
      aSheep.draw();
    }

    //der Wolf
    for (int i = wolfCount; i >= 0; i--) {
      Wolf aWolf = wolf.get(i);
      aWolf.move();
      aWolf.draw();
    }
  }
}
