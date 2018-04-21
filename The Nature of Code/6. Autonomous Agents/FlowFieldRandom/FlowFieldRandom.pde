Vehicle vehicle;
FlowField ff;

void setup(){
  size(640,360);
  vehicle = new Vehicle();
  ff = new FlowField();
}

void draw(){
  background(255);
  ff.display();
  vehicle.seek(ff);
  vehicle.display();
  vehicle.update();
  vehicle.borders();
}