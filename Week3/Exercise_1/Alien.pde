final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int SCREENX = 600;
final int SCREENY = 600;

class Alien {
  float x, y, dy;  int d;  boolean left;
  PImage image;
 
  Alien(float xpos, float ypos, PImage alienImage){
    x=xpos; y=ypos; dy = 0;
    d = A_FORWARD;
    image = alienImage;
    left = true;
  }

 void move(){
   if (d == A_FORWARD) x++;
   else if (d == A_BACKWARD) x--;
   else  {y++; dy++;}
   
   if (x >= SCREENX - image.width || x <= 0){
     d = A_DOWN;}
     
   if(dy >= image.height){
     if(left) {d = A_BACKWARD; left = false;}
     else {d = A_FORWARD; left = true;}
     dy = 0;}
   }

  void draw(){
    image(image, x, y);}
}
