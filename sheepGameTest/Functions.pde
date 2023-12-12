
void kill() {
  for (int i = sheepCount; i >= 0; i--) {
    Sheep aSheep = sheep.get(i);
    for (int f = wolfCount; f >= 0; f--) {
      Wolf aWolf = wolf.get(f);
      if (dist(aWolf.xposition(), aWolf.yposition (), aSheep.xposition (), aSheep.yposition ()) < aWolf.radius) {
        sheep.remove(aSheep);
        sheepCount --;
        aWolf.wolfEating = true;
      }
      if (aSheep.xposition() < 0 - aSheep.radius || aSheep.xposition() > width + aSheep.radius || aSheep.yposition() < 0 - aSheep.radius || aSheep.yposition() > height + aSheep.radius ) {
        sheep.remove(aSheep);
        sheepCount --;
      }
    }
  }
}

void button (float x, float y, float w, float h, String a, int b) {
  if (b != selected) {
    fill(255);
  } else {
    fill(#E39EBB);
  }
  noStroke();
  rect(x, y, w, h);
  fill(0);
  textAlign(CENTER);
  text( a, x + w/2, y + h/2);
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    selected = b;
  }
}
