class Enlarged extends Alien{
  float dx, dy;
  
  Enlarged(float xpos, float ypos, PImage alienImage){
    super(xpos, ypos, alienImage);
    i_width = ori_image.width*2;
    i_height = ori_image.height*2;
    dx = 0; dy = 0;
  }
    
  void enlarge(){
    x = x + (d==A_FORWARD ? 1 : d==A_BACKWARD ? -1 : 0) * dx;
    y = y + (d==A_DOWN ? 1 : 0) * dy;
    if ((frame % 500) == 0 && frame != 0){
      dx = dx + 2; dy = dy + 2;
    }
  }
}
