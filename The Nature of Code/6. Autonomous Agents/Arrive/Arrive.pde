Vehicle vehicle;

void setup(){
  size(640,360);
  vehicle = new Vehicle();
}

void draw(){
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  fill(200);
  stroke(0);
  ellipse(mouse.x,mouse.y,30,30);
  
  vehicle.arrive(mouse);
  vehicle.display();
  vehicle.update();
}