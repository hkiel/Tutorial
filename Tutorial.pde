Game game;
int highScore = 0;

void setup() {
  size(400, 300);
}

void draw() {
  if (game != null) {
    game.setShipPosition(mouseY);
    game.step();
    game.draw();
    if (game.isGameOver()) {
      highScore = max(highScore, game.getScore());
      game = null;
    }
  } else {
    // zeichne Menü
    background(0, 0, 127);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("Click to start...", width/2, height/3);
    textSize(20);
    text("High Scrore: "+highScore, width/2, height*2/3);
  }
}

void mousePressed() {
  if (game == null) {
    game = new Game(5);
  } else {
    game.shoot();
  }
}
