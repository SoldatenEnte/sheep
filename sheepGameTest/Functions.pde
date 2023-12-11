void set(float a, int b) {
  timer = a;
  sheepCount = b;
  //spawnt Schafe
  for (int i = sheepCount; i>=0; i--) {
    sheep.add(new Sheep());
  }
}


void reset(float a, int b) {
  for (int i = sheepCount; i>=0; i--) {
    sheep.remove(i);
  }
  wolf1.reset();
  theDog.reset();
  set(a, b);
}
