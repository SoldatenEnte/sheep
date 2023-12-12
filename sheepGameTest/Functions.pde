
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
  textAlign(CENTER, CENTER);
  if (b != selected) {
    fill(#DBD2AC);
    textSize(30);
    noStroke();
    rect(x, y, w, h, 30);
    fill(0);
  } else {
    fill(#7e5a34);
    textSize(50);
    noStroke();
    rect(x, y, w, h, 30);
    fill(#DBD2AC);
  }
  text( a, x + w/2, y + h/2);
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    selected = b;
  }
}
