void Game() {
  size(1000, 800);
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(r));
  x = 0;
  y = 0;
  noFill();
  stroke(0, 0, 0);
  strokeWeight(10);
  arc(x, y, 200, 200, 0, HALF_PI+QUARTER_PI);
  popMatrix();
  r = r + 1;
}

void mouseClicked() {
  r = r - 1;
}
void gameMouseReleased() {
}

void gameMouseFollow() {
}
