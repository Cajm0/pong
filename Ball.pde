class Ball {
  float x;
  float y;
  float dx;
  float dy;
  int radius;
  float ballSpeed = 1.25;
  float currentBallSpeed;
  color ballColor = color(255, 255, 255);
  boolean quit;

  Ball(Computer tComputer) {
    x = RESX/2;
    y = random(RESY/4, 3*RESY/4);
    radius=20;
    tComputer.reset(y);
  }

  void move() {
    x = x+dx;
    y = y+dy;
  }

  void draw(Computer tComputer, Player tPlayer) {
    fill(ballColor);
    circle(int(x), int(y), radius);
    if (tComputer.lives != 0 && tPlayer.lives != 0) {
      textFont(font, 20);
      text(("Ball Speed: " + abs(dx)), RESX/4, RESY-75);
    }
  }

  void collide(Player tPlayer) {
    if (y+radius >= tPlayer.ypos && y-radius<tPlayer.ypos+HEIGHT &&
      x >=tPlayer.xpos && x <= tPlayer.xpos+WIDTH) {
      x+=10;
      if (dx<0) dx=-dx;
      dy+=(tPlayer.ypos-tPlayer.old);
    }
  }

  void collideComp(Computer tComputer) {
    if (y+radius >= tComputer.ypos && y-radius<tComputer.ypos+HEIGHT &&
      x >=tComputer.xpos && x <= tComputer.xpos+WIDTH) {
      if (dx>0) dx=-dx;
      x-=10;
      dy+=(tComputer.ypos-tComputer.old);
    }
  }

  void collideWalls() {
    if (y-radius <=0) dy=-dy;
    else if (y+radius>=RESY) dy=-dy;
  }

  void pointScored(Computer tComputer, Player tPlayer) {
    if (x<0) {
      x = RESX/2;
      y = RESY/2;
      dx = 0;
      dy = 0;
      tComputer.reset(y);
      tPlayer.playerLife();
    } else if (x>RESX) {
      x = RESX/2;
      y = random(RESY/4, 3*RESY/4);
      dx = 0;
      dy = 0;
      tComputer.reset(y);
      tComputer.compLife();
    }
  }
  void resumeGame(Computer tComputer) {
    currentBallSpeed = ballSpeed*(4-tComputer.lives);
    dx = random(0, 1)>0.5?currentBallSpeed:-currentBallSpeed;
    dy = random(0, 1)>0.5?currentBallSpeed:-currentBallSpeed;
  }
}
