Mover mover;
Liquid liquid;

void setup(){
  size(640,360);
  mover = new Mover();
  liquid = new Liquid(0,height/2,width,height,0.5);
}

void draw(){
  background(255);
  liquid.display();
  
  PVector gravity = new PVector(0,0.1);
  gravity.mult(mover.mass);
  mover.applyForce(gravity);
  
  if(liquid.contains(mover)){
    PVector drag = liquid.drag(mover);
    mover.applyForce(drag);
  }
  
  mover.display();
  mover.edges();
  mover.move();
  
}