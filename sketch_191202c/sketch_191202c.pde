import fisica.*;

color black = #000000;
color yellow = #5CFC08;
color blue = #1708FC;
color green = #1BCB69;
color red = #F22027;
color grey = #2B99A2;
color brown = #5d8256;

boolean up, down, left, right, space, w, a, s, d;
boolean canJump;

PImage map;
int x = 0, y = 0;
int gs = 20;
int blockY;

FBox blck, yllw, bl, gr, rd, brwn;
FBox player;
FBomb bomb = null; // Doesn't immediately appear; only appears once timer is ended.

ArrayList<FBox> boxes = new ArrayList<FBox>();
ArrayList mapBlocks;
ArrayList<FContact> contacts = new ArrayList<FContact>();

FWorld world;

void setup() {
  size(1000, 800);
  Fisica.init(this);
  world = new FWorld(-10000, -10000, 10000, 10000);
  world.setGravity(0, 900);

  map = loadImage("Map2.png");

  while (y < map.height) {
    color c = map.get(x, y);

    if (c == black) {
      blck = new FBox (gs, gs);
      blck.setFill(black);
      blck.setPosition(gs*x + gs/2, gs*y + gs/2);
      blck.setStatic(true);

      world.add(blck);
      boxes.add(blck);
    }

    if (c == blue) {
      bl = new FBox (gs, gs);

      bl.setFill(blue);
      bl.setPosition(gs*x + gs/2, gs*y + gs/2);
      bl.setStatic(true);

      world.add(bl);
    }

    if (c == green) {
      gr = new FBox (gs, gs);

      gr.setFill(green);
      gr.setPosition(gs*x + gs/2, gs*y + gs/2);
      gr.setStatic(true);

      world.add(gr);
    }

    if (c == brown) {
      brwn = new FBox (gs, gs);

      brwn.setFill(brown);
      brwn.setPosition(gs*x + gs/2, gs*y + gs/2);
      brwn.setStatic(true);

      world.add(brwn);
    }

    x++; // Moves horizontally
    if (x == map.width) { // If x reached the end, go down one and x = 0
      x = 0;
      y++;
    }
  }

  blockY = (int) random(4);
  // When block is off screen, eliminate from ArrayList.
  //int i = 0;
  //while (i < mapBlocks.size()) { //could also use a for loop
  //  mapBlock mB = mapBlocks.get(i);
  //  mB.show();
  //  mB.act();
  //  if (mB.getX() < 0) {
  //    mapBlocks.remove(i);
  //  } else {
  //    i++;
  //  }
  //}

  //for (int blockX = width; blockX < 100; blockX++) {
  //  blck = new FBox (gs, gs);
  //  blck.setFill(black);
  //  blck.setPosition(blockX, blockY);
  //  blck.setStatic(true);

  //  world.add(blck);
  //}

  player = new FBox(gs*2, gs*2);
  player.setPosition(width/4, height/2);

  player.setStroke(0);
  player.setStrokeWeight(1);
  player.setFill(black);

  player.setDensity(1);
  player.setFriction(1);
  player.setRestitution(0);
  player.setNoStroke();
  player.setRotatable(false);

  world.add(player);
}

void draw() {
  background(255);

  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();

  canJump = false;
  contacts = player.getContacts();

  int i = 0;
  while (i < contacts.size) {
    FContact c = contacts.get(i);
    if (c.contains(blck)) canJump = true;
    i++;
  }

  if (up || w) {
    player.addImpulse(0, -100);
  }
  if (down || s) {
    player.addImpulse(0, 100);
  }
  if (right || d) {
    player.addImpulse(100, 0);
  }
  if (left || a) {
    player.addImpulse(-100, 0);
  }
  if (space && bomb == null) {
    bomb = new FBomb();
  }
  if (bomb != null) bomb.act();
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == ' ') space = true;
  if (keyCode == 'W' || keyCode == 'w') w = true;
  if (keyCode == 'A' || keyCode == 'a') a = true;
  if (keyCode == 'S' || keyCode == 's') s = true;
  if (keyCode == 'D' || keyCode == 'd') d = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == ' ') space = false;
  if (keyCode == 'W' || keyCode == 'w') w = false;
  if (keyCode == 'A' || keyCode == 'a') a = false;
  if (keyCode == 'S' || keyCode == 's') s = false;
  if (keyCode == 'D' || keyCode == 'd') d = false;
}
