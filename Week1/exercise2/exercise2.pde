int i;
void setup(){
size(400, 400);
noStroke();
i=0;
}
void draw(){
background(255);
fill(255, 204, 0);
rect(i, 60, 50, 50);
if(i++>=399){
  i=-50;}
}
