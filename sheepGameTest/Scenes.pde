void introScene() {
  background (0);
  introY -= height/700;
  fill (80);
  textAlign(LEFT);
  textSize (30*vw);
  text ("Press ENTER to skip...", width/10*7, height/8*7);
  fill (255);
  textAlign(CENTER);
  textSize(height/36);
  textLeading(height/36*1.6);
  text("You are just a humble sheepdog,\nbut one day the shepherd led you and the sheep\ninto a mysterious birch forest.\nAs you reach a clearing the shepherd notices\nthat some of the sheep are missing and orders you\nto herd the remaining sheep on the clearing,\nwhile he looks for the missing sheep.\nShortly after the Shepherd left,\nyou hear wolves howling and you know,\nthis task won't be easy", width/2, introY);
  if (introY <= -450){
    loadState(GameState.MENU);
  }
}

void menuScene() {
  imageMode(CORNER);
  image(mainArt, 0, 0, width, height);
  image(titleimg, width/20, height/20, width/3, height/3);


  button(width/3 * 2, height/5, width/3 - width/30, height/6, "Level Select", 0);
  button(width/3 * 2, height/5 * 2, width/3 - width/30, height/6, "How To Play", 1);
  button(width/3 * 2, height/5 * 3, width/3 - width/30, height/6, "Credits", 2);
}

void creditScene() {
  background(27, 83, 27);
  fill(#DBD2AC);
  textAlign(LEFT);
  textSize(height/10 * 0.8);
  text("Code and Idea: Aaron, Clark, Felix", width/10 * 0.1, height/10);
  text("Art Director: Felix", width/10 * 0.1, height/10 * 2);
  text("Sound Director: Clark", width/10 * 0.1, height/10 * 3);
  text("Debugging: Aaron", width/10 * 0.1, height/10 * 4);
  button (width/10 * 8, height/10 * 8.1, width/10 * 1.9, height/10 * 0.9, "BACK", 0);
}

void levelScene() {
  background(27, 83, 27);
  imageMode(CORNER);
  image(mainArt, 0, 0, width, height);
  image(titleimg, width/20, height/20, width/3, height/3);
  button (width/10 * 8, height/10 * 0.1, width/10 * 1.9, height/10 * 0.9, "Level 1", 0);
  button (width/10 * 8, height/10 * 1.1, width/10 * 1.9, height/10 * 0.9, "Level 2", 1);
  button (width/10 * 8, height/10 * 2.1, width/10 * 1.9, height/10 * 0.9, "Level 3", 2);
  button (width/10 * 8, height/10 * 3.1, width/10 * 1.9, height/10 * 0.9, "Level 4", 3);
  button (width/10 * 8, height/10 * 4.1, width/10 * 1.9, height/10 * 0.9, "Level 5", 4);
  button (width/10 * 8, height/10 * 5.1, width/10 * 1.9, height/10 * 0.9, "Level 6", 5);
  button (width/10 * 8, height/10 * 6.1, width/10 * 1.9, height/10 * 0.9, "Level 7", 6);
  button (width/10 * 8, height/10 * 7.1, width/10 * 1.9, height/10 * 0.9, "Level 8", 7);
  button (width/10 * 8, height/10 * 8.1, width/10 * 1.9, height/10 * 0.9, "BACK", 8);
}

void controlsScene() {
  background(27, 83, 27);
  textAlign(LEFT);
  textSize(height/20);
  fill (#DBD2AC);
  text ("Try to keep the sheep inside the window while saving them from the wolves. \nThe sheep only run from the dog. \nTo Control the dog use the mouse, the dog follows the mouse. \nPress the mouse button to bark. Barking scares the wolves off. \n \nYou can change in which distance \nthe sheep will start running from the dog here: \n    Press 1-7 to change the dogs triggerrange for the sheep: " + dogTrigger, width/10 * 0.1, height/10 , 9);
  button (width/10 * 8, height/10 * 8.1, width/10 * 1.9, height/10 * 0.9, "BACK", 0);
}

void gameScene() {
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

  imageMode(CORNER);
  image (trees, 0, 0, width, height);
  //schreibt den Countdown hin
  textAlign(LEFT);
  textSize(50*vw);
  fill(255);
  text (int(timer), 20*vw, 40*vw);
  //Scoreberechnung
  score = score + sheep.size()/frameRate;
  //beendet das Game, wenn der Timer läuft

  if (timer<=0) {
    loadState(GameState.END);
  }
  if (sheep.size() == 0) {
    loadState(GameState.GAMEOVER);
  }
}

void endScene() {
  background (0);
  textAlign(LEFT);
  textSize (120*vw);
  fill(255);
  text ("Score: "+ int(score), width/4, height/2);
  textSize (80*vw);
  text ("Press ENTER for Menu", width/5, height/4);
}

void gameoverScene() {
  background (0);

  textAlign (CENTER);
  textSize (120*vw);
  fill (255, 0, 0);
  text ("GAME OVER", width/2, height/3);
  textSize (40*vw);
  fill (#E3E3E3);
  text ("You've lost all the Shepherds sheep. Shame on you!", width/2, height/3*2);
  text ("Press ENTER for your score.", width/2, height/4*3);
  textAlign (LEFT);
}
