final int N_ASTEROIDEN = 5;

Ship ship;
Asteroid[] asteroids = new Asteroid[N_ASTEROIDEN];

void setup() {
  size(400, 300);
  ship = new Ship(50, 125, 25);
  ship.leben = 0;
}

void draw() {
  if (ship.leben > 0) {
    // Raumschiffposition von aktueller Mausposition übernehmen
    ship.y = mouseY;

    // Asteroiden bewegen sich nach links
    for (int i=0; i<N_ASTEROIDEN; i++) {
      asteroids[i].move();
      // Wenn Asteroid über den linken Rand geht...
      if (asteroids[i].x < -asteroids[i].r) {
        asteroids[i] = initAsteroid();
      }

      if (ship.collision(asteroids[i])) {
        ship.leben--;
        // Asteroid wieder ans Ende setzen
        asteroids[i] = initAsteroid();
      }
    }

    // Zeichne Spiel
    background(0);
    ship.draw();
    for (Asteroid ast : asteroids) {
      ast.draw();
    }
  } else {
    // zeichne Menü
    background(0, 0, 127);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("Click to start...", width/2, height/2);
  }
}

void mousePressed() {
  if (ship.leben == 0) {
    startGame();
  } else {
    // Feuern
  }
}

/* neuen Asteroid an rechten Rand setzen, y-Position zufällig
 */
Asteroid initAsteroid() {
  float r = ((int)random(1, 5))*10;
  float x = width+r;
  float y = random(height);
  float vx = -random(0.5, 2);
  return new Asteroid(x, y, r, vx);
}

void startGame() {
  ship.leben = 5;
  for (int i=0; i<N_ASTEROIDEN; i++) {
    asteroids[i] = initAsteroid();
  }
}
