class Population {
  Rocket[] rocket;
  int totalPopulation = 100;
  float mutationRate = 0.01;
  ArrayList<Rocket> matingPool;

  Population() {
    rocket = new Rocket[totalPopulation];  
    for (int i=0; i<totalPopulation; i++) {
      rocket[i] = new Rocket();
    }
    matingPool = new ArrayList<Rocket>();
  }

  void evaluate() {
    for (int i=0; i<totalPopulation; i++) {
      rocket[i].calcFitness();
    }

    matingPool.clear();
    float maxFitness = 0;
    for (int i=0; i<totalPopulation; i++) {
      float f = rocket[i].fitness;
      if (maxFitness<f) {
        maxFitness = f;
      }
    }    

    for (int i=0; i<totalPopulation; i++) {
      float f = map(rocket[i].fitness, 0, maxFitness, 0, 1);
      float n = f*100;
      for (int k=0; k<n; k++) {
        matingPool.add(rocket[i]);
      }
    }
  }

  void selection() {
    Rocket[] r = new Rocket[totalPopulation];

    for (int i = 0; i < totalPopulation; i++) {
      r[i] = new Rocket();

      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));

      DNA parentA = matingPool.get(a).dna;
      DNA parentB = matingPool.get(b).dna;

      DNA child = parentA.crossover(parentB);
      child.mutate(mutationRate);
      r[i].dna = child;
    }
    rocket = r;
  }


  void run() {
    for (Rocket r : rocket) {
      r.update();
      r.display();
    }
  }
}