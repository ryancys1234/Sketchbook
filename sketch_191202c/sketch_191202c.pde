// Orthographic 3d game

color black = #000000;

PImage map;
int x = 0, y = 0;
int gs = 10;

void setup() {
  size(1000, 800, P3D);

  map = loadImage("Map1.png");
  
  while (y < map.height) {
    color c = map.get(x, y);
    
    if (c == black) {
      box = new FBox (gs, gs);
      box.setFill(black);
      box.setPosition(gs*x + gs/2, gs*y + gs/2);

    }
  }
}

void draw() {
  background(255);
  
  ortho(-width/2, width/2, -height/2, height/2);
}
