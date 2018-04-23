class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxForce;
  float r;

  Vehicle() {
    r = 5;
    maxspeed = 3;
    maxForce = 0.3;
    location = new PVector(0, 0);
    velocity = new PVector(4, 0);
    acceleration = new PVector(0, 0);
  }

  void follow(Path path) {
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(25);

    PVector predictpos = PVector.add(location, predict);
    


    PVector normal = getNormalPoint(path.a, path.b, predictpos);
    fill(0);
    ellipse(normal.x, normal.y, 5, 5);

    PVector dir = PVector.sub(path.b, path.a);
    dir.normalize();
    dir.mult(25);

    PVector target = PVector.add(dir, normal);
    fill(0);
    ellipse(target.x, target.y, 10, 10);

    float distance = PVector.dist(normal, predictpos);
    if (distance > path.radius) {
      seek(target);
    }    
    
    fill(0);
    stroke(0);
    line(location.x, location.y, predictpos.x, predictpos.y);
    ellipse(predictpos.x, predictpos.y, 4, 4);

    fill(0);
    stroke(0);
    line(predictpos.x, predictpos.y, normal.x, normal.y);
    ellipse(normal.x, normal.y, 4, 4);
    stroke(0);
  }

  PVector getNormalPoint(PVector a, PVector b, PVector pos) {
    PVector ab = PVector.sub(b, a);
    PVector ap = PVector.sub(pos, a);

    ab.normalize();
    ab.mult(ab.dot(ap));

    PVector normal = PVector.add(a, ab);
    return normal;
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);

    PVector steer = PVector.sub(desired, velocity);
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

  void boundary() {
    if (location.x>width)
      location.x = 0;
    if (location.y>height)
      location.y = 0;
  }
}