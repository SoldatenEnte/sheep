int MENU = 0, GAME = 1, END = 2, GAMEOVER = 3, LEVEL = 4, CONTROLS = 5; 
int gameState = MENU;
int selected = 0;
boolean barked = false;
float barkCoolDown = 2;

int hundTrigger1 = 100, hundTrigger2 = 150, hundTrigger3 = 200, hundTrigger4 = 250, hundTrigger5 = 300, hundTrigger6 = 350, hundTrigger7 = 400;
int DogTriggerUsed = hundTrigger2; //Hund trigger Reichweite für Schaf

float timer;
int sheepCount;
int wolfCount;

Level Level1;
Level Level2;
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

  Level1 = new Level(0, 10, 100);
  Level2 = new Level(1, 10, 20);
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
  if (gameState == MENU) {
    if (keyCode == ENTER) {
      if (selected == 0) {
        Level1.set();
      } else if (selected == 1) {
        Level2.set();
      }
      gameState = GAME;
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
    if (selected == 0) Level1.reset();
    if (selected == 1) Level2.reset();
    gameState = MENU;
  } else if (gameState == GAMEOVER && keyCode == ENTER) {
    gameState = END;
  }
}


void mouseClicked() {
  if (gameState == MENU) {
    if (selected == 0) {
      Level1.set();                                                      //SET!!!
    } else if (selected == 1) {
      Level2.set();
    }
    gameState = GAME;
  }
  if (gameState == GAME) {
    if (barkCoolDown <= 0) {
      barked = true;
      barkCoolDown = 4;
      theDog.bark ();
    }
  }
}

void draw() {
  println(barkCoolDown);
  // Menü
  if (gameState == MENU) {
    background(50, 150, 50);
    button (width/10 * 0.1, height/10 * 9, width/10, height/10 * 0.9, "Level 1", 0);
    button (width/10 + width/10 * 0.1, height/10 * 9, width/10, height/10 * 0.9, "Level 2", 1);

    fill(0);
    textSize(50);
    text("Sheeps of Doom", width/2, height/2);
    textAlign(LEFT);
    textSize(20);
    text("Press 'Enter' to start", width/2, height/2 + height/20);
    text ("Press 1-7 to change the Dogs trigger Range for the Sheep: " + DogTriggerUsed, width/4, height/5*4+100);
  }


  //Das Spiel
  else if (gameState == GAME) {
    timer -= 1/frameRate;
    background(50, 200, 50);
    imageMode(CORNER);
    image (ground, 0, 0, width, height);

    if (selected == 0) Level1.draw();
    if (selected == 1) Level2.draw();

    rotate(0);
    imageMode(CORNER);
    image (trees, 0, 0, width, height);
    //schreibt den Countdown hin
    textSize(30);
    fill(0);
    text (int(timer), 20, 40);
    //beendet das Game, wenn der Timer läuft
    if (timer<=0) {
      gameState = END;
    }
    if (sheepCount < 0) {
      gameState = GAMEOVER;
    }
  } else if (gameState == END) {
    //END Bildschirm

    //Score Berechnung
    int Score = sheepCount*100 ;
    background (0);
    textSize (120);
    fill(255);
    text ("Score: "+ Score, width/4, height/2);

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
