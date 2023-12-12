public enum GameState {
  MENU, GAME, END, GAMEOVER, LEVEL, CONTROLS, INTRO, CREDITS
}

GameState currentState;

void loadState(GameState state) {
  currentState = state;

  if (state == GameState.MENU) {
    stopMusic();
    backgroundMusic.play();
  }
  if (state == GameState.GAME) {
    stopMusic();
    sheepBleat.play();
  }
}
