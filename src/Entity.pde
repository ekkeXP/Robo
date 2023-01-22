abstract class Entity{
 float x, y;
 PImage sprite;
 int spritesCount = 7;
 PImage[] rollingRight = new PImage[spritesCount];
 PImage EyeUp = loadImage("Sprites/Robo-Player-Up.png");
 PImage EyeDef = loadImage("Sprites/Robo-Player-Def.png");
 PImage EyeDown = loadImage("Sprites/Robo-Player-Down.png");
 PImage Ball = loadImage("Sprites/Robo-Player-Ball.png");
 int FrameCounter = 0;
 
 Entity(float x, float y, PImage Spr){
   this.x = x;
   this.y = y;
   this.sprite = Spr;
   if(this instanceof Player){
       rollingRight[0] = loadImage("Sprites/Robo-Player-Frame1.png");
       rollingRight[1] = loadImage("Sprites/Robo-Player-Frame2.png");
       rollingRight[2] = loadImage("Sprites/Robo-Player-Frame3.png");
       rollingRight[3] = loadImage("Sprites/Robo-Player-Frame4.png");
       rollingRight[4] = loadImage("Sprites/Robo-Player-Frame5.png");
       rollingRight[5] = loadImage("Sprites/Robo-Player-Frame6.png");
       rollingRight[6] = loadImage("Sprites/Robo-Player-Frame7.png");
   }
 }
 
 
 void Draw(){
   if(FrameCounter >=14){
    FrameCounter = 0; 
   }else{
     image(Ball, x, y);
     if(!PrevLeft){
       image(rollingRight[FrameCounter/2], x, y);
       if(up){
         image(EyeUp, x, y);
       }else if(down){
         image(EyeDown, x, y);
       }else{
         image(EyeDef, x, y);
       }
     }else if(PrevLeft){
       scale(-1,1);
       image(rollingRight[FrameCounter/2], -1 * x - rollingRight[FrameCounter/2].width, y, rollingRight[FrameCounter/2].width, rollingRight[FrameCounter/2].height);
       if(up){
         image(EyeUp, -1 * x - EyeUp.width, y, EyeUp.width, EyeUp.height);
       }else if(down){
         image(EyeDown, -1 * x - EyeDown.width, y, EyeDown.width, EyeDown.height);
       }else{
         image(EyeDef, -1 * x - EyeDef.width, y, EyeDef.width, EyeDef.height);
       }
     }
     if(left || right){
       FrameCounter++;
     }
   }
 };

 abstract void update();
  
  
}
