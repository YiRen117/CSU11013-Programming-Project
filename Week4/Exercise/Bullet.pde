class Bullet{
  float x, y, dy, bwidth, bheight;
  int level;
  PImage bulletImg;
  boolean start;
  
  Bullet(PImage bulletImage){
    y = SCREENY - MARGIN;
    dy = 5;
    bulletImg = bulletImage;
    bwidth = 15; bheight = 30;
    level = 0;
    start = false;
  }
  
  void start(Player tp, float startY){
    if (mousePressed && !start){
      start = true;
      x = tp.xpos;
      y = y + startY;
    }
  }
  
  void move(){
    if(start){
      y = y - dy;
      if(y + bheight < 0){
        start = false;
        y = SCREENY - MARGIN;}
    }
  }
  
  void draw(){
    if(start && y <= SCREENY - MARGIN){
      image(bulletImg, x, y, bwidth, bheight);
    }
  }
  
  void collide(Alien alien, Player tp, int k){
    if(alien.status == ALIVE){
      if(y <= alien.y + alien.aheight && y + bheight >= alien.y &&
        x <= alien.x + alien.awidth && x + bwidth >= alien.x){
        alien.explode();
        tp.count++;
        if(random(0,2)<1 && level<3){
          level++;
          levelUp(k);
        }
      }
    }
  }
  
  void levelUp(int k){
    if(level == 3){
        println("Bullet " + k + ": Extra bullet!");
      }
      else if(level == 2){
        println("Bullet " + k + ": Bullet enlarged!");
        bwidth = 22; bheight = 2.5 * bwidth;
      }
      else{
        println("Bullet " + k + ": Speed up!");
        dy = 10;
      }
  }
}
