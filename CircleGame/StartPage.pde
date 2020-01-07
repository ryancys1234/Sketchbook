void StartPage() {
  distFromCenter1 = 100;
  distFromCenter2 = 0;
  background(255);
  pushMatrix();
  translate(width/2, height/2);

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

  textAlign(CENTER, CENTER);
  textSize(40);
  textFont(gameFont);
  text("The Circle Game", width/2, height/4);

  textAlign(CENTER, CENTER);
  textSize(40);
  textFont(gameFont);
  text("Click anywhere to start", width/2, 3*height/4);

  println("test0");
}

void startPageMouseReleased() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 500) {
    mode = 1;
  }
}
