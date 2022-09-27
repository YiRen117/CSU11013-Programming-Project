class Oscillated extends Alien{
  float dy, dx;
  
  Oscillated(float xpos, float ypos, PImage alienImage){
    super(xpos, ypos, alienImage);
    dx = 0;
  }
    
  void oscillate(){
    x = x + (d==A_FORWARD ? 1 : d==A_BACKWARD ? -1 : 0) * dx;
    dy = random(3,5)*sin(0.05*x);
    y = y + (d==A_DOWN ? 0 : 1) * dy;
    if ((frame % 500) == 0 && frame != 0){
      dx = dx + 2;
    }
  }
}
