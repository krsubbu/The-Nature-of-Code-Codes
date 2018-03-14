Ball ball;

void setup() {
  size(640, 360);
  ball = new Ball();
}


void draw() {
  background(255, 50);
  ball.display();
  ball.move();
}