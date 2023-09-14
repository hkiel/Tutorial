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

  // Asteroid bewegt sich nach links
  astX--;
  // Wenn Asteroid über den linken Rand geht...
  if (astX < 0) {
    // Asteroid wieder an rechten Rand setzen, zufälliger Radius
    astX = width;
    astR = (int)random(10, 50);
  }

  /* Zeichne Raumschiff als Dreieck an Position (posX, posY)
   */
  fill(0, 0, 255);
  noStroke();
  triangle(posX, posY-hoehe/2, posX, posY+hoehe/2, posX+breite, posY);

  // zeichne Asteroid
  fill(140, 90, 35);
  ellipseMode(RADIUS); // Ellipsen mit Mittelpunkt und Radien zeichnen
  ellipse(astX, astY, astR, astR);
}
