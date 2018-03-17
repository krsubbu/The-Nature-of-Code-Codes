Bob bob;
float restLength;
float currentLength;

void setup(){
  size(640,360);
  bob = new Bob();
}

void draw(){
  background(255); 
  
  
  PVector spring = bob.springForce();
  bob.applyForce(spring);
  
  PVector gravity = new PVector(0,0.01);
  bob.applyForce(gravity);
  
  bob.display();
  bob.move();
}