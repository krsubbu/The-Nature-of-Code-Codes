class Mover{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  Mover(){
    location = new PVector(random(width),height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(1,5);    
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void display(){
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,10*mass,10*mass);
  }
  
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void edges(){
    if(location.x>width){
      location.x = width;
      velocity.x = -1*velocity.x;
    }
    if(location.x <0){
      location.x = 0;
      velocity.x = -1*velocity.x;
    }
    if(location.y>height){
      location.y = height;
      velocity.y = -1*velocity.y;
    }
  }
  
  
}