/* zuerst alle Variablen auflisten */
final int N_ASTEROIDEN = 5;

int leben = 5;

int posX = 50;  /* x-Position Raumschiff */
int posY = 125; /* y-Position Raumschiff */
int r = 50;  /* "Radius" Raumschiff */

/* Asteroiden */
float[] astX = new float[N_ASTEROIDEN];
float[] astY = new float[N_ASTEROIDEN];
float[] astR = new float[N_ASTEROIDEN];
float[] astSpeedX = new float[N_ASTEROIDEN];

void setup() {
  size(400, 300);
  for (int i=0; i<N_ASTEROIDEN; i++) {
    initAsteroid(i);
  }
}

void draw() {
  background(0);

  // Raumschiffposition von aktueller Mausposition übernehmen
  posY = mouseY;

  // Asteroiden bewegen sich nach links
  for (int i=0; i<N_ASTEROIDEN; i++) {
    astX[i] += astSpeedX[i];
    // Wenn Asteroid über den linken Rand geht...
    if (astX[i] < -astR[i]) {
      initAsteroid(i);
    }

    if (kollision(posX, posY, r, astX[i], astY[i], astR[i])) {
      leben--;
    }
  }

  drawShip(posX, posY, r);

  // zeichne Asteroiden
  for (int i=0; i<N_ASTEROIDEN; i++) {
    drawAsteroid(astX[i], astY[i], astR[i]);
  }
}

/* Asteroid wieder an rechten Rand setzen, y-Position zufällig
 */
void initAsteroid(int i) {
  astR[i] = (int)random(10, 50);
  astX[i] = width+astR[i];
  astY[i] = random(height);
  astSpeedX[i] = -random(0.5, 2);
}

boolean kollision(float x1, float y1, float r1, float x2, float y2, float r2) {
  return (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1) <= (r1+r2)*(r1+r2);
}

void drawShip(float x, float y, float r) {
  fill(0, 0, 255);
  noStroke();
  triangle(x, y-r, x, y+r, x+r, y);
  // Kollisionsperimeter für Debugging-Zwecke
  noFill();
  stroke(127);
  ellipseMode(RADIUS);
  ellipse(x, y, r, r);
}

void drawAsteroid(float x, float y, float r) {
  fill(140, 90, 35);
  ellipseMode(RADIUS);
  ellipse(x, y, r, r);
}
