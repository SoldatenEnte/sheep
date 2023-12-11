int MENU = 0, GAME = 1, END = 2;
int gameState = MENU;

int hundTrigger1 = 100, hundTrigger2 = 150, hundTrigger3 = 200, hundTrigger4 = 250, hundTrigger5 = 300, hundTrigger6 = 350, hundTrigger7 = 400;
int DogTriggerUsed = hundTrigger2; //Hund trigger Reichweite für Schaf

float timer;
int sheepCount;
Dog theDog;
Sheep sheep1;
ArrayList <Sheep> sheep;
Wolf wolf1;

void setup() {
  size(1280, 720);
  theDog = new Dog();
  sheep = new ArrayList<Sheep>();
  sheep1 = new Sheep();
  wolf1 = new Wolf();
  
}

void draw() {

  // Menü
  if (gameState == MENU) {
    background(50, 150, 50);
    fill(0);
    textSize(50);
    text("Sheeps of Doom", width/8 * 3, height/2);
    textSize(20);
    text("Press 'Enter' to start", width/2, height/2 + height/20);
    text ("Press 1-7 to change the Dogs trigger Range for the Sheep: " + DogTriggerUsed, width/4, height/5*4+100);
  }


  //Das Spiel
  else if (gameState == GAME) {
    timer -= 1/frameRate;
    background(50, 200, 50);

    //schreibt den Countdown hin
    textSize(30);
    fill(0);
    text (int(timer), 20, 40);

    //Der Hund
    theDog.move();
    theDog.draw();

    //die Schafe
    sheep1.move();
    sheep1.draw();
    for (int i = sheepCount; i >= 0; i--) {
      Sheep aSheep = sheep.get(i);
      aSheep.move();
      aSheep.draw();
    }

    //der Wolf
    wolf1.move();
    wolf1.draw();
    //beendet das Game, wenn der Timer läuft
    if (timer<=0) {
      gameState = END;
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
  }
}


void keyPressed() {
  if (gameState == MENU) {
    if (keyCode == ENTER) {
      set(100, 10);                                                      //SET!!!
      gameState = GAME;
    }

    //Trigger änderung durch tastenDruck im Menu

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
    reset();
    gameState = MENU;
  }
}
