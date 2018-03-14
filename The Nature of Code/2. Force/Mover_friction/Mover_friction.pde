Mover mover;

void setup(){
  size(640,360);
  mover = new Mover();
}

void draw(){
  background(255);
  PVector gravity = new PVector(0,1);
  gravity.mult(mover.mass);
  mover.applyForce(gravity);
  
  PVector friction = mover.velocity.get();
  friction.normalize();
  float C = -0.1;
  friction.mult(C);
  mover.applyForce(friction);
  
  mover.display();
  mover.move();
  mover.edges();
}