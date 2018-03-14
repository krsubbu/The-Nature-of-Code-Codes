Bob bob;

void setup(){
  size(640,360);
  bob = new Bob(100);
}

void draw(){
  background(255);
  bob.display();
  bob.move();  
}