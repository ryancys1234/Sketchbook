PVector location;
PVector velocity;
PVector gravity;

PFont gameFont;

int mode = 0;
final int StartPage = 0;
final int Game = 1;
final int GameOverPage = 2;
float x, y;
float r, r1 = 0, r2 = 120, r3 = 240;
float distFromCenter1, distFromCenter2;
boolean rotateTrue = true;

void setup() {
  size(1000, 800);
  location = new PVector(100, 100);
  velocity = new PVector(1.5, 2.1);
  gravity = new PVector(0, 0.2);

  colorMode(HSB, 360);
  gameFont = createFont("Trebuchet MS", 32);
}

void draw() {
  if (mode == StartPage) {
    StartPage();
  } else if (mode == Game) {
    Game();
  } else if (mode == GameOverPage) {
    GameOverPage();
  }
}

void mouseReleased() {
  if (mode == StartPage) {
    startPageMouseReleased();
  } else if (mode == GameOverPage) {
    gameOverPageMouseReleased();
  } else if (mode == Game) {
    gameMouseReleased();
  }
}

void mouseFollow() {
  if (mode == Game) {
    gameMouseFollow();
  }
}
