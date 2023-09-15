class Game {

  Ship ship;
  Ufo[] ufos;
  ArrayList<Shot> shots = new ArrayList();
  int punkte = 0;

  Game(int n) {
    ufos = new Ufo[n];
    for (int i=0; i<ufos.length; i++) {
      ufos[i] = initUfo();
    }

    ship = new Ship(50, 125, 25);
    ship.leben = 5;
  }

  void setShipPosition(float y) {
    ship.y = y;
  }

  void step() {
    for (int i=0; i<ufos.length; i++) {
      ufos[i].move();
      // Wenn Asteroid über den linken Rand geht...
      if (ufos[i].x < -ufos[i].r) {
        ufos[i] = initUfo();
      }
    }
    // Liste rückwärts durchlaufen, da ggf. Elemente gelöscht werden
    for (int i=shots.size()-1; i>=0; i--) {
      Shot shot = shots.get(i);
      shot.move();
      // rausfliegende Shots entfernen!
      if (shot.x > width+shot.r) {
        shots.remove(i);
        break;
      }
      for (int j=0; j<ufos.length; j++) {
        if (shot.collides(ufos[j])) {
          shots.remove(i);
          ufos[j] = initUfo();
          break;
        }
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
  }

  void draw() {
    // Zeichne Spiel
    background(0);
    ship.draw();
    for (Ufo ufo : ufos) {
      ufo.draw();
    }
    for (Shot shot : shots) {
      shot.draw();
    }
    fill(255);
    textSize(20);
    textAlign(LEFT, TOP);
    text(punkte, 10, 10);
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

  void shoot() {
    shots.add(new Shot(ship.x+ship.r, ship.y, 3));
  }

  boolean isGameOver() {
    return ship.leben <= 0;
  }
  
  int getScore() {
    return punkte;
  }
}
