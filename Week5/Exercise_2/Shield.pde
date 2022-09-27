class Shield{
  float xpos; float ypos;
  PImage shieldImg;
  int swidth, sheight, lives;
  
  Shield(PImage shieldImage_1){
    swidth = 40; sheight = 45;
    xpos = random(0, SCREENX - swidth);
    ypos = random(SCREENY/2, SCREENY - MARGIN - sheight);
    lives = 3;
    shieldImg = shieldImage_1;
  }
  
  void collideBomb(Bomb bomb){
    if(!bomb.collide && lives > 0 && bomb.y + bomb.bheight >= ypos && bomb.x <= xpos + swidth
        && bomb.x + bomb.bwidth >= xpos){
          bomb.collide = true;
          lives--;
    }
  }
  
  void level(PImage shieldImage_2, PImage shieldImage_3){
    if(lives == 2){
      shieldImg = shieldImage_2;
    }
    if(lives == 1){
      shieldImg = shieldImage_3;
    }
  }
  
  void draw(){
    if(lives > 0){
      image(shieldImg, xpos, ypos, swidth, sheight);
    }
  }
}
