class Wall{
 float x, y, w, h;
 
 Wall(float x,float y,float w,float h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   fill(0);
   rect(this.x, this.y, this.w, this.h);
 }  
}
