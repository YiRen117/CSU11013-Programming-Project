class Alien {
  float x, y;
  int d, status, awidth, aheight;
  PImage alienImg, explodeImg;
 
  Alien(float startX, float startY, PImage alienImage, PImage explodeImage){
    x=startX; y=startY;
    awidth = 50; aheight = 40;
    d = FORWARD;
    alienImg = alienImage;
    explodeImg = explodeImage;
    status = ALIVE;
  }

 void move(){
   if (d == FORWARD) {
     if(x + awidth < SCREENX){
       x++;}
     else{
       d = BACKWARD;
       y += aheight;
     }
   }
   else{
     if(x > 0){
       x--;}
     else{
       d = FORWARD;
       y += aheight;
     }
   }
  }

  void explode(){
    if(status == ALIVE){
      status = EXPLODE;
    }
  }
  
  void draw(){
    if(status == ALIVE){
      image(alienImg, x, y, awidth, aheight);
    }
    else if(status != DEAD){
      image(explodeImg, x, y, awidth, aheight);
      status++;
    }
  }
}
