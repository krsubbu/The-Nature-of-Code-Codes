class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover() {
    location = new PVector(width/2, 100);
    velocity = new PVector(10, 0);//initial velocity to the mover
    acceleration = new PVector(0, 0);
  }
  //force of attraction applied to mover with this function
  void applyForce(PVector force) {
    //copy the force object 
    PVector f = force.get();
    //adding to acceleration as sum of all forces.
    acceleration.add(f);
  }
  //display the mover function
  void display() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    ellipse(location.x, location.y, 20, 20);
  }
  //updating the mover move function by adding velocity and acceleration
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
}