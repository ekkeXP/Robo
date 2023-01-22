boolean left = false, right = false, up = false, down = false, jump = false;
boolean PrevLeft = true;

PImage bg;

Player player1;

Wall[] walls = new Wall[20];


void setup(){
  size(1800, 970);
  bg = loadImage("Sprites/Background.png");
  player1 = new Player(30, 30, loadImage("Sprites/Robo-Player-Frame1.png"));
  walls[0] = new Wall(0, height-50, width, 5);
}


void draw(){
  background(bg);
  drawWalls();
  player1.update();
  player1.Draw();
  
}


void keyPressed(){
  switch(keyCode){
    case 65:
      left = true;
      PrevLeft = true;
      break;
    case 68:
      right = true;
      PrevLeft = false;
      break;
    case 87:
      up = true;
      break;
    case 83:
      down = true;
      break;
    case 32:
      jump = true;
      break;
  }
}


void keyReleased(){
  switch(keyCode){
    case 65:
      left = false;
      if(right){
        PrevLeft = false; 
      }
      break;
    case 68:
      right = false;
      if(left){
        PrevLeft = true;
      }
      break;
    case 87:
      up = false;
      break;
    case 83:
      down = false;
      break;
    case 32:
      jump = false;
      break;
  }
}


void drawWalls(){
   fill(0);
  for(Wall W: walls){
    if(W == null)
      return;
    rect(W.x, W.y, W.w, W.h);
  }
  
}
