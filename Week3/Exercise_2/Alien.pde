final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int SCREENX = 600;
final int SCREENY = 600;

class Alien {
  float x, y, check;  int d;
  int i_width, i_height;
  boolean left; boolean explode, enlarge, oscillate;
  PImage image, ori_image;
 
  Alien(float xpos, float ypos, PImage alienImage){
    x=xpos; y=ypos; check = 0;
    d = A_FORWARD;
    ori_image = alienImage;
    image = alienImage;
    i_width = ori_image.width;
    i_height = ori_image.height;
    left = true;
    explode = false;
    enlarge = false;
    oscillate = false;
  }

 void move(){
   if (d == A_FORWARD) {x++; check = y;}
   else if (d == A_BACKWARD) {x--; check = y;}
   else  {y++;}
   
   if (x >= SCREENX - i_width || x <= 0){
     d = A_DOWN;}
     
   if(y - check >= i_height){
     if(left) {d = A_BACKWARD; left = false;}
     else {d = A_FORWARD; left = true;}
     check = 0;}
   }

  void explode(){
    if(!explode){
      image = loadImage("exploding.gif");
      explode = true;}
  }
  
  void draw(){
    image(image, x, y, i_width, i_height);}
}
