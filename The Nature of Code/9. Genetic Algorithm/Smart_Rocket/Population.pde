class Population {
  Rocket[] rocket;
  int totalPopulation = 100;

  Population() {
    rocket = new Rocket[totalPopulation];  
    for (int i=0; i<totalPopulation; i++) {
      rocket[i] = new Rocket();
    }
  }

  void run() {
    for (Rocket r : rocket) {
      r.update();
      r.display();
    }
  }
}