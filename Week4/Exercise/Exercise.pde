Alien myAliens[];
Player thePlayer;
ArrayList<Bullet> bullets;

void settings(){
  size(SCREENX, SCREENY);}

void setup() {
  myAliens = new Alien[30];
  thePlayer = new Player(mouseX, loadImage("gun.png"));
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(loadImage("bullet.png")));
  init_array(myAliens);
}

void init_array(Alien theArray[]){
  for(int i = 0; i < theArray.length; i++){
    theArray[i] = new Alien(-i * MARGIN, 0, loadImage("ufo.png"),
                loadImage("explosion.png"));}
}

void draw(){
  background(255);
  thePlayer.move(mouseX);
  thePlayer.draw();
  for(int i = 0; i < myAliens.length; i++){
    myAliens[i].move();
    myAliens[i].draw();
    for(int k = 0; k < bullets.size(); k++){
        bullets.get(k).collide(myAliens[i], thePlayer, k+1);
    }
  }
  for(int k = bullets.size()-1; k >= 0; k--){
    bullets.get(k).start(thePlayer, 2*MARGIN*k);
    bullets.get(k).move();
    bullets.get(k).draw();
    if(bullets.get(k).level == 3){
      bullets.add(new Bullet(loadImage("bullet.png")));
      bullets.get(k).level++;
    }
  }
  if(thePlayer.count >= 30){
    fill(150);
      PFont myFont = loadFont("Bauhaus93-48.vlw");
      textFont(myFont);
      text("You Win!", 210, 290);
    }
}
