// langston's ant based off of a coding train tutorial
// https://www.youtube.com/watch?v=G1EgjgMo48U&t=54s

int[][] grid;
int x;
int y;
int dir;

int ANTUP = 0;
int ANTRIGHT = 1;
int ANTDOWN = 2;
int ANTLEFT = 3;

PImage ant;

void setup() {
  size(400, 400);
  //fullScreen();
  grid = new int[width][height];
  ant = createImage(width, height, RGB);
  ant.loadPixels();
  for (int i = 0; i < ant.pixels.length; i++){
    ant.pixels[i] = color(50);
  }
  ant.updatePixels();
  x = width/2;
  y = height/2;
  dir  = ANTUP;
  
}

void turnRight(){
  dir++;
  if (dir > ANTLEFT){
    dir = ANTUP;
  }
}

void turnLeft(){
  dir--;
  if (dir < ANTUP){
    dir = ANTLEFT;
  }
}

void moveForward(){
  
  switch(dir) {
    case 0:
      y--;
      break;
    case 1:
      x++;
      break;
    case 2:
      y++;
      break;
    case 3:
      x--;
      break;
  }
  
  
  if (x > width-1){
    x = 0;
  } else if (x < 0){
    x = width-1;
  }
  
  if (y > height-1){
    y = 0;
  } else if (y < 0){
    y = height-1;
  }
  
}

void draw() {
  background(255);
  
  ant.loadPixels();
  for (int n = 0; n < 100; n++){
    int state = grid[x][y];
    
    switch(state) {
      case 0: 
        turnRight();
        grid[x][y] = 1;
        break;
      case 1:
        turnLeft();
        grid[x][y] = 0;
        break;
    }
    
    color col = color(255);
    if (grid[x][y] == 1){
      col = color(0);
    }
    int pix = x + y * ant.width;
    ant.pixels[pix] = col;
    moveForward();
  }
  ant.updatePixels();
  
  image(ant, 0, 0);

}
