class Bonus extends Ufo {

  int points;
  
  Bonus(float x, float y, int points, float vx) {
    super(x, y, 10, vx, 0);
    this.points = points;
  }

  void draw() {
    fill(140, 140, 0);
    rectMode(RADIUS);
    rect(x, y, r, r);
    fill(255);
    textSize(r);
    text(points, x, y);
  }
}
