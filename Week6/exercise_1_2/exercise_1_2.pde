PFont stdFont;
color sqrColor;
Widget widget1, widget2, widget3;

void setup(){
  stdFont = loadFont("Bauhaus93-24.vlw");
  textFont(stdFont);
  widget1 = new Widget(150, 400, 100, 40, "red", color(55),
          stdFont, EVENT_BUTTON1);
  widget2 = new Widget(350, 400, 100, 40, "green", color(55),
          stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(550, 400, 100, 40, "blue", color(55),
          stdFont, EVENT_BUTTON3); 
  size(800, 600);
  sqrColor = color(200);
}

void mousePressed(){
  int event;
  event = widget1.getEvent(mouseX,mouseY);
  if(event == EVENT_BUTTON1){
    sqrColor = widget1.labelColor;
  }
  else {
    event = widget2.getEvent(mouseX,mouseY);
    if(event == EVENT_BUTTON2){
      sqrColor = widget2.labelColor;
    }
    else{
      event = widget3.getEvent(mouseX,mouseY);
      if(event == EVENT_BUTTON3){
        sqrColor = widget3.labelColor;
      }
    }
  }
}

void mouseMoved(){
  int event;
  event = widget1.getEvent(mouseX,mouseY);
  if(event == EVENT_BUTTON1){
    widget1.strokeColor = color(255);
  }
  else {
    widget1.strokeColor = widget1.labelColor;
    event = widget2.getEvent(mouseX,mouseY);
    if(event == EVENT_BUTTON2){
      widget2.strokeColor = color(255);
    }
    else{
      widget2.strokeColor = widget2.labelColor;
      event = widget3.getEvent(mouseX,mouseY);
      if(event == EVENT_BUTTON3){
        widget3.strokeColor = color(255);
      }
      else{
        widget3.strokeColor = widget3.labelColor;
      }
    }
  }
}


void draw(){
  background(150);
  widget1.draw();
  widget2.draw();
  widget3.draw();
  fill(sqrColor);
  noStroke();
  rect(300,100,200,200);
}
