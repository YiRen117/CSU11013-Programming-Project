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
  
  void move(){
    y = y + dy;
  }
  
  void draw(){
    if(!collide && !offScreen()){
      image(bombImg, x, y, bwidth, bheight);
    }
  }
  
  void collide(Player tp){
    if(y + bheight >= tp.ypos && y <= tp.ypos + tp.gheight && x <= tp.xpos + tp.gwidth &&
      x + bwidth >= tp.xpos){
        collide = true;
    }
  }
  
  boolean offScreen(){
    if(y > SCREENY){
      return true;
    }
    else return false;
  }
  
}
