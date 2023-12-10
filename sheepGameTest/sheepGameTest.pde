int MENU = 0, GAME = 1, END = 2;
int gameState = MENU;
float levelTimer = 100;
float timer = levelTimer;
int sheepCount = 10;
Dog theDog;
Sheep sheep1;
ArrayList <Sheep> sheep;
Wolf wolf1;

void setup(){
  size(1280,720);
  theDog = new Dog();
  sheep = new ArrayList<Sheep>();
  sheep1 = new Sheep();
  wolf1 = new Wolf();
}

void draw(){
  
  // Menü
  if (gameState == MENU){
    background(50,150,50);
    fill(0);
    textSize(50);
    text("Sheeps of Doom", width/8 * 3, height/2);
    textSize(20);
    text("Press 'Enter' to start", width/2, height/2 + height/20);
  }
  
  
  //Das Spiel
  else if (gameState == GAME){
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
    for(int i = sheepCount; i >= 0; i--){
      Sheep aSheep = sheep.get(i);
      aSheep.move();
      aSheep.draw();
    }
    
    //der Wolf
    wolf1.move();
    wolf1.draw();
    //beendet das Game, wenn der Timer läuft
    if (timer<=0){
      gameState = END;
    }
  }else if (gameState == END){
    gameState = MENU;    //Platzhalter
  }
  
}

void keyPressed(){
  if (gameState == MENU && keyCode == ENTER){
    timer = levelTimer;
    //spawnt Schafe
    for (int i = sheepCount; i>=0; i--) {
      sheep.add(new Sheep());
    }
    gameState = GAME;
  }
}
