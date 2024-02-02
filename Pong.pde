final int RESX = 1600;
final int RESY = 900;
final int WIDTH = 16;
final int HEIGHT = 72;
final int OFFSET = 50;
PFont font;
color white = color(255);
color bgcolor = color(0, 0, 0);
Player thePlayer;
Computer theComputer;
Ball theBall;

void settings() {
  size(RESX, RESY);
}

void setup() {
  frameRate(60);
  noStroke();
  background(0);
  thePlayer = new Player(OFFSET);
  theComputer = new Computer(RESX-WIDTH-OFFSET);
  theBall = new Ball(theComputer);
  font = createFont("Century Gothic Bold", 18, true);
}

void draw() {
  background(bgcolor);
  fill(white);
  rect(RESX*0.5, 0, 2, RESY);
  thePlayer.move(mouseY);
  if (theBall.dx > 0 || theBall.dx == 0 && theBall.dy == 0) theComputer.move(theBall);
  theBall.move();
  theBall.collide(thePlayer);
  theBall.collideComp(theComputer);
  theBall.collideWalls();
  thePlayer.draw();
  theComputer.draw();
  theBall.draw(theComputer, thePlayer);
  theBall.pointScored(theComputer, thePlayer);
}

void mousePressed() {
  if (theBall.dx == 0 && theComputer.ypos != theBall.y+HEIGHT || theBall.dx == 0 && theComputer.ypos != theBall.y-HEIGHT) {
    theBall.resumeGame(theComputer);
  } else {
    theComputer.reset(theBall.y);
    delay(10);
    theBall.resumeGame(theComputer);
  }
}
