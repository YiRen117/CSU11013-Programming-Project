class Player{
  float xpos, ypos;
  int gwidth, gheight, count;
  PImage gunImg;
  boolean stop, die;
  
  Player(float startX, PImage gunImage){
    xpos = startX; ypos = SCREENY - MARGIN;
    gunImg = gunImage;
    gwidth = 40; gheight = 40;
    count = 0;
    stop = false;
    die = false;
  }
  
  void move(int x){
    if(!stop){
      if (x > SCREENX - gwidth){
        xpos = SCREENX - gwidth;
      }
      else xpos = x;
    }
  }
  
  void draw(){
    image(gunImg, xpos, ypos, gwidth, gheight);
  }
}
