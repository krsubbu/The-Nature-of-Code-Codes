class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxForce;
  float r;

  Vehicle(float x, float y) {
    r = 8;
    maxspeed = 3;
    maxForce = 0.1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void seek(PVector target){
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void separate(ArrayList<Vehicle> vehicles) {
    PVector sum = new PVector();
    int count = 0;

    float separateDistance = 100;
    for (Vehicle v : vehicles) {
      float d = PVector.dist(location, v.location);

      if (d>0 && d<separateDistance) {
        PVector diff = PVector.sub(location, v.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }

    if (count>0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);

      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }

  void boundary() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}