class Bomb{
  float x, y, dy, bwidth, bheight;
  PImage bombImg;
  boolean collide;
  
  Bomb(float xpos, float ypos, PImage bombImage){
    x = xpos; y = ypos;
    dy = 3;
    bombImg = bombImage;
    bwidth = 25; bheight = 25;
    collide = false;
  }
  
  void move(Player tp){
    if(!tp.stop){
      y = y + dy;
          }
  }
  
  void draw(){
    if(!collide && !offScreen()){
      image(bombImg, x, y, bwidth, bheight);
    }
  }
  
  void collidePlayer(Player tp){
    if(y + bheight >= tp.ypos && y <= tp.ypos + tp.gheight && x <= tp.xpos + tp.gwidth &&
      x + bwidth >= tp.xpos){
        collide = true;
        tp.die = true;
    }
  }
  
  void collideShield(Shield sd){
    if(!collide && sd.lives > 0 && y + bheight >= sd.ypos && x <= sd.xpos + sd.swidth
      && x + bwidth >= sd.xpos){
        collide = true;
        sd.lives--;
    }
  }
  
  boolean offScreen(){
    if(y > SCREENY){
      return true;
    }
    else return false;
  }
}
