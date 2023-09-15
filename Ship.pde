class Ship {
  float r;
  float x;
  float y;

  int leben = 5;

  Ship(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  boolean collision(Asteroid ast) {
    return dist(this.x, this.y, ast.x, ast.y) < (this.r + ast.r);
  }

  void draw() {
    fill(0, 0, 255);
    noStroke();
    triangle(x-r/2, y-r, x-r/2, y+r, x+r, y);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(r/2);
    text(leben, x+r/2, y);
  }
}
