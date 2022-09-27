Alien alien;

void settings(){
    size(SCREENX, SCREENY);
  }
  
  void setup(){
    alien = new Alien(random(0,SCREENX/2),random(0,SCREENY/2),loadImage("spacer.gif"));
  }
  
  void draw(){
    background(180,200,160);
    alien.move();
    alien.draw();}
    
  
