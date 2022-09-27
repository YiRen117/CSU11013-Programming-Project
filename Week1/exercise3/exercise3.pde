int i;
int j;
void setup(){
size(400, 400);
noStroke();
i=0;
j=-400;
}
void draw(){
background(255);
fill(255, 204, 0);
rect(i, 20, 50, 50);
rect(j, 20, 50, 50);
if(i++>=399){
  i=-400;}
if(j++>=399){
  j=-400;}
}
