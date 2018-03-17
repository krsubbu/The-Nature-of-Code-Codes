class Bob{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector origin;
  float theta;
  float amp = 5;
  
  Bob(){
    location = new PVector(width/2,200);
    velocity = new PVector(0,0);    
    origin = new PVector(width/2,0);
    acceleration = new PVector(0,0);
    theta = 0;
  }
  
  PVector springForce(){
    currentLength = location.y;
    float diff = currentLength-restLength;
    acceleration.mult(-1*1*diff);
    return acceleration;
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void display(){
    stroke(0);
    strokeWeight(2);
    line(origin.x,origin.y,location.x,location.y);
    fill(200);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,30,30);
  }
  
  void move(){
    velocity.y = amp*sin(theta);
    velocity.add(acceleration);
    location.add(velocity);
    theta += 0.1;
    velocity.mult(0.99);
    acceleration.mult(0);
  }
  
  
  
}