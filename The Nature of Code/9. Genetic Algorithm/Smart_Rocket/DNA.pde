class DNA {
  PVector[] genes;  

  DNA() {
    genes = new PVector[lifespan];

    for (int i=0; i<lifespan; i++) {
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
    }
  }

  DNA crossover(DNA parentB) {
    DNA child = new DNA();
    int midpoint = int(random(genes.length));
    for (int i =0; i<genes.length; i++) {
      if (i>midpoint)
        child.genes[i] = parentB.genes[i];
      else
        child.genes[i] = genes[i];
    }
    return child;
  }

  void mutate(float mutationRate) {
    for (int i =0; i<genes.length; i++) {
      if (random(1)< mutationRate) {
        genes[i] = PVector.random2D();
        genes[i].setMag(0.1);
      }
    }
  }
}