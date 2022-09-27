int i;
int j;
int k;
void setup(){
size(400, 400);
noStroke();
i=150;
j=175;
k=175;
}
void draw(){
background(255);
fill(205, 200, 0);
rect(i, 125, 50, 50);
fill(255, 130, 0);
rect(200, k, 50, 50);
fill(255, 204, 0);
rect(j, 150, 50, 50);
if(i--<=-49){
  i=400;}
if(j++>=399){
  j=-50;}
if(k++>=399){
  k=-50;}
}
