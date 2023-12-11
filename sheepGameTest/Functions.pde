void set(float a, int b) {
  timer = a;
  sheepCount = b;
  //spawnt Schafe
  for (int i = sheepCount; i>=0; i--) {
    sheep.add(new Sheep());
  }
}


void reset() {
  for (int i = sheepCount; i>=0; i--) {
    sheep.remove(i);
  }
  wolf1.reset();
  theDog.reset();
}

void kill(){
  for (int i = sheepCount; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      if(dist(aSheep.xposition(), aSheep.yposition(), wolf1.pos.x, wolf1.pos.y) < aSheep.radius){
        sheep.remove(aSheep);
        sheepCount --;
      }
      if(aSheep.xposition() < 0 - aSheep.radius || aSheep.xposition() > width + aSheep.radius || aSheep.yposition() < 0 - aSheep.radius || aSheep.yposition() > height + aSheep.radius ){
        sheep.remove(aSheep);
        sheepCount --;
      }
  }
}
