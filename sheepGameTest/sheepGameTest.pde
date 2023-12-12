int MENU = 0, GAME = 1, END = 2, GAMEOVER = 3, LEVEL = 4, CONTROLS = 5, INTRO = 6;
int gameState = INTRO;
int levelSelect = 0;
int selected = 0;
float clickCoolDown = 1;

boolean barked = false;
float barkCoolDown = 2;

int hundTrigger1 = 100, hundTrigger2 = 150, hundTrigger3 = 200, hundTrigger4 = 250, hundTrigger5 = 300, hundTrigger6 = 350, hundTrigger7 = 400;
int DogTriggerUsed = hundTrigger2; //Hund trigger Reichweite für Schaf

float timer;
int sheepCount;
int wolfCount;
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
ArrayList <Sheep> sheep;
ArrayList <Wolf> wolf;

PImage ground;
PImage trees;
PImage dogimg;
PImage wolfimg;
PImage sheepimg;

void setup() {
  size(1280, 720);

  Level1 = new Level(0, 10, 50);
  Level2 = new Level(0, 10, 100);
  Level3 = new Level(1, 10, 30);
  Level4 = new Level(1, 10, 50);
  Level5 = new Level(1, 10, 100);
  Level6 = new Level(1, 15, 30);
  Level7 = new Level(2, 15, 50);
  Level8 = new Level(2, 15, 100);

  theDog = new Dog();
  sheep = new ArrayList<Sheep>();
  wolf = new ArrayList<Wolf>();

  ground = loadImage("Ground.jpg");
  trees = loadImage("trees.png");
  dogimg = loadImage("dog.png");
  wolfimg = loadImage("wolf.png");
  sheepimg = loadImage("sheep.png");
}

void keyPressed() {
  if (gameState == INTRO) {
    if (keyCode == ENTER) {
      gameState = MENU;
    }
  } else if (gameState == MENU) {
    if (keyCode == ENTER) {
      gameState = LEVEL;
    }
  }
  //Levelbildschirm
  else if (gameState == LEVEL) {
    if (keyCode == ENTER) {
      if (levelSelect == 0) {
        Level1.set();
      } else if (levelSelect == 1) {
        Level2.set();
      }
      gameState = CONTROLS;
    }

    // Controls Bildschirm
  } else if (gameState == CONTROLS) {
    if (keyCode == ESC) {
      gameState = MENU;
    }
    //Trigger ändern durch Tastendruck im Menu
    if (key == '1') {
      DogTriggerUsed = hundTrigger1;
    } else if (key == '2') {
      DogTriggerUsed = hundTrigger2;
    } else if (key == '3') {
      DogTriggerUsed = hundTrigger3;
    } else if (key == '4') {
      DogTriggerUsed = hundTrigger4;
    } else if (key == '5') {
      DogTriggerUsed = hundTrigger5;
    } else if (key == '6') {
      DogTriggerUsed = hundTrigger6;
    } else if (key == '7') {
      DogTriggerUsed = hundTrigger7;
    }
  } else if (gameState == END && keyCode == ENTER) {
    if (levelSelect == 0) Level1.reset();
    if (levelSelect == 1) Level2.reset();
    gameState = MENU;
  } else if (gameState == GAMEOVER && keyCode == ENTER) {
    gameState = END;
  }
}


void mousePressed() {

  if (gameState == MENU) {
    if (selected == 0) {
      gameState = LEVEL;
    } else if (selected == 1) {
      gameState = CONTROLS;
    }
  } else if (gameState == LEVEL) {
    if (selected == 0) {
      Level1.set();
    } else if (selected == 1) {
      Level2.set();
    } else if (selected == 2) {
      Level3.set();
    } else if (selected == 3) {
      Level4.set();
    } else if (selected == 4) {
      Level5.set();
    } else if (selected == 5) {
      Level6.set();
    } else if (selected == 6) {
      Level7.set();
    } else if (selected == 7) {
      Level8.set();
    }
    levelSelect = selected;
    gameState = GAME;
  } else if (gameState == GAME) {
    if (barkCoolDown <= 0) {
      barked = true;
      barkCoolDown = 4;
      theDog.bark ();
    }
  }
}

