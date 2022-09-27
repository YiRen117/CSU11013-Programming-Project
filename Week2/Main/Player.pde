class Player{
  float xpos; float ypos; float xpre;
  int lose; float comSpeed; float humanSpeed;
  color paddleColor = color(100);
  
  Player(float screenX, float screenY){
    xpos = screenX;
    ypos = screenY;
    lose = 0;
    comSpeed = 1.25;
  }
  
  void moveHuman(int x){
    xpre = xpos;
    if (x > SCREENX - PADDLEWIDTH){
      xpos = SCREENX - PADDLEWIDTH;
    }
    else xpos = x;
    humanSpeed = xpos - xpre;
  }
  
  void moveComputer(Ball b){
    if (b.x - (xpos + PADDLEWIDTH/2) > 0){
      xpos = xpos + comSpeed;}
    else if (b.x - (xpos + PADDLEWIDTH/2) < 0){
      xpos = xpos - comSpeed;}
  }
  
  void draw(){
    fill(paddleColor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void countLose(){
    lose = lose + 1;}
      
  void speedUp(){
    comSpeed = comSpeed + 2;}
    
  void reset(){
    xpos = int(theBall.x)-PADDLEWIDTH/2;}
}
