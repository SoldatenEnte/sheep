class Wolf {
  PVector pos = new PVector();                 //Positionsvektor
  PVector v   = new PVector();                 //Bewegungsvektor

  float radius = 20*vw;                           //Größe des Wolfs
  boolean wolfEating = false;
  float eatCoolDown = 1;
  float speed = 1*vw;

  Wolf (float x, float y) {
    pos.set(x, y);
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
    float maxDist = 5000*vw;
    boolean dogChase = false;

    if (wolfEating == false) {

      if ( barked == true ) {
         if (dist(theDog.pos.x, theDog.pos.y, pos.x, pos.y) <= 100*vw) {
        dogChase = true;
      }
        if (dogChase == true) {
          v.set (-(theDog.pos.x - pos.x), -(theDog.pos.y - pos.y));
          v.normalize();
          v.mult(speed * 1.5);
        }
        dogChase = false;
      } else {
        for (int i = sheep.size()-1; i >= 0; i--) {
          Sheep aSheep = sheep.get(i);
          if (dist(aSheep.pos.x, aSheep.pos.y, pos.x, pos.y) < maxDist) {
            maxDist = dist(aSheep.pos.x, aSheep.pos.y, pos.x, pos.y);
            sheepPos.set(aSheep.pos.x, aSheep.pos.y);
          }
        }
        v.set (sheepPos.x - pos.x, sheepPos.y - pos.y);
        v.normalize();
        v.mult(speed);
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
