class Spring {

  PVector anchor;
  float restLength;
  float k;

  Spring(float x, float y, float len, float k_) {
    anchor = new PVector(x, y);
    restLength = len;
    k = k_;
  }

  void connect(Bob bob) {
    PVector force = PVector.sub(bob.location, anchor); 
    float currentLength = force.mag();
    float x = restLength - currentLength;
    force.normalize();
    force.mult(k*x);
    bob.applyForce(force);
  }

  void display(Bob bob) {
    stroke(0);
    strokeWeight(2);
    line(anchor.x, anchor.y, bob.location.x, bob.location.y);
  }
}