class Follower{
   
  PVector velocity;
  PVector location;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float r;
  
  Follower(){
    maxSpeed = 4;
    maxForce = 0.1;
    r = 5;
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(0,4),random(0,4));
    acceleration = new PVector(0,0);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void seek(PVector target){
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void display(){
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
   
}