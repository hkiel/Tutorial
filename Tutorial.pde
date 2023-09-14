/* zuerst alle Variablen auflisten */

int posX = 50;   /* x-Position Raumschiff */
int posY = 125;  /* y-Position Raumschiff */
int breite = 50; /* Breite Raumschiff */
int hoehe = 50;  /* Hoehe Raumschiff */

int astX = 250; /* x-Position Asteroid */
int astY = 100; /* y-Position Asteroid */
int astR = 25;  /* Radius Asteroid */

void setup() {
  size(400, 300);
}

void draw() {
  background(0);

  // Raumschiffposition von aktueller Mausposition übernehmen
  posY = mouseY;

  // Asteroiden bewegen sich nach links
  astX--;
  // Wenn Asteroiden über den linken Rand gehen...
  if (astX < 0) {
    // Asteroid wieder an rechten Rand setzen, zufälliger Radius
    astX = width;
    astR = (int)random(10, 50);
  }

  drawShip(posX, posY, breite, hoehe);

  for (int i=0; i<3; i++) {
    drawAsteroid(astX, astY+3*i*astR, astR);
  }
}

void drawShip(int x, int y, int breite, int hoehe) {
  fill(0, 0, 255);
  noStroke();
  triangle(x, y-hoehe/2, x, y+hoehe/2, x+breite, y);
}

void drawAsteroid(int x, int y, int r) {
  fill(140, 90, 35);
  ellipseMode(RADIUS);
  ellipse(x, y, r, r);
}
