class Wolf {
  PVector pos = new PVector();                 //Positionsvektor
  PVector v   = new PVector();                 //Bewegungsvektor

  float radius = 20;                           //Größe des Wolfs
  boolean wolfEating = false;
  float eatCoolDown = 1;

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
    boolean dogChase = false;

    if (wolfEating == false) {

      if ( barked == true ) {
         if (dist(theDog.xposition(), theDog.yposition(), pos.x, pos.y) <= 100) {
        dogChase = true;
      }
        if (dogChase == true) {
          v.set (-(theDog.xposition() - pos.x), -(theDog.yposition() - pos.y));
          v.normalize();
          v.mult(1.5);
        }
        dogChase = false;
      } else {
        for (int i = sheepCount; i >= 0; i--) {
          Sheep aSheep = sheep.get(i);
          if (dist(aSheep.xposition (), aSheep.yposition (), pos.x, pos.y) < maxDist) {
            maxDist = dist(aSheep.xposition (), aSheep.yposition (), pos.x, pos.y);
            sheepPos.set(aSheep.xposition (), aSheep.yposition ());
          }
        }
        v.set (sheepPos.x - pos.x, sheepPos.y - pos.y);
        v.normalize();
        v.mult(1);
      }

      pos.add(v);
    }
  }

  void draw() {
    //imageMode(CENTER);
    //image(wolfimg, pos.x, pos.y, 3*radius, 3*radius);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(v.heading() + 45);
    imageMode(CENTER);
    image(wolfimg, 0, 0, 3*radius, 3*radius);
    popMatrix();
    if (wolfEating == true) {
      eatCoolDown -= 1/frameRate;
      if ( eatCoolDown <= 0) {
        wolfEating = false;
        eatCoolDown = 1;
      }
    }
  }
}
