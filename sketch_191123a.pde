//making a controllable bouncing ball
boolean upkey, downkey, leftkey, rightkey, spacekey;
ArrayList<Object> myObjects;
float r, r1 = 0, r2 = 120, r3 = 240;
int varx, vary = 0;

Object object;
Arc arc;

void setup() {
  size(1000, 800);
  myObjects = new ArrayList<Object> ();

  object = new Object();
  arc = new Arc();
  varx = varx - 50;
  colorMode(HSB, 360);
}

void draw() {
  background(360, 0, 360);
  object.show();
  object.act();
  
  pushMatrix();
  translate(varx, vary);
  fill(222, 60, 260);
  rect(0, 600, 2000, 200);
  
  pushMatrix();
  translate(width/4, height/4);
  noFill();
  rotate(radians(r));
  stroke(r1, 360, 300);
  arc(0, 0, 200, 200, 0, HALF_PI+QUARTER_PI);

  rotate(radians(-r*2));
  stroke(r2, 360, 300);
  arc(0, 0, 100, 100, HALF_PI, PI+HALF_PI);

  rotate(radians(r*2));
  stroke(r3, 360, 300);
  arc(0, 0, 50, 50, PI+QUARTER_PI, TWO_PI);
  strokeWeight(10);
  popMatrix();
  r++;
  r1++;
  r2++;
  r3++;
  if (r1 == 360) {
    r1 = 0;
  }
  if (r2 == 360) {
    r2 = -120;
  }
  if (r3 == 360) {
    r3 = -240;
  }
  popMatrix();
}

void keyPressed() { //records arrow keys in boolean variables
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ') spacekey = false;
}

class Object {
  PVector location, velocity, direction, gravity;
  Object() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0 , 1);
    direction = new PVector(0, 1);
    gravity = new PVector(0, 0.2);
  }

  void show() {
    pushMatrix();
    fill(0);
    stroke(0);
    ellipse(location.x, location.y, 50, 50);
    popMatrix();
  }

  void act() {
    location.add(velocity);
    velocity.add(gravity);
    if (rightkey) {
      
    }
    if (leftkey) {
      velocity.sub(direction);
    }
    if (location.y + 25 > 600) velocity.y = velocity.y * -0.75;
    //if (location.x == Arc.location.x + 100, location.y == Arc.location.y + 100) {
    //  velocity.y = velocity.y * -1;
    //  velocity.x = velocity.x * -1;
    //}
    if (spacekey && location.y == 600) {
      velocity.x = velocity.x * -1.5;
      velocity.y = velocity.y * -1.5;
    }
  }
}

class Arc {
  Arc() {
  }

  void show() {
  }

  void act() {
  }
}
