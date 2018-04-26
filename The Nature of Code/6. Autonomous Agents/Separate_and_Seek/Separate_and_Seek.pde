ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 10; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw() {
  background(255);

  //if (mousePressed) {
  //  Vehicle vehicle = new Vehicle(mouseX,mouseY);
  //  vehicles.add(vehicle);
  //}

  for (Vehicle v : vehicles) {
    v.separate(vehicles);
    v.update();
    v.display();
    v.boundary();
    if (mousePressed) {
      v.seek(new PVector(mouseX, mouseY));
    }
  }
}