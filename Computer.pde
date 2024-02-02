class Computer {

  int xpos;
  float ypos;
  float old;
  float computerSpeed = 1.0;
  color white = color(255);
  int lives;

  Computer(int screen_x) {
    xpos=screen_x;
    ypos=RESY/2;
    lives = 3;
  }

  void move(Ball tBall) {
    old = ypos;
    if (tBall.dx != 0) {
      if (ypos+0.5*HEIGHT-computerSpeed>tBall.y) ypos -= computerSpeed;
      else if (ypos+0.5*HEIGHT>tBall.y) ypos = tBall.y-0.5*HEIGHT;
      else if (ypos+0.5*HEIGHT+computerSpeed<tBall.y) ypos += computerSpeed;
      else if (ypos+0.5*HEIGHT<tBall.y) ypos = tBall.y-0.5*HEIGHT;
    }
  }

  void reset(float yBall) {
    ypos = yBall-0.5*HEIGHT;
  }

  void draw() {
    fill(white);
    rect(xpos, ypos, WIDTH, HEIGHT);
    textFont(font, 50);
    text(lives, 3*RESX/4, 75);
    if (lives == 0) {
      textFont(font, 50);
      textAlign(CENTER);
      text("Congratulations", RESX/2, 150);
    } else {
      computerSpeed = (4-lives)*(1+0.1*(3-lives));
      textFont(font, 20);
      text(("Computer Speed: " + round(computerSpeed)), 3*RESX/4, RESY-75);
    }
  }

  void compLife() {
    lives -= 1;
    if (lives == 0) {
      bgcolor = (#00FF00);
    }
  }
}
