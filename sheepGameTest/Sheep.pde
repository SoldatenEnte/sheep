class Sheep {
  PVector pos = new PVector(random(400*vw, 800*vw), random(160*vw, 560*vw));    //Positionsvektor
  PVector v = new PVector();                                        //Bewegungsvektor
  PVector antiCol = new PVector();
  float radius = 30*vw;                                                //Größe des Schafes
  boolean dogChase = true;
  float speed = (1.3*vw)  * 60/frameRate;

  void move() {
    //berechnet Richtung und normalisiert
    //Bewegung, wenn in Reichweite des Hundes
    if (dist(theDog.pos.x, theDog.pos.y, pos.x, pos.y)<= dogTrigger*vw) runAway();
    else randomMovement();

    collision();
    pos.add(v);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(v.heading() + 45);
    imageMode(CENTER);
    image(sheepimg, 0, 0, 2*radius, 2*radius);
    popMatrix();
  }

  void randomMovement() {
    if (dogChase) {
      v.set (random(-10*vw, 10*vw), random(-10*vw, 10*vw));
      v.normalize();
      v.mult(speed * 0.2);
    }
    dogChase = false;
  }

  void runAway() {
    dogChase = true;
    v.set (-(theDog.pos.x - pos.x), -(theDog.pos.y - pos.y));
    v.normalize();
    v.mult(speed);
  }

  void collision() {
    for (int i = sheep.size()-1; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      if (dist(aSheep.pos.x, aSheep.pos.y, pos.x, pos.y) < radius*2) {
        antiCol.set(-(aSheep.pos.x - pos.x), -(aSheep.pos.y - pos.y));
        antiCol.normalize();
        antiCol.mult(radius*2 - dist(aSheep.pos.x, aSheep.pos.y, pos.x, pos.y));
      } else {
        antiCol.set(0, 0);
      }
      pos.add(antiCol);
    }
  }
}
