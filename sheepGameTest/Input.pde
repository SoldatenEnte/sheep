void keyPressed() {
  if (currentState == GameState.INTRO) {
    if (keyCode == ENTER) {
      loadState(GameState.MENU);
    }
  } else if (currentState == GameState.MENU) {
    if (keyCode == ENTER) {
      loadState(GameState.LEVEL);
    }
  } else if (currentState == GameState.CREDITS) {
    if (keyCode == BACKSPACE || keyCode == ENTER) {
      loadState(GameState.MENU);
    }
  }


  //Levelbildschirm
  else if (currentState == GameState.LEVEL) {
    if (keyCode == ENTER) {
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
      } else if (selected == 8) {
        loadState(GameState.MENU);
      }
    } else if (keyCode == BACKSPACE) {
      loadState(GameState.MENU);
    }
  }
  // Controls Bildschirm
  else if (currentState == GameState.CONTROLS) {
    if (keyCode == ENTER || keyCode == BACKSPACE) {
      loadState(GameState.MENU);
    }
    //Trigger ändern durch Tastendruck im Menu
    if (keyCode >= '1' && keyCode <= '7') {
      dogTrigger = Character.getNumericValue(keyCode)*50+50;
    }
  } else if (currentState == GameState.END && keyCode == ENTER) {
    if (levelSelect == 0) Level1.reset();
    if (levelSelect == 1) Level2.reset();
    if (levelSelect == 2) Level3.reset();
    if (levelSelect == 3) Level4.reset();
    if (levelSelect == 4) Level5.reset();
    if (levelSelect == 5) Level6.reset();
    if (levelSelect == 6) Level7.reset();
    if (levelSelect == 7) Level8.reset();
    loadState(GameState.MENU);
  } else if (currentState == GameState.GAMEOVER && keyCode == ENTER) {
    loadState(GameState.END);
  }
}


void mousePressed() {

  if (currentState == GameState.MENU) {
    if (selected == 0) {
      loadState(GameState.LEVEL);
    } else if (selected == 1) {
      loadState(GameState.CONTROLS);
    } else if (selected == 2) {
      loadState(GameState.CREDITS);
    }
  } else if (currentState == GameState.LEVEL) {
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
    } else if (selected == 8) {
      loadState(GameState.MENU);
    }
  } else if (currentState == GameState.GAME) {
    if (barkCoolDown <= 0) {
      barked = true;
      barkCoolDown = 4;
      theDog.bark ();
    }
  }
}
