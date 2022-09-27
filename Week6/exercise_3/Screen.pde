class Screen{
  color background;
  ArrayList<Widget> widgets;
  int event;
  
  Screen(color background, ArrayList<Widget> widgets){
    this.background = background;
    this.widgets = widgets;
  }
  
  void addWidget(Widget widget1, Widget widget2){
    widgets.add(widget1);
    widgets.add(widget2);
  }
  
  int getEvent(int mX, int mY){
    for(int i = 0; i < widgets.size(); i++){
      if(mX > widgets.get(i).x && mX < widgets.get(i).x + widgets.get(i).width && mY > widgets.get(i).y
        && mY < widgets.get(i).y + widgets.get(i).height){
        return widgets.get(i).event;
      }
    }
    return EVENT_NULL;
  }
  
  void draw(){
    background(background);
    for(int i = 0; i < widgets.size(); i++){
      widgets.get(i).draw();
    }
  }
}
