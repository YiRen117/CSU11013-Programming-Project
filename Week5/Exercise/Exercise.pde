Alien myAliens[];
Bomb  theBombs[];
Player thePlayer;
ArrayList<Bullet> bullets;

void settings(){
  size(SCREENX, SCREENY);}

void setup() {
  myAliens = new Alien[10];
  thePlayer = new Player(mouseX, loadImage("gun.png"));
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(loadImage("bullet.png")));
  theBombs = new Bomb[10];
  init_alien(myAliens);
}

void init_alien(Alien theArray[]){
  for(int i = 0; i < theArray.length; i++){
    theArray[i] = new Alien(i * MARGIN, 0, loadImage("ufo.png"),
                loadImage("explosion.png"));}
}

void draw(){
  background(255);
  thePlayer.move(mouseX);
  thePlayer.draw();
  for(int i = 0; i < myAliens.length; i++){
      myAliens[i].move(thePlayer);
      myAliens[i].draw();
      if(random(0,50) < 1 && myAliens[i].drop){
        theBombs[i] = myAliens[i].getBomb(loadImage("bomb.png"));
      }
      if(theBombs[i] != null){
        theBombs[i].move();
        theBombs[i].draw();
        theBombs[i].collide(thePlayer);
        if(theBombs[i].collide){
          fill(150);
          PFont myFont = loadFont("Bauhaus93-48.vlw");
          textFont(myFont);
          text("Game Over!", 180, 290);
          thePlayer.stop = true;
        }
        else if(theBombs[i].offScreen()){
          myAliens[i].drop = true;
        }
      }
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
  if(thePlayer.count >= 10){
    fill(150);
    PFont myFont = loadFont("Bauhaus93-48.vlw");
    textFont(myFont);
    text("You Win!", 210, 290);
    thePlayer.stop = true;
  }
}
