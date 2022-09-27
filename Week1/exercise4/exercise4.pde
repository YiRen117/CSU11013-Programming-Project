int i;
int j;
void setup(){
size(400, 400);
noStroke();
i=0;
j=350;
}
void draw(){
background(255);
fill(255, 204, 0);
rect(i, 20, 50, 50);
fill(205, 200, 0);
rect(j, 120, 50, 50);
if(i++>=399){
  i=-50;}
if(j--<=-49){
  j=400;}
}
