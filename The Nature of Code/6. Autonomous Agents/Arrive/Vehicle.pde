class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxForce;
  float r;

  Vehicle() {
    maxspeed = 4;
    maxForce = 0.1;
    r = 4;
    location = new PVector(random(width), random(height));
    velocity = new PVector(4, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);
    float d = desired.mag();

    if (d<100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(maxspeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    applyForce(steer);
  }

  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}