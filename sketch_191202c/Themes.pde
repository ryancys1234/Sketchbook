void game() {
  textSize(25);
  fill(0);
  text("Score: " + rightScore, width*0.80, height*0.10);
  text("Score: " + leftScore, width*0.10, height*0.10);

  if (leftScore == 3 && rightPlayerWins == false) {
    mode = 1;
    leftPlayerWins = true;
  }

  if (rightScore == 3 && leftPlayerWins == false) {
    mode = 2;
    rightPlayerWins = true;
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
}

void rightWins() {
  background(255);
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
}
