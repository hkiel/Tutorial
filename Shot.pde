class Shot extends Ufo {

  Shot(float x, float y, float vx) {
    super(x, y, 5, vx, 0);
  }

  void draw() {
    fill(255);
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
  }
}
