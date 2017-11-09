
// One row spritesheet
PImage spritesheet;
PImage[] sprites;

int numSprites = 6;
int column = 0;

int xPos = 0, yPos = 0, speed=20;
void setup() {
  size(600, 600,P3D);
  frameRate(15);

  spritesheet = loadImage("spritesheet.png");


  sprites = new PImage[numSprites];
  int spriteWidth = spritesheet.width/numSprites;
  int spriteHeight = spritesheet.height;
  print(spriteWidth + " " + spriteHeight);
  for (int i=0; i<numSprites; i++) {
    sprites[i] = spritesheet.get(i*spriteWidth, 0, spriteWidth, spriteHeight);
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
      moving = true;
    } else if (key=='d') {
      xPos += speed; 
      moving = true;
    }
  }

  if (moving) {
    column++;
    column = column%numSprites;
  }
  image(sprites[column], xPos, yPos);
}