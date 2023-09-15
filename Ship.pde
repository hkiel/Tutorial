class Ship extends Ufo {

  int leben = 5;

  Ship(float x, float y, float r) {
    super(x, y, r, 0, 0);
  }

  void draw() {
    fill(0, 0, 255);
    noStroke();
    triangle(x-r/2, y-r, x-r/2, y+r, x+r, y);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(r/2);
    text(leben, x, y);
  }
}
