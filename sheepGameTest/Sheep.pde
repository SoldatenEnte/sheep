class Sheep {
  PVector pos = new PVector(random(400, 800),random(160, 560));  //Positionsvektor
  PVector v = new PVector();                                     //Bewegungsvektor
  float radius = 15;                                             //Größe des Schafes
  

  Sheep() {
    fill(255);
    stroke(50);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
  //Gibt Position des Schafes aus
  float xposition (){
    return (pos.x);
  }
  float yposition (){
    return (pos.y);
  }
  
  void move() {
    //berechnet Richtung und normalisiert
   if (dist(theDog.xposition(),theDog.yposition(),xposition(),yposition())<=150) {
    v.set (-(theDog.xposition() - pos.x),-(theDog.yposition() - pos.y));
    v.normalize();
    v.mult(1);
    //verrechent Position und Bewegung
    pos.add(v);
  }}
  void draw() {
    fill(255);
    stroke(50);
    strokeWeight(5);
    ellipse(pos.x, pos.y, 2*radius, 2*radius);
  }
}
