class Population {

  DNA[] population;
  ArrayList<DNA> matingPool;
  String target = "to be or not to be";
  float mutationRate;
  int generation = 0;
  int totalPopulation = 200;
  
  Population() {
    mutationRate = 0.001;
//Creating pool of various DNA elements.
    population = new DNA[totalPopulation];
    //Initializing all population.
    for (int i=0; i<population.length; i++) {
      population[i] = new DNA();
    }
//Creating matingpool for picking parents.
    matingPool = new ArrayList<DNA>();
    calcFitness();
  }
//Creating mating pool
  void createPool() {
    matingPool.clear();

    float maxFitness = 0;
    for (int j=0; j<population.length; j++) {
      if (population[j].fitness > maxFitness) {
        maxFitness = population[j].fitness;
      }
    }

    for (int j=0; j<population.length; j++) {
      float fitness = map(population[j].fitness, 0, maxFitness, 0, 1);
      int n = (int)(fitness*100);
      for (int k=0; k<n; k++) {
        matingPool.add(population[j]);
      }
    }
  }
//Calculating fitness of each and every population
  void calcFitness() {
    for (int j=0; j<population.length; j++) {
      population[j].fitness(target);
    }
  }
//Creating child from parentA and parentB.
  void generate() {
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));

      DNA parentA = matingPool.get(a);
      DNA parentB = matingPool.get(b);

      DNA child = parentA.crossover(parentB);
      child.mutate(mutationRate);
      population[i] = child;
    }
    generation++;
  }
  
  float bestPhrase(){
    float best = 0;
    for(int i=0;i<population.length;i++){
      float fit = population[i].fitness;
      if(best<fit){
        best = fit;
      }
    }
    return best;
  }
  
  boolean display(){
    float index = bestPhrase();
    
    String d = "Best Phrase: ";
    textSize(32);
    text(d,50,50);
    textSize(16);
    
    DNA b = population[(int)index];
    float num = population[(int)index].fitness;
    float n = (num/18)*100;
    String s = "";
    for(int i=0;i<b.genes.length;i++){
        s += b.genes[i];
    }
    text(s,50,70);
    
    String a = "All Phrase: ";
    textSize(10);
    text(a,width-100,20);
    
    String g = "Generation: ";
    textSize(15);
    text(g,10,height/2);
    text(generation,100,height/2);
    
    String f = "Fitness: ";
    textSize(15);
    text(f,10,height/2+20);
    text(n,80,height/2+20);
    
    String p = "Population: ";
    textSize(15);
    text(p,10,height/2+40);
    text(totalPopulation,100,height/2+40);
    
    if(n ==100.00){
      return true;
    }
    return false;
  }
}