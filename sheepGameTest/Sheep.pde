class Sheep {
  PVector pos = new PVector(random(400, 800), random(160, 560));    //Positionsvektor
  PVector v = new PVector();                                        //Bewegungsvektor
  PVector antiCol = new PVector();
  float radius = 15;                                                //Größe des Schafes
  boolean dogChase = true;

  Sheep() {
    fill(255);
    stroke(50);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
  //Gibt Position des Schafes aus
  float xposition () {
    return (pos.x);
  }
  float yposition () {
    return (pos.y);
  }

  void move() {
    //berechnet Richtung und normalisiert
    if (dist(theDog.xposition(), theDog.yposition(), xposition(), yposition())<=200) {
      dogChase = true;
      v.set (-(theDog.xposition() - pos.x), -(theDog.yposition() - pos.y));
      v.normalize();
      v.mult(1);
    } else {
      if (dogChase) {
        v.set (random(-10, 10), random(-10, 10));
        v.normalize();
        v.mult(0.2);
      }
      dogChase = false;
    }
    for (int i = sheepCount; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      if(dist(aSheep.xposition(), aSheep.yposition(), pos.x, pos.y) < radius*2){
        antiCol.set(-(aSheep.xposition() - pos.x), -(aSheep.yposition() - pos.y));
        //antiCol.normalize();
        //antiCol.mult(2);
      }else {
        antiCol.set(0, 0);
      }
    }
    //verrechent Position und Bewegung
    //v.add(antiCol);
    pos.add(v);
    pos.add(antiCol);
  }
  void draw() {
    fill(255);
    stroke(50);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
}
