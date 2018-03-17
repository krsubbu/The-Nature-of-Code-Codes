Bob bob;
Bob bob2;
Bob bob3;
Spring spring;
Spring spring2;
float restLength;
float currentLength;

void setup() {
  size(640, 360);
  bob = new Bob(width/2, 200);
  bob2 = new Bob(width/4, 400);
  spring = new Spring(width/2, 0, 100, 0.01);
  spring2 = new Spring(width/4, 0, 100, 0.1);
}

void draw() {
  background(255); 

  spring.connect(bob);
  spring.display(bob);

  spring2.connect(bob2);
  spring2.display(bob2);

  if (mousePressed) {
    bob.location.x = mouseX;
    bob.location.y = mouseY;
    PVector wind = new PVector(0.1, 0);
    bob.applyForce(wind);
    bob2.applyForce(wind);
  }

  PVector gravity = new PVector(0, 0.1);
  bob.applyForce(gravity);
  bob2.applyForce(gravity);

  bob.display();
  bob2.display();
  bob.move();
  bob2.move();
}