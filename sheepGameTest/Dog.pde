/*Die Klasse für den Hund/Spielercharakter
 */


class Dog {
  PVector pos = new PVector(0, 0);                //Positionsvektor
  PVector v = new PVector();                      //Bewegungsvektor
  float speed = 5;                                //Geschwindigkeit des Hundes
  float radius = 20;                              //Größe des Hundes


  Dog() {
    fill(#6F540B);
    stroke(#5D3403);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
  //Gibt Position des Hundes aus
  float xposition () {
    return pos.x;
  }

  float yposition () {
    return pos.y;
  }
  void reset() {
    pos.set (0, 0);
  }

  void move() {
    //berechnet Richtung des Bewegungsvektors und normalisiert
    v.set ((mouseX - pos.x), (mouseY - pos.y));
    v.normalize();
    v.mult(speed);
    //verrechent Position und Bewegung
    pos.add(v);
  }
  void draw() {
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

      textSize (50);
      fill (255, 0, 0);
      text ("!", pos.x+10, pos.y+10);

      time -= 1/frameRate;
      if (time <= 0) {
        barked = false;
        time = 5;
      }
    }
  }
}
