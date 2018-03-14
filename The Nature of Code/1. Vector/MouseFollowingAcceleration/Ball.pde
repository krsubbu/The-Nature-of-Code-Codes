class Ball {

  PVector location;
  PVector velocity;

  Ball() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(5, 5);
    
  }

  void display() {
    fill(0);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, 20, 20);
  }

  void move() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(2);
    velocity.add(dir);
    velocity.limit(10);
    location.add(velocity);
  }
}