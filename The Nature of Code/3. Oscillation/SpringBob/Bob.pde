class Bob{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Bob(float x_,float y_){
    location = new PVector(x_,y_);
    velocity = new PVector(0,0);    
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void display(){
    fill(200);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,30,30);
  }
  
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0.99);
    acceleration.mult(0);
  }
  
  
  
}