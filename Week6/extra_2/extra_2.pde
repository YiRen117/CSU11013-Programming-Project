ArrayList<Widget> widgets;
PFont stdFont;
int temp;

void setup(){
  stdFont = loadFont("Bauhaus93-24.vlw");
  textFont(stdFont);
  widgets = new ArrayList<Widget>();
  for(int i = 0; i < 100; i++){
    widgets.add(new Widget(250, (i+1)*100, 60, 40, nf(i+1,0,0), color(200,225,204),
          color(100, 155, 150), stdFont));
  }
  size(600,600);
}

void mousePressed(){
  for(int i = 0; i < 100; i++){
    int event = widgets.get(i).getEvent(mouseX,mouseY);
    if(event != EVENT_NULL){
      if(temp != 0){
        widgets.get(temp-1).clicked = false;
      }
      temp = event;
      widgets.get(event-1).clicked = true;
    }
  }
}


void mouseMoved(){
  int event;
  for(int i = 0; i < 100; i++){
    event = widgets.get(i).getEvent(mouseX,mouseY);
    widgets.get(i).strokeColor = (event == EVENT_NULL) ? widgets.get(i).labelColor : color(255);
  }
}

void mouseWheel(MouseEvent event){
  int roll = event.getCount() * 10;
  for(int i = 0; i < 100; i++){
    widgets.get(i).dy = roll;
    widgets.get(i).move();
  }
  
}

void draw(){
  background(255);
  for(int i = 0; i < 100; i++){
    widgets.get(i).draw();
  }
}