void draw() {
  println(score);
  clickCoolDown -= 1/frameRate;

  //intro
  if (gameState == INTRO) {
    background (0);
    fill (255);
    textSize (30);
    text ("Press ENTER to skip...", width/10*7, height/8*7);
  }
  // Menü
  else if (gameState == MENU) {
    background(50, 150, 50);
    button(width/3 * 2, height/5, width/3 - width/30, height/6, "Level Select", 0);
    button(width/3 * 2, height/5 * 2, width/3 - width/30, height/6, "Controls", 1);
    button(width/3 * 2, height/5 * 3, width/3 - width/30, height/6, "Credits", 2);

    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Sheeps of Doom", width/2, height/2);
    textAlign(LEFT);
    textSize(20);
    text("Press 'Enter' to start", width/2, height/2 + height/20);
  }

  //Levelauswahl
  else if ( gameState == LEVEL) {
    background(50, 150, 50);
    button (width/10 * 9, height/10 * 0.1, width/10 * 0.9, height/10 * 0.9, "Level 1", 0);
    button (width/10 * 9, height/10 * 1.1, width/10 * 0.9, height/10 * 0.9, "Level 2", 1);
    button (width/10 * 9, height/10 * 2.1, width/10 * 0.9, height/10 * 0.9, "Level 3", 2);
    button (width/10 * 9, height/10 * 3.1, width/10 * 0.9, height/10 * 0.9, "Level 4", 3);
    button (width/10 * 9, height/10 * 4.1, width/10 * 0.9, height/10 * 0.9, "Level 5", 4);
    button (width/10 * 9, height/10 * 5.1, width/10 * 0.9, height/10 * 0.9, "Level 6", 5);
    button (width/10 * 9, height/10 * 6.1, width/10 * 0.9, height/10 * 0.9, "Level 7", 6);
    button (width/10 * 9, height/10 * 7.1, width/10 * 0.9, height/10 * 0.9, "Level 8", 7);
  }

  //CONTROLS Screen
  else if (gameState == CONTROLS) {
    background (0);
    fill (255);
    text ("Press 1-7 to change the Dogs triggerrange for the Sheep: " + DogTriggerUsed, width/4, height/5*4+100);
  }


  //Das Spiel
  else if (gameState == GAME) {
    timer -= 1/frameRate;
    background(50, 200, 50);
    imageMode(CORNER);
    image (ground, 0, 0, width, height);

    if (levelSelect == 0) Level1.draw();
    if (levelSelect == 1) Level2.draw();
    if (levelSelect == 2) Level3.draw();
    if (levelSelect == 3) Level4.draw();
    if (levelSelect == 4) Level5.draw();
    if (levelSelect == 5) Level6.draw();
    if (levelSelect == 6) Level7.draw();
    if (levelSelect == 7) Level8.draw();

    rotate(0);
    imageMode(CORNER);
    image (trees, 0, 0, width, height);
    //schreibt den Countdown hin
    textSize(30);
    fill(0);
    text (int(timer), 20, 40);
    //Scoreberechnung
    score = score + sheepCount/frameRate;
    //beendet das Game, wenn der Timer läuft
    if (timer<=0) {
      gameState = END;
    }
    if (sheepCount < 0) {
      gameState = GAMEOVER;
    }
  } else if (gameState == END) {





    //END Bildschirm

    background (0);
    textSize (120);
    fill(255);
    text ("Score: "+ int(score), width/4, height/2);
    textSize (80);
    text ("Press ENTER for Menu", width/5, height/4);
  } else if (gameState == GAMEOVER) {

    background (0);

    textAlign (CENTER);
    textSize (120);
    fill (255, 0, 0);
    text ("GAME OVER", width/2, height/3);
    textSize (40);
    fill (#E3E3E3);
    text ("You've lost all the Farmers Sheep. Shame on you!", width/2, height/3*2);
    text ("Press ENTER for Score and Menu.", width/2, height/4*3);
    textAlign (LEFT);
  }
}
