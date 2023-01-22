class Player extends Entity{
  
  boolean isJumping = false;
  final float jumpVel = -35;
  final float maxFallSpeed = 20;
  final float maxXSpeed = 10;
  float xSpeed = 0;
  float ySpeed = 0;

  
  
  Player(float x, float y, PImage Spr){
    super(x, y, Spr);
  }

  void update(){
    //check for movement
    if(left){
      xSpeed-=2;
    }
    if(right){
      xSpeed+=2;
    }
    
    if(xSpeed >= maxXSpeed){
      xSpeed = maxXSpeed; 
    }else if(xSpeed <= -maxXSpeed){
      xSpeed = -maxXSpeed;
    }
    
    if((!left && !right)|| (left && right)){
      xSpeed = 0; 
    }

    if(jump && !isJumping){
      isJumping = true;
      ySpeed=jumpVel;
    }else{
      checkWallCollision();
    }
    
    if(ySpeed >= maxFallSpeed){
      ySpeed = maxFallSpeed; 
    }
    y += ySpeed;
    x += xSpeed;   
    
  }
  
  void checkWallCollision(){
   for(Wall W : walls){
     if(W == null)
       return;
      if(rectangleCollision(x, y, sprite.width, sprite.height, W)){
        ySpeed = 0;
        y = W.y - sprite.height;
        isJumping = false;
      }else{
        ySpeed+=2;
      }
   }
  }
  
  boolean rectangleCollision(float playerX, float playerY, float playerW, float PlayerH, Wall W)
  {
    for(float i = ySpeed; i > 0; i--){
      if(playerX + playerW > W.x && playerX < W.x + W.w && ((playerY + i + PlayerH) > W.y) && (playerY < (W.y + W.h))){
        return true;
      }
    }
      return false;
  }



}
