class Wolf {
  PVector pos = new PVector();                 //Positionsvektor
  PVector v   = new PVector();                 //Bewegungsvektor

  float radius = 10;                           //Größe des Wolfs

  Wolf (float x, float y) {
    pos.set(x, y);
    fill (100);
    stroke (150);
    strokeWeight(5);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Gibt Position des Wolfes aus
  float xposition () {
    return (pos.x);
  }
  float yposition () {
    return (pos.y);
  }

  void reset() {
    pos.set(width, height);
  }

  void move() {
    PVector sheepPos = new PVector();
    float maxDist = 5000;
    for (int i = sheepCount; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      if (dist(aSheep.xposition (), aSheep.yposition (), pos.x, pos.y) < maxDist) {
        maxDist = dist(aSheep.xposition (), aSheep.yposition (), pos.x, pos.y);
        sheepPos.set(aSheep.xposition (), aSheep.yposition ());
      }
    }
    v.set (sheepPos.x - pos.x, sheepPos.y - pos.y);
    v.normalize();
    v.mult(0.6);
    pos.add(v);
  }

  void draw() {
    fill (100);
    stroke (150);
    strokeWeight(5);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}
