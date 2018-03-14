Mover[] mover;

void setup() {
  size(640, 360);
  mover = new Mover[5];
  for (int i=0; i<mover.length; i++) {
    mover[i]= new Mover();
  }
}

void draw() {
  background(255);


  for (Mover m : mover) {

    PVector gravity = new PVector(0, 0.4);
    gravity.mult(m.mass);

    if (mousePressed) {
      PVector wind = new PVector(4, 0);
      m.applyForce(wind);
    }
    m.applyForce(gravity);
    m.display();
    m.edges();
    m.move();
  }
}