// Making a controllable bouncing ball
boolean upkey, downkey, leftkey, rightkey, spacekey;
ArrayList<Object> myObjects;
float r, r1 = 0, r2 = 120, r3 = 240;
int varx, vary = 0;

Object object;
Obstacle obstacle;

void setup() {
  size(1000, 800);
  myObjects = new ArrayList<Object> ();

  object = new Object();
  obstacle = new Obstacle();
  colorMode(HSB, 360);
}

void draw() {
  background(360, 0, 360);
  object.show();
  object.act();

  pushMatrix();
  translate(varx, vary);
  fill(222, 60, 260);
  noStroke();
  rect(0, 600, 20000, 200);
  popMatrix();

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
}

void keyPressed() {
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
  //PVector location, velocity, direction, gravity;

  float lx = width/2, ly = height/2, vx = 0, vy = 1, dx = 0, dy = 0, gx = 0, gy = 0.2;
  Object() {
    //location = new PVector(width/2, height/2);
    //velocity = new PVector(0, 1);
    //direction = new PVector(0, 0);
    //gravity = new PVector(0, 0.2);
  }

  void show() {
    pushMatrix();
    fill(0);
    stroke(0);
    ellipse(lx, ly, 50, 50);
    popMatrix();
  }

  void act() {
    //location.add(velocity);
    //velocity.add(gravity);

    lx = lx + vx;
    ly = ly + vy;
    vx = vx + gx;
    vy = vy + gy;

    int movingDelayR = 10, movingDelayL = 10;
    boolean allowR = false, allowL = false;

    if (rightkey == true) {
      lx = lx + 5;
      allowR = true;
    }
    if (rightkey == false && allowR == true) {
      //movingDelayR--;
      for (int i = 10; i < 0; i--) {
        lx = lx - i;
        allowR = false;
      }
    }
    if (leftkey == true) {
      lx = lx - 5;
      allowL = true;
    }
    if (rightkey == false && allowL == true) {
      //movingDelayL--;
      for (int i = 10; i < 0; i--) {
        lx = lx + i;
        allowL = false;
      }
    }
    if ((movingDelayR < 10) && (movingDelayR > 0)) {
      lx = lx + 5;
    }
    if ((movingDelayL < 10) && (movingDelayL > 0)) {
      lx = lx - 5;
    }
    if (ly + 30 >= 600) { // Used abs() here to prevent the movable ball from getting stuck outside the limits of the realm (a classic problem).
      vy = abs(vy) * -0.75;
    }
    //if (location.x == Arc.location.x + 100, location.y == Arc.location.y + 100) {
    //  velocity.y = velocity.y * -1;
    //  velocity.x = velocity.x * -1;
    //}
    if (spacekey) {
      vy = abs(vy) * -1;
    }
    if (lx < 0) {
      vx = abs(vx) * -1;
    }
    if (ly < 0) {
      vy = abs(vy) * -1;
    }
    // Moving background and obstacles;
    if (lx > width/2) {
      varx = varx - 50;
    }
  }
}

class Obstacle {
  float lx_, ly_;
  Obstacle() {
    float lx_1 = width;
    lx_ = random(100) + lx_1;
  }

  void show() {
    fill(50, 150, 347);
    rect(lx_, ly_, random(25), random(50));
  }


  void act() {
  }
}
