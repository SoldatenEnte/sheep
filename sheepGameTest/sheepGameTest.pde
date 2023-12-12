int levelSelect = 0;
int selected = 0;
float clickCoolDown = 1;
float musicCoolDown = 0;
float musicCoolDown1 = 0;
float introY;

boolean barked = false;
float barkCoolDown = 2;

int dogTrigger = 100;

float timer;
float score;

Level Level1;
Level Level2;
Level Level3;
Level Level4;
Level Level5;
Level Level6;
Level Level7;
Level Level8;

Dog theDog;
ArrayList <Sheep> sheep = new ArrayList<Sheep>();
ArrayList <Wolf> wolf = new ArrayList<Wolf>();

float vw, vh;

void setup() {
  loadState(GameState.INTRO);
  size(1280, 720);
  background(0);
  fullScreen();
  vw = float(width)/1280;
  vh = float(height)/720;
  introY=750*vw;

  theDog = new Dog();

  loadImages();
  loadSounds();
  setupLevels();
}

void setupLevels() {
  Level1 = new Level(0, 10, 50);
  Level2 = new Level(0, 10, 100);
  Level3 = new Level(1, 10, 30);
  Level4 = new Level(1, 10, 50);
  Level5 = new Level(1, 10, 100);
  Level6 = new Level(1, 15, 30);
  Level7 = new Level(2, 15, 50);
  Level8 = new Level(2, 15, 100);
}

void draw() {
  clickCoolDown -= 1/frameRate;

  switch(currentState) {
  case INTRO:
    introScene();
    break;
  case MENU:
    menuScene();
    break;
  case CREDITS:
    creditScene();
    break;
  case LEVEL:
    levelScene();
    break;
  case CONTROLS:
    controlsScene();
    break;
  case GAME:
    gameScene();
    break;
  case END:
    endScene();
    break;
  case GAMEOVER:
    gameoverScene();
    break;
  default:
    break;
  }
}


void kill() {
  for (int i = sheep.size()-1; i >= 0; i--) {
    Sheep aSheep = sheep.get(i);
    for (int f = wolf.size()-1; f >= 0; f--) {
      Wolf aWolf = wolf.get(f);
      if (dist(aWolf.pos.x, aWolf.pos.y, aSheep.pos.x, aSheep.pos.y) < aWolf.radius) {
        sheep.remove(aSheep);
        aWolf.wolfEating = true;
        wolfBite.play();
      }
      //Sheep out of viewport
      if (aSheep.pos.x < 0 - aSheep.radius || aSheep.pos.x > width + aSheep.radius || aSheep.pos.y < 0 - aSheep.radius || aSheep.pos.y > height + aSheep.radius ) {
        sheep.remove(aSheep);
      }
    }
  }
}

void button (float x, float y, float w, float h, String a, int b) {
  textAlign(CENTER, CENTER);
  if (b != selected) {
    fill(#DBD2AC);
    textSize(30*vw);
    noStroke();
    rect(x, y, w, h, 30*vw);
    fill(0);
  } else {
    fill(#7e5a34);
    textSize(50*vw);
    noStroke();
    rect(x, y, w, h, 30*vw);
    fill(#DBD2AC);
  }
  text( a, x + w/2, y + h/2);
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    selected = b;
  }
}
