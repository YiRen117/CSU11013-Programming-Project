class Widget{
  int x, y, dy, width, height;
  String label; int event;
  color widgetColor1, widgetColor2, labelColor, strokeColor;
  PFont widgetFont;
  boolean clicked;

  Widget(int x,int y, int width, int height, String label,
    color unclickedColor, color clickedColor, PFont widgetFont){
    this.x = x; this.y = y;
    this.width = width; this.height = height;
    this.label = label;
    this.widgetColor1 = unclickedColor; this.widgetColor2 = clickedColor;
    this.widgetFont = widgetFont;
    event = int(label);
    clicked = false;
  }
  
  void move(){
    y = y - dy;
  }
  
  void draw(){
    fill(clicked ? widgetColor2 : widgetColor1);
    stroke(strokeColor,150);
    strokeWeight(5);
    rect(x,y,width,height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+10, y+height-10);
  }
  
  int getEvent(int mX, int mY){
    if(mX > x && mX < x + width && mY > y && mY < y + height){
      return event;
    }
    return EVENT_NULL;
  }
}
