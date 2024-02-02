class Player {

  int xpos;
  int ypos;
  int old;
  int lives;
  color white = color(255);

  Player(int screen_x) {
    xpos=screen_x;
    ypos=RESY/2;
    lives = 3;
  }

  void move(int y) {
    old = ypos;
    if (y>RESY-HEIGHT) ypos = RESY-HEIGHT;
    else ypos=y;
  }

  void draw() {
    fill(white);
    rect(xpos, ypos, WIDTH, HEIGHT);
    textFont(font, 50);
    text(lives, RESX/4, 75);
    if (lives == 0) {
      textFont(font, 50);
      textAlign(CENTER);
      text("Game Over", RESX/2, 150);
    }
  }

  void playerLife() {
    lives -= 1;
    if (lives == 0) {
      bgcolor = (#FF0000);
    }
  }
}
