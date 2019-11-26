//making a controllable bouncing ball
boolean upkey, downkey, leftkey, rightkey, spacekey;
ArrayList<Object> myObjects;
int varx, vary;

Object object;

void setup() {
  size(1000, 800);
  myObjects = new ArrayList<Object> ();

  object = new Object();
}

void draw() {
  background(255);
  object.show();
  object.act();
  pushMatrix();
  translate(varx, vary);
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
    velocity = new PVector(1, 1);
    direction = new PVector(0, 1);
    gravity = new PVector(0, 0.2);
  }

  void show() {
    pushMatrix();
    fill(0);
    ellipse(location.x, location.y, 50, 50);
    popMatrix();
  }
  
  void act() {
    location.add(velocity);
    velocity.add(gravity);
    if (rightkey) velocity.add(direction);
    if (leftkey) velocity.sub(direction);
    if (location.y > height) velocity.y = velocity.y * -0.75;
    if (spacekey) velocity.y = velocity.y * -1.5;
  }
}
