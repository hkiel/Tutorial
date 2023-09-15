abstract class Ufo {

  float r;
  float x;
  float y;
  float vx;
  float vy;

  Ufo(float x, float y, float r, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = vx;
    this.vy = vy;
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean collides(Ufo other) {
    return dist(this.x, this.y, other.x, other.y) < (this.r + other.r);
  }

  abstract void draw();
}
