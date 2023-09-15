class Asteroid {
  float r;
  float x;
  float y;
  float vx;
  float vy;

  Asteroid(float x, float y, float r, float vx) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = vx;
    vy = 0;
  }

  void move() {
    x += vx;
    y += vy;
  }

  void draw() {
    fill(140, 90, 35);
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
  }
}
