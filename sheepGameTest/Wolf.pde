class Wolf {
  PVector pos = new PVector(width, height);    //Positionsvektor
  PVector v   = new PVector();                 //Bewegungsvektor
  float radius = 10;                           //Größe des Wolfs
  
  Wolf () {
    fill (100);
    stroke (150);
    strokeWeight(5);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
  
  void move() {
    //Richtung und Bewegung
    v.set ((sheep1.xposition() - pos.x),(sheep1.yposition() - pos.y));
    v.normalize();
    v.mult(2);
    pos.add(v);
  }
  
  void draw(){
    fill (100);
    stroke (150);
    strokeWeight(5);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
  
}
