class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxForce;
  float r;

  Vehicle() {
    maxspeed = 10;
    maxForce = 0.1;
    r = 4;

    location = new PVector(0, height/2);
    velocity = new PVector(4, 0);
    acceleration = new PVector(0, 0);
  }

  void seek(FlowField f) {
    int rows = int(constrain(location.y/f.resolution, 0, f.row-1));
    int columns = int(constrain(location.x/f.resolution, 0, f.col-1));

    PVector steer = PVector.sub(f.grid[columns][rows], velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
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