class Mover{
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass = 1;
  
  Mover(){
   location = new PVector(width/2,0);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    acceleration.add(f);
      
  }
  
  void display(){
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,20,20);
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