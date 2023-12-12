PImage mainArt;
PImage titleimg;
PImage ground;
PImage trees;
PImage dogimg;
PImage wolfimg;
PImage sheepimg;

void loadImages() {
  mainArt = loadImage("BirkenHirten Main Art.png");
  titleimg = loadImage("BirkenHirten Main Screen.png");
  ground = loadImage("Ground.jpg");
  trees = loadImage("trees.png");
  dogimg = loadImage("dog.png");
  wolfimg = loadImage("wolf.png");
  sheepimg = loadImage("sheep.png");
  
  mainArt.resize(width,height);
  titleimg.resize(width,height);
  ground.resize(width,height);
  trees.resize(width,height);
  dogimg.resize(width,height);
  wolfimg.resize(width,height);
  sheepimg.resize(width,height);
}
