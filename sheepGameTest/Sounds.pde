import processing.sound.*;

SoundFile wolfBite;
SoundFile backgroundMusic;
SoundFile sheepBleat;
SoundFile dogBark;

void loadSounds() {
  wolfBite = new SoundFile(this, "crunchy-bite.mp3");
  backgroundMusic = new SoundFile(this, "The Forest and the Trees.mp3");
  sheepBleat = new SoundFile(this, "sheepbleat.wav");
  dogBark = new SoundFile(this, "dog bark.mp3");
}

void stopMusic(){
  backgroundMusic.stop();
  wolfBite.stop();
  sheepBleat.stop();
  dogBark.stop();
}
