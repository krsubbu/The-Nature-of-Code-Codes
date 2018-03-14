Attractor attractor;
Mover mover;

void setup(){
  size(640,360);
  attractor = new Attractor();
  mover = new Mover();
}

void draw(){
  background(255);
  // display attractor at the center like a sun
  attractor.display();
  //display mover
  mover.display(); 
  //creating force of attraction by the attractor
  PVector gravity = attractor.attract(mover);
  //applying force of attraction to the mover
  mover.applyForce(gravity);
  //updating the move function of mover object
  mover.move();
  
}