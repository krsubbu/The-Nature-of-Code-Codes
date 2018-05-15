class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  DNA dna;

  Rocket() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);    
    dna = new DNA();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    applyForce(dna.genes[count]);

    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    rectMode(CENTER);
    fill(255, 200);
    noStroke();
    rect(0, 0, 25, 5);
    popMatrix();

    text(count, 10, height-20);
  }
}