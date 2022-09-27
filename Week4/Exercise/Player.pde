class Player{
  float xpos, ypos;
  int gwidth, gheight, count;
  PImage gunImg;
  
  Player(float startX, PImage gunImage){
    xpos = startX; ypos = SCREENY - MARGIN;
    gunImg = gunImage;
    gwidth = 40; gheight = 40;
    count = 0;
  }
  
  void move(int x){
    if (x > SCREENX - gwidth){
      xpos = SCREENX - gwidth;
    }
    else xpos = x;
  }
  
  void draw(){
    image(gunImg, xpos, ypos, gwidth, gheight);
  }
}
