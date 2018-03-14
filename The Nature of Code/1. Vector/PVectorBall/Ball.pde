class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Ball() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(2, 2);
    acceleration = new PVector(0, 0.1);
  }

  void display() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, 20, 20);
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
  }

  void edges() {
    if (location.x>width || location.x< 0) {
      velocity.x = -1*velocity.x;
    }
    if (location.y>height || location.y<0) {
      velocity.y = -1*velocity.y;
    }
  }
}