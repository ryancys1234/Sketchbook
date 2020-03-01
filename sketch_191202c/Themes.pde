void game() {
  textSize(15);
  image(sbv, 350, 0, 300, 160);
  fill(255);
  textAlign(CENTER);
  text("Left", width/2 - 105, height*0.025);
  text("Right", width/2 + 100, height*0.025);
  
  text(leftFoul, width/2 - 105, height*0.175);
  text(rightFoul, width/2 + 100, height*0.175);
  
  textSize(30);
  text(timeMinutes + ":" + timeSeconds, width/2, height*0.045);
  
  if (timeSeconds == 60) {
    timeMinutes++;
    timeSeconds = 0;
  }
  
  textSize(25);
  fill(#ED0202);
  text(rightScore, width/2 + 100, height*0.075);
  text(leftScore, width/2 - 105, height*0.075);

  if (leftScore == 3 && rightPlayerWins == false) {
    mode = 1;
    leftPlayerWins = true;
  }

  if (rightScore == 3 && leftPlayerWins == false) {
    mode = 2;
    rightPlayerWins = true;
  }
  
  image(lbh, width/12, height/2 - 100);
  image(rbh, width*11/12 - 100, height/2 - 100);
  
  rect(width/2, height/2, 50, 50);
  noStroke();
}

void gameMouseReleased() {
  if (dist(mouseX, mouseY, width/2 + 25, height/2 + 25) <= 25) {
    instructions();
  }
}

void leftWins() {
  background(255);
  fill(93, 67, 214);
  textSize(100);
  text("Left Player Wins", width/2, height/2);
  textAlign(CENTER);
  textSize(30);
  text("Click to Play Again", width/2, height*0.75);
  textAlign(CENTER);
}

void leftMouseReleased() {
  leftScore = 0;
  rightScore = 0;
  mode = 0;
  setup();
  leftPlayerWins = false;
  rightPlayerWins = false;
}

void rightWins() {
  background(255);
  fill(255, 18, 34);
  textSize(100);
  text("Right Player Wins", width/2, height/2);
  textAlign(CENTER);
  textSize(30);
  text("Click to Play Again", width/2, height*0.75);
  textAlign(CENTER);
}

void rightMouseReleased() {
  leftScore = 0;
  rightScore = 0;
  mode = 0;
  setup();
  leftPlayerWins = false;
  rightPlayerWins = false;
}

void instructions() {
  fill(#6A67D8);
  rect(100, 100, height - 200, width - 200);
  noStroke();
  
  fill(255);
  text("Tutorial", width/2, height/2);
  
  text("Left player:", width/4, height/4);
  text("W = up", width/4, height/4 + 25);
  text("S = down", width/4, height/4 + 50);
  text("A = left", width/4, height/4 + 75);
  text("D = right", width/4, height/4 + 100);
  text("E = dribble", width/4, height/4 + 125);
  text("Q = shoot", width/4, height/4 + 150);
  
  text("Right player:", width*3/4, height/4);
  text("↑ = up", width*3/4, height/4 + 25);
  text("↓ = down", width*3/4, height/4 + 50);
  text("← = left", width*3/4, height/4 + 75);
  text("→ = right", width*3/4, height/4 + 100);
  text("P = dribble", width*3/4, height/4 + 125);
  text("I = shoot", width*3/4, height/4 + 150);
}
