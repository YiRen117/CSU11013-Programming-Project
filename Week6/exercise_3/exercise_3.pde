PFont stdFont;
Widget widget1, widget2, widget3, widget4;
Screen screen1, screen2;
int screen;

void setup(){
  stdFont = loadFont("Bauhaus93-24.vlw");
  textFont(stdFont);
  widget1 = new Widget(200, 180, 200, 40, "Button 1", color(125, 150, 200),
          stdFont, EVENT_BUTTON1);
  widget2 = new Widget(200, 180, 200, 40, "Button 2", color(100, 155, 150),
          stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(200, 380, 200, 40, "Forward", color(125, 150, 200),
          stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(200, 380, 200, 40, "Backward", color(100, 155, 150),
          stdFont, EVENT_BUTTON4);
  screen1 = new Screen(color(200,204,225), new ArrayList<Widget>());
  screen2 = new Screen(color(200,225,204), new ArrayList<Widget>());
  screen1.addWidget(widget1, widget3);
  screen2.addWidget(widget2, widget4);
  screen = 1;
  size(600,600);
}


void mousePressed(){
  int event;
  if(screen == 1){
    event = screen1.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        println("Button1 is pressed.");
        break;
      case EVENT_BUTTON3:
        screen = 2;
        println("Forward is pressed.");
        break;
    }
  }
  else {
    event = screen2.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON2:
        println("Button2 is pressed.");
        break;
      case EVENT_BUTTON4:
        screen = 1;
        println("Backward is pressed.");
        break;
    }
  }
}

void mouseMoved(){
  int event;
  if(screen == 1){
    event = screen1.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        widget1.strokeColor = color(255);
        break;
      case EVENT_BUTTON3:
        widget3.strokeColor = color(255);
        break;
      case EVENT_NULL:
        widget1.strokeColor = color(0);
        widget3.strokeColor = color(0);
        break;
    }
  }
  else{
    event = screen2.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON2:
        widget2.strokeColor = color(255);
        break;
      case EVENT_BUTTON4:
        widget4.strokeColor = color(255);
        break;
      case EVENT_NULL:
        widget2.strokeColor = color(0);
        widget4.strokeColor = color(0);
        break;
    }
  }    
}


void draw(){
  background(100,100,100);
  if(screen == 1){
    screen1.draw();
  }
  else{
    screen2.draw();
  }
}
