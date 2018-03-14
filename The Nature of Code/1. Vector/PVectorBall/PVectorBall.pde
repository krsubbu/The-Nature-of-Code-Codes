Ball ball;

void setup() {
  size(640, 360);
  ball = new Ball();
}

void draw() {
  background(255);
  ball.display();
  ball.move();
  ball.edges();
}