class FBomb extends FCircle {
  int timer;

  FBomb() { 
    super(gs); // Superclass (FCircle) constructor
    this.setFillColor(yellow);
    this.setPosition(player.getX(), player.getY() + gs); //Spawns beside the player box.
    //potentially make it to be launched (with initial velocity)
    world.add(this);

    timer = 60;
  }

  void show() {
  }

  void act() {
    timer--;
    if (timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
    }
  }

  void explode() {
    for (int i = 0; i < boxes.size(); i++) {
      FBox blck = boxes.get(i);
      if (dist(this.getX(), this.getY(), blck.getX(), blck.getY()) < 200) {
        float vx = blck.getX() - this.getX();
        float vy = blck.getY() - this.getY();
        blck.setVelocity(5*vx, 5*vy);
        blck.setStatic(false);
      }
    }
  }
}
