class Asteroid extends Ufo {

  Asteroid(float x, float y, float r, float vx) {
    super(x, y, r, vx, 0);
  }

  void draw() {
    fill(140, 90, 35);
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
  }
}
