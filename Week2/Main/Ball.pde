class Ball{
  float x; float y;
  float dx; float dy; float speed;
  int radius;
  boolean start;
  color ballColor = color(204, 150,0);
  
  Ball(){
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1,2); dy = random(1,2);
    radius = 15;
    start = true;
  }
  
  void move(){
    if (start){
      x = x + dx; y = y + dy;
      speed = int(dx * dx + dy * dy) ^ (1/2);}
  }
  
  void draw(){
    fill(ballColor);
    ellipse(int(x), int(y), radius,radius);
  }
  
  void collide(Player tp){
    if(y + radius >= tp.ypos && y - radius < tp.ypos + PADDLEHEIGHT
      && x >= tp.xpos && x <= tp.xpos + PADDLEWIDTH){
      dy = -dy;}
    else if (x - radius <= 0 || x + radius >= SCREENX){
      dx = -dx;}} 
  
  void reset(){
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    start = false;
  }
  
  void speedUp(){
    dx = dx * 2; dy = dy * 2;}
}
