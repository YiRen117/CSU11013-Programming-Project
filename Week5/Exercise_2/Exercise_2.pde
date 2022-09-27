Alien myAliens[];
Bomb  theBombs[];
Player thePlayer;
Shield theShields[];
ArrayList<Bullet> bullets;

void settings(){
  size(SCREENX, SCREENY);}

void setup() {
  myAliens = new Alien[10];
  thePlayer = new Player(mouseX, loadImage("gun.png"));
  bullets = new ArrayList<Bullet>();
  bullets.add(new Bullet(loadImage("bullet.png")));
  theBombs = new Bomb[10];
  theShields = new Shield[3];
  init_alien(myAliens);
  init_shield(theShields);
}

void init_alien(Alien theArray[]){
  for(int i = 0; i < theArray.length; i++){
    theArray[i] = new Alien(i * MARGIN, 0, loadImage("ufo.png"),
                loadImage("explosion.png"));}
}

void init_shield(Shield theShields[]){
  for (int i = 0; i < theShields.length; i++){
    theShields[i] = new Shield(loadImage("shield.png"));
  }
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
        theBombs[i].move(thePlayer);
        theBombs[i].draw();
        for(int j = 0; j < theShields.length; j++){
          theBombs[i].collideShield(theShields[j]);
        }
        theBombs[i].collidePlayer(thePlayer);
        if(theBombs[i].collide && thePlayer.die){
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
        for(int j = 0; j < theShields.length; j++){
          bullets.get(k).collideShield(theShields[j]);
        }
        bullets.get(k).collide(myAliens[i], thePlayer, k+1);
      }
    }
  for(int k = bullets.size()-1; k >= 0; k--){
    bullets.get(k).start(thePlayer, 2*MARGIN*k);
    bullets.get(k).move(thePlayer);
    bullets.get(k).draw();
    if(bullets.get(k).level == 3){
      bullets.add(new Bullet(loadImage("bullet.png")));
      bullets.get(k).level++;
    }
  }
  for(int j = 0; j < theShields.length; j++){
    theShields[j].level(loadImage("shield_2.png"),loadImage("shield_3.png"));
    theShields[j].draw();
  }
  if(thePlayer.count >= 10){
    fill(150);
    PFont myFont = loadFont("Bauhaus93-48.vlw");
    textFont(myFont);
    text("You Win!", 210, 290);
  }
}
