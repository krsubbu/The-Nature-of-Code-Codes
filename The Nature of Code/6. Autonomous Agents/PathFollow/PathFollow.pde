Path path;
Vehicle vehicle;

void setup(){
  size(640,360);
  path = new Path();
  vehicle = new Vehicle();
}

void draw(){
  background(255);
  path.display();
  
  vehicle.follow(path);  
  vehicle.update();
  vehicle.display();
  vehicle.boundary();
  
}