
// One row spritesheet
PImage spritesheet;
PImage[][] sprites;

int numSpritesWide = 12;
int numSpritesTall = 7;
int column = 0;
int row = 0;

int xPos = 0, yPos = 0, speed=20;
void setup() {
  size(900, 900);
  frameRate(15);

  spritesheet = loadImage("guy.png");


  sprites = new PImage[numSpritesTall][numSpritesWide];
  int spriteWidth = spritesheet.width/numSpritesWide;
  int spriteHeight = spritesheet.height/numSpritesTall;
  print(spriteWidth + " " + spriteHeight);
  for (int row=0; row<numSpritesTall; row++) {
    for (int col=0; col<numSpritesWide; col++) {
      sprites[row][col] = spritesheet.get(col*spriteWidth, row*spriteHeight, spriteWidth, spriteHeight);
    }
  }
}  

void draw() {
  background(0); 
  boolean moving = false;
  if (keyPressed) {
    if (key=='w') {
      yPos-=speed;
      moving = true;
    } else if (key == 's') {
      yPos += speed;
      moving = true;
    }

    if (key=='a') {
      xPos -= speed;
      row = 3;
      moving = true;
    } else if (key=='d') {
      xPos += speed; 
      row = 4; 
      moving = true;
    }
  }

  if (moving) {
    column++;
    column = column%numSpritesWide;
  }
  image(sprites[row][column], xPos, yPos);
}