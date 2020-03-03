// Basketball game based on Slime Volleyball (oneslime.net).
//
/*
   Learned: Boolean variables that stays true after their initiators are false must be put outside of such initiator loops.
   Problems: Foul system (2 secs of player collison).
 */

import fisica.*;

FWorld world;

int mode = 0;
final int game = 0; 
final int gameOverLeft = 1;
final int gameOverRight = 2;

boolean leftupkey, leftdownkey, leftleftkey, leftrightkey, leftekey, leftqkey;
boolean rightupkey, rightdownkey, rightleftkey, rightrightkey, rightpkey, rightikey;
boolean leftCanJump = true, rightCanJump = true;
boolean leftPlayerWins = false, rightPlayerWins = false;
boolean ballUsed = false;
boolean lThruHoop = false, rThruHoop;
boolean lTest = false, rTest = false;

int rightScore = 0, leftScore = 0;
int betweenGamesTime = 180;
int timer = 0, intTimeSeconds = 0, timeMinutes = 0;
int leftFoul = 0, rightFoul = 0;
int lBounceTimes = 0, rBounceTimes = 0;
int seq = 0;
int buttonColor;
int lCollison = 1, rCollison = 1;
int bXNum1, bXNum2;

FBox ground, lwall, twall, rwall, lbackboard, rbackboard, lstand, rstand;
FCircle lplayer, rplayer, basketball;
FLine lbasket, rbasket;

PImage bv, bc, sbv, lbh, rbh, j, bg;

ArrayList lcontacts, rcontacts, bcontacts;
ArrayList<instruction> instructions = new ArrayList<instruction>();

void setup() {
  size(1000, 800);
  mode = 0;
  bv = loadImage("basketball.png");
  bv.resize(50, 50);

  bc = loadImage("basketballcourt.jpg");
  bc.resize(width, height/4);

  sbv = loadImage("scoreboard.png");
  sbv.resize(300, 160);

  lbh = loadImage("lhoop.png");
  lbh.resize(100, 90);

  rbh = loadImage("rhoop.png");
  rbh.resize(100, 90);

  j = loadImage("jersey.png");
  j.resize(50, 50);

  bg = loadImage("background.jpg");
  bg.resize(1000, 800);

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 800);

  // Basketball court ================================================================
  ground = new FBox(width, height/4);
  ground.setPosition(width/2, height*0.9);

  ground.setStatic(true);
  ground.setFill(102, 183, 91);
  ground.attachImage(bc);
  ground.setFriction(0);
  ground.setNoStroke();
  ground.setGrabbable(false);

  world.add(ground);

  // Left wall ================================================================
  lwall = new FBox(500, height);

  lwall.setPosition(-250, height/2);

  lwall.setStatic(true);
  lwall.setFill(0);
  lwall.setFriction(0);
  lwall.setNoStroke();
  lwall.setGrabbable(false);

  world.add(lwall);

  // Top wall ================================================================
  twall = new FBox(width, 500);

  twall.setPosition(width/2, -250);

  twall.setStatic(true);
  twall.setFill(0);
  twall.setFriction(0);
  twall.setNoStroke();
  twall.setGrabbable(false);

  world.add(twall);

  // Right wall ================================================================
  rwall = new FBox(500, height);

  rwall.setPosition(width+250, height/2);

  rwall.setStatic(true);
  rwall.setFill(0);
  rwall.setFriction(0.5);
  rwall.setNoStroke();
  rwall.setGrabbable(false);

  world.add(rwall);

  // Left basket ================================================================
  lbasket = new FLine(width/12, height/2 - 100, width/12 + 100, height/2 - 100);

  lbasket.setStroke(150);
  lbasket.setStrokeWeight(5);
  lbasket.setFriction(0);
  lbasket.setStatic(true);
  lbasket.setGrabbable(false);

  world.add(lbasket);

  lbackboard = new FBox(10, 150);

  lbackboard.setPosition(width/12 - 10, height/2 - 150);
  lbackboard.setFill(150);
  lbackboard.setFriction(0);
  lbackboard.setNoStroke();
  lbackboard.setStatic(true);
  lbackboard.setGrabbable(false);

  world.add(lbackboard);

  lstand = new FBox(30, 350);

  lstand.setPosition(width/12 - 35, height/2 + 50);
  lstand.setFill(150);
  lstand.setNoStroke();
  lstand.setStatic(true);
  lstand.setGrabbable(false);

  world.add(lstand);

  // Right basket ================================================================
  rbasket = new FLine(width*11/12, height/2 - 100, width*11/12 - 100, height/2 - 100);

  rbasket.setStroke(150);
  rbasket.setStrokeWeight(5);
  rbasket.setFriction(0);
  rbasket.setStatic(true);
  rbasket.setGrabbable(false);

  world.add(rbasket);

  rbackboard = new FBox(10, 150);

  rbackboard.setPosition(width*11/12 + 10, height/2 - 150);
  rbackboard.setFill(150);
  rbackboard.setFriction(0);
  rbackboard.setNoStroke();
  rbackboard.setStatic(true);
  rbackboard.setGrabbable(false);

  world.add(rbackboard);

  rstand = new FBox(30, 350);

  rstand.setPosition(width*11/12 + 35, height/2 + 50);
  rstand.setFill(150);
  rstand.setNoStroke();
  rstand.setStatic(true);
  rstand.setGrabbable(false);

  world.add(rstand);

  // Left player ================================================================
  lplayer = new FCircle(100);
  lplayer.setPosition(width*0.25, height*0.7);

  lplayer.setFill(93, 67, 214);

  lplayer.setDensity(1);
  lplayer.setFriction(1);
  lplayer.setRestitution(0);
  lplayer.setNoStroke();
  lplayer.setGrabbable(false);

  world.add(lplayer);

  // Right player ================================================================
  rplayer = new FCircle(100);
  rplayer.setPosition(width*0.75, height*0.7);

  rplayer.setFill(255, 18, 34);

  rplayer.setDensity(1);
  rplayer.setFriction(1);
  rplayer.setRestitution(0);
  rplayer.setNoStroke();
  rplayer.setGrabbable(false);

  world.add(rplayer);

  // Basketball ================================================================
  bXNum1 = (int) random(2);
  if (bXNum1 == 0) {
    bXNum2 = 250;
  } else if (bXNum1 == 1) {
    bXNum2 = 750;
  }

  basketball = new FCircle(50);
  basketball.attachImage(bv);
  basketball.setPosition(bXNum2, height/2);

  basketball.setStroke(0);
  basketball.setStrokeWeight(1);
  basketball.setFill(152, 250, 73);

  basketball.setRotatable(true);
  basketball.setDensity(1);
  basketball.setFriction(0);
  basketball.setRestitution(0.8);

  world.add(basketball);
}

void draw() {
  background(bg);
  world.step();
  world.draw();

  timer++;
  if (timer == 60) {
    intTimeSeconds++;
    timer = 0;
  }

  if (leftekey == false || rightikey == false) {
    ballUsed = false;
  }

  // Left player control ================================================================
  leftCanJump = false;
  ArrayList<FContact> lcontacts = lplayer.getContacts();

  for (FContact c : lcontacts) {
    if (c.contains(ground)) leftCanJump = true;
    if (c.contains(rplayer)) {
      lCollison++;
      println(lCollison);
    }
  }
  
  if (lCollison % 120 == 0) {
    leftFoul++;
  }

  if (leftupkey && leftCanJump) {
    lplayer.addImpulse(0, -5000);
  }
  if (leftdownkey) {
    lplayer.addImpulse(0, 700);
  }
  if (leftrightkey) {
    lplayer.addImpulse(100, 0);
  }
  if (leftleftkey) {
    lplayer.addImpulse(-100, 0);
  }
  if (dist(lplayer.getX(), lplayer.getY(), basketball.getX(), basketball.getY()) < 90 && ballUsed == false) {
    if (leftekey) {
      basketball.setPosition(basketball.getX()+25, height*0.7 - 10);
      basketball.addImpulse(lplayer.getX(), 200);
      lBounceTimes++;
    }
    if (dist(lplayer.getX(), lplayer.getY(), lbasket.getX(), lbasket.getY()) < 1000) {
      if (leftqkey) {
        basketball.addImpulse(2000, -2000);
        basketball.setRotation(2);
      }
    }
    ballUsed = true;
  }

  // Right player control ================================================================
  rightCanJump = false;
  ArrayList<FContact> rcontacts = rplayer.getContacts();

  for (FContact c : rcontacts) {
    if (c.contains(ground)) rightCanJump = true;
    if (c.contains(rplayer)) {
      rCollison++;
      println(rCollison);
    }
  }

  if (rCollison % 120 == 0) {
    rightFoul++;
  }

  if (rightupkey && rightCanJump) {
    rplayer.addImpulse(0, -5000);
  }
  if (rightdownkey) {
    rplayer.addImpulse(0, 700);
  }
  if (rightrightkey) {
    rplayer.addImpulse(100, 0);
  }
  if (rightleftkey) {
    rplayer.addImpulse(-100, 0);
  }
  if (dist(rplayer.getX(), rplayer.getY(), basketball.getX(), basketball.getY()) < 90 && ballUsed == false) {
    if (rightpkey) {
      basketball.setPosition(basketball.getX()-25, height*0.7 - 10);
      basketball.addImpulse(-rplayer.getX(), 200);
      rBounceTimes++;
    }
    if (dist(rplayer.getX(), rplayer.getY(), rbasket.getX(), rbasket.getY()) < 1000) {
      if (rightikey) {
        basketball.addImpulse(-2000, -2000);
        basketball.setRotation(2);
      }
    }
    ballUsed = true;
  }

  // Basketball control ================================================================
  ArrayList<FContact> bcontacts = basketball.getContacts();

  for (FContact b : bcontacts) {
    if (b.contains(rbasket)) {
      leftScore++;
      basketball.setPosition(width*11/12 - 50, height/2 - 70);
      basketball.setVelocity(basketball.getX(), 10);
      lThruHoop = true;
    }
    
    if (b.contains(lbasket)) {
      rightScore++;
      basketball.setPosition(width/12 + 50, height/2 - 70);
      basketball.setVelocity(basketball.getX(), 10);
      rThruHoop = true;
    }

    if (b.contains(ground)) {
      basketball.setRotation(0.5);
    }
  }

  if ((basketball.getY() >= height*0.7) && lThruHoop == true) {
    lplayer.setPosition(width*0.25, height*0.7 + 10);
    lplayer.setVelocity(0, 0);
    lplayer.setForce(0, 0);
    rplayer.setPosition(width*0.75, height*0.7 + 10);
    rplayer.setVelocity(0, 0);
    rplayer.setForce(0, 0);
    
    bXNum2 = 250;
    
    basketball.setPosition(bXNum2, height/2);
    basketball.setVelocity(0, 0);
    basketball.setForce(0, 0);

    intTimeSeconds = 0;
    timeMinutes = 0;
    lThruHoop = false;
  }
  
  if ((basketball.getY() >= height*0.7) && rThruHoop == true) {
    lplayer.setPosition(width*0.25, height*0.7 + 10);
    lplayer.setVelocity(0, 0);
    lplayer.setForce(0, 0);
    rplayer.setPosition(width*0.75, height*0.7 + 10);
    rplayer.setVelocity(0, 0);
    rplayer.setForce(0, 0);
    
    bXNum2 = 750;
    
    basketball.setPosition(bXNum2, height/2);
    basketball.setVelocity(0, 0);
    basketball.setForce(0, 0);

    intTimeSeconds = 0;
    timeMinutes = 0;
    rThruHoop = false;
  }

  if (mode == 0) {
    game();
  } else if (mode == 1) {
    leftWins();
  } else if (mode == 2) {
    rightWins();
  }
}

void keyPressed() {
  if (keyCode == UP) rightupkey = true;
  if (keyCode == DOWN) rightdownkey = true;
  if (keyCode == LEFT) rightleftkey = true;
  if (keyCode == RIGHT) rightrightkey = true;
  if (keyCode == 'P' || keyCode == 'p') rightpkey = true;
  if (keyCode == 'I' || keyCode == 'i') rightikey = true;
  if (keyCode == 'W' || keyCode == 'w') leftupkey = true;
  if (keyCode == 'S' || keyCode == 's') leftdownkey = true;
  if (keyCode == 'A' || keyCode == 'a') leftleftkey = true;
  if (keyCode == 'D' || keyCode == 'd') leftrightkey = true;
  if (keyCode == 'E' || keyCode == 'e') leftekey = true;
  if (keyCode == 'Q' || keyCode == 'q') leftqkey = true;
}

void keyReleased() {
  if (keyCode == UP) rightupkey = false;
  if (keyCode == DOWN) rightdownkey = false;
  if (keyCode == LEFT) rightleftkey = false;
  if (keyCode == RIGHT) rightrightkey = false;
  if (keyCode == 'P' || keyCode == 'p') rightpkey = false;
  if (keyCode == 'I' || keyCode == 'i') rightikey = false;
  if (keyCode == 'W' || keyCode == 'w') leftupkey = false;
  if (keyCode == 'S' || keyCode == 's') leftdownkey = false;
  if (keyCode == 'A' || keyCode == 'a') leftleftkey = false;
  if (keyCode == 'D' || keyCode == 'd') leftrightkey = false;
  if (keyCode == 'E' || keyCode == 'e') leftekey = false;
  if (keyCode == 'Q' || keyCode == 'q') leftqkey = false;
}

void mousePressed() {
  if (mode == 0) {
    gameMouseReleased();
  }
}

void mouseReleased() {
  if (mode == 1) {
    leftMouseReleased();
  } else if (mode == 2) {
    rightMouseReleased();
  }
}
