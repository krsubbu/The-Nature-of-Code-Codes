class Particle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(){
    location = new PVector(width/2,50);
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(0,0);
    lifespan = 255;
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void move(){
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   
   lifespan -= 3;
  }
  
  boolean isDead(){
   if(lifespan<=0)
     return true;
   return false;
  }
  
  void display(){
    fill(50,lifespan);
    stroke(0,lifespan);
    strokeWeight(1);
    ellipse(location.x,location.y,10,10);
  }
  
}