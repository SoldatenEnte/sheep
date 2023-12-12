/*Die Klasse für den Hund/Spielercharakter
 */


class Dog {
  PVector pos = new PVector(0, 0);                //Positionsvektor
  PVector v = new PVector();                      //Bewegungsvektor
  float speed = 5*vw;                             //Geschwindigkeit des Hundes
  float radius = 20*vw;                           //Größe des Hundes
  float barkTime = 2;

  void reset() {
    pos.set (0, 0);
  }

  void move() {
    if  (dist(mouseX, mouseY, pos.x, pos.y) > 5*vw) {
      //berechnet Richtung des Bewegungsvektors und normalisiert
      v.set ((mouseX - pos.x), (mouseY - pos.y));
      v.normalize();
      v.mult(speed);
      //verrechent Position und Bewegung
      pos.add(v);
    }
  }
  void draw() {
    barkCoolDown -= 1/frameRate;
    if (barked) {
      barkTime -= 1/frameRate;
      if (barkTime <= 0) {
        barked = false;
        barkTime = 2;
      }
    }
    //imageMode(CENTER);
    //image(dogimg, pos.x, pos.y, 3*radius, 3*radius);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(v.heading() + 45);
    imageMode(CENTER);
    image(dogimg, 0, 0, 3*radius, 3*radius);
    popMatrix();
  }

  // Hundbellen Darstellung und Timer
  void bark () {
    if (barked == true) {
      dogBark.play();
      textSize (50*vw);
      fill (255, 0, 0);
      text ("!", pos.x+10*vw, pos.y+10*vw);
    }
  }
}
