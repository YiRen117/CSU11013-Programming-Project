int frame = 0;
Alien myAliens[];
Oscillated theOscillated;
Enlarged theEnlarged;

void settings(){
size(SCREENX, SCREENY);}

void setup() {
myAliens = new Alien[10];
theOscillated = new Oscillated(random(0, SCREENX/2), random(0,SCREENY/2),
  loadImage("spacer.gif"));
theEnlarged = new Enlarged(random(0, SCREENX/2), random(0,SCREENY/2),
  loadImage("spacer.gif"));
init_array(myAliens);
}

void draw(){
background(180,200,160);
move_array(myAliens);
draw_array(myAliens);
}

void init_array(Alien theArray[]){
for(int i=0; i<theArray.length; i++){
  theArray[i] = new Alien(random(0, SCREENX/4), random(0,SCREENY/4),
    loadImage("spacer.gif"));}
theArray[int(random(0,theArray.length))] = theOscillated;
theArray[int(random(0,theArray.length))] = theEnlarged;
}

void draw_array(Alien theArray[]){
for(int i=0; i<theArray.length; i++)
theArray[i].draw();
theArray[int(random(0,theArray.length))].explode();
frame++;
println(frame);
}

void move_array(Alien theArray[]){
for(int i=0; i<theArray.length; i++){
  theArray[i].move();}
theOscillated.oscillate();
theEnlarged.enlarge();
}
