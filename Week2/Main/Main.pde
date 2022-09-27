  Player theHuman;
  Player theComputer;
  Ball theBall;
  
  void settings(){
    size(SCREENX, SCREENY);
  }
  
  void setup(){
    theBall = new Ball();
    theHuman = new Player(int(theBall.x)-PADDLEWIDTH/2, SCREENY - MARGIN - PADDLEHEIGHT);
    theComputer = new Player(int(theBall.x)-PADDLEWIDTH/2, MARGIN);
  }
  
  void draw(){
    background(0);
    fill(0,130,200);
    PFont speedFont = loadFont("BerlinSansFB-Reg-20.vlw");
    textFont(speedFont);
    text("Speed: "+theBall.speed+"", 20, 60);
    fill(200,0,130);
    PFont countFont = loadFont("BerlinSansFB-Reg-20.vlw");
    textFont(countFont);
    text("Lose: "+theHuman.lose+"", 20, 40);
    fill(130,200,0);
    textFont(countFont);
    text("Win: "+theComputer.lose+"", 520, 40);
    theHuman.moveHuman(mouseX);
    theHuman.draw();
    theComputer.moveComputer(theBall);
    theComputer.draw();
    theBall.move();
    if(theBall.dy > 0){
      theBall.collide(theHuman);}
    else theBall.collide(theComputer);
    theBall.draw();
    if(theBall.y - theBall.radius > SCREENY || theBall.y + theBall.radius < 0){
      if(theBall.dy > 0){
        theHuman.countLose();}
      else theComputer.countLose();
      theBall.reset();
      theComputer.reset();}
    if (!theBall.start && theHuman.lose >= 3){
      fill(255);
      PFont myFont = loadFont("Bauhaus93-48.vlw");
      textFont(myFont);
      text("Game Over!", 180, 300);}
    else if (!theBall.start && theComputer.lose >= 3){
      fill(255);
      PFont myFont = loadFont("Bauhaus93-48.vlw");
      textFont(myFont);
      text("You Win!", 180, 300);}
    if (mousePressed){
      theBall.start = true;
      if(theComputer.lose >= 3 || theHuman.lose >= 3){
        if (theComputer.lose >= 3){
          theComputer.speedUp();
          theBall.speedUp();}
        theHuman.lose = 0;
        theComputer.lose = 0;}}
  }
