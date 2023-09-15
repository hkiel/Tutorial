final int N_ASTEROIDEN = 5;

Ship ship;
Ufo[] ufos = new Ufo[N_ASTEROIDEN];
int punkte = 0;

void setup() {
  size(400, 300);
  ship = new Ship(50, 125, 25);
  ship.leben = 0;
}

void draw() {
  if (ship.leben > 0) {
    // Raumschiffposition von aktueller Mausposition übernehmen
    ship.y = mouseY;

    for (int i=0; i<ufos.length; i++) {
      ufos[i].move();
      // Wenn Asteroid über den linken Rand geht...
      if (ufos[i].x < -ufos[i].r) {
        ufos[i] = initUfo();
      }
    }
    for (int i=0; i<ufos.length; i++) {
      if (ship.collides(ufos[i])) {
        if (ufos[i] instanceof Asteroid) {
          ship.leben--;
        } else if (ufos[i] instanceof Bonus) {
          punkte += ((Bonus)ufos[i]).points;
        }
        // Ufo wieder am Ende starten
        ufos[i] = initUfo();
      }
    }

    // Zeichne Spiel
    background(0);
    ship.draw();
    for (Ufo ufo : ufos) {
      ufo.draw();
    }
    fill(255);
    textSize(20);
    textAlign(LEFT, TOP);
    text(punkte, 10, 10);
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

/* neuen Asteroid oder Bonus an rechten Rand setzen, y-Position zufällig
 */
Ufo initUfo() {
  float r = ((int)random(1, 5))*10;
  float x = width;
  float y = random(height);
  float vx = -random(0.5, 2);
  if (random(1) < 0.1) {
    return new Bonus(x, y, (int)r, vx);
  } else {
    return new Asteroid(x+r, y, r, vx);
  }
}

void startGame() {
  ship.leben = 5;
  punkte = 0;
  for (int i=0; i<ufos.length; i++) {
    ufos[i] = initUfo();
  }
}
