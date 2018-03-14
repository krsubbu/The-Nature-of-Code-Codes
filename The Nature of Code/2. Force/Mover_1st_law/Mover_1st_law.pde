Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0,0.1);
  mover.applyForce(gravity);
  
  mover.move();
  mover.display();
  mover.edges();
}