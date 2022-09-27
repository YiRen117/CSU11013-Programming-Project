ArrayList<Widget> checkbox, radio;
PFont stdFont;
int temp;

void setup(){
  stdFont = loadFont("Bauhaus93-24.vlw");
  textFont(stdFont);
  temp = 0;
  checkbox = new ArrayList<Widget>();
  radio = new ArrayList<Widget>();
  for(int i = 0; i < 5; i++){
    checkbox.add(new Widget(100, (i+1)*100, 50, 40, nf(i+1,0,0), color(200,225,204),
          color(100, 155, 150), stdFont));
  }
  for(int i = 0; i < 5; i++){
    radio.add(new Widget(400, (i+1)*100, 50, 40, nf(i+1,0,0), color(200,204,225),
          color(125, 150, 200), stdFont));
  }
  size(600,600);
}

void mousePressed(){
  for(int i = 0; i < 5; i++){
    int event = checkbox.get(i).getEvent(mouseX,mouseY);
    if(event != EVENT_NULL){
      checkbox.get(event-1).clicked = true;
    }
  }
  for(int i = 0; i < 5; i++){
    int event = radio.get(i).getEvent(mouseX,mouseY);
    if(event != EVENT_NULL){
      if(temp != 0){
        radio.get(temp-1).clicked = false;
      }
      temp = event;
      radio.get(event-1).clicked = true;
    }
  }
}


void mouseMoved(){
  int event;
  for(int i = 0; i < 5; i++){
    event = checkbox.get(i).getEvent(mouseX,mouseY);
    checkbox.get(i).strokeColor = (event == EVENT_NULL) ? checkbox.get(i).labelColor : color(255);
  }
  for(int i = 0; i < 5; i++){
    event = radio.get(i).getEvent(mouseX,mouseY);
    radio.get(i).strokeColor = (event == EVENT_NULL) ? radio.get(i).labelColor : color(255);
  }
}

void draw(){
  background(255);
  for(int i = 0; i < 5; i++){
    checkbox.get(i).draw();
    radio.get(i).draw();
  }
}
