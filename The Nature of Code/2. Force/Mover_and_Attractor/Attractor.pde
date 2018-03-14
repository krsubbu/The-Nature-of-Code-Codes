class Attractor {

  PVector location;

  Attractor() {
    location = new PVector(width/2, height/2);
  }
//Attractor dispaly function at the center of processing window
  void display() {
    fill(200);
    stroke(0);
    strokeWeight(1);
    ellipse(location.x, location.y, 50, 50);
  }
// Creating attract force by the attractor in attract function
  PVector attract(Mover mover) {
    //creating vector pointing from attractor to mover by subtracting
    PVector gravity = PVector.sub(attractor.location, mover.location);
    //calculating the distance between the two using magnitude function.
    float distance = constrain(gravity.mag(), 5, 25);
    //Universal Gravitaional Constant
    float G = 100;
    //getting the direction
    gravity.normalize();
    //making the force of gravity
    gravity.mult(G/(distance*distance));
    return gravity;
  }
}