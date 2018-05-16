class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean completed = false;
  boolean crashed = false;
  DNA dna;
  float fitness;

  Rocket() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);    
    dna = new DNA();
    fitness = 0;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void calcFitness() {
    float d = dist(location.x, location.y, target.x, target.y);
    fitness = 1/d;

    if (completed) {
      fitness *= 10;
    }
  }

  void update() {
    float d = dist(location.x, location.y, target.x, target.y);
    if (d<10) {
      completed = true;
      //location = target.copy();
    }

    applyForce(dna.genes[count]);
    if (!completed && !crashed) {
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0);
    }

    if (location.x>rx-(rw/2) && location.x<rx+(rw/2) && location.y>ry-(rh/2) && location.y<ry+(rh/2)) {
      crashed = true;
      fitness *= 0.1;
    }

    if (location.x>=width-10 && location.x<=10 && location.y<=5 && location.y>=height+50) {
      crashed = true;
      fitness *= 0.1;
    }
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
  }
}