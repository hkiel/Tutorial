size(400, 300);
background(0);
fill(0, 0, 255);
noStroke();

/* Zeichne Raumschiff als Dreieck an Position (posX, posY)
 */
int posX = 50;
int posY = 125;
int breite = 50;
int hoehe = 50;
triangle(posX, posY-hoehe/2, posX, posY+hoehe/2, posX+breite, posY);

// zeichne Asteroid
fill(140, 90, 35);
ellipse(250, 100, 50, 50);
