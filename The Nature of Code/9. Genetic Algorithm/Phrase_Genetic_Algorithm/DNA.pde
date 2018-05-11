class DNA {
//One gene is an array of charachters 
  char[] genes = new char[18];
  String target = "to be or not to be";
  float fitness;

  DNA() {
    //Creating random phrase of 18 charachters 
    for (int i=0; i<genes.length; i++) {
      genes[i]=(char)random(32, 128);
    }
  }

//Calculating fitness of each phrase with comparison to genes.
  void fitness(String target) {
    int count = 0;
    for (int i=0; i<genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        count++;
      }
    }
    //Calculating the fitness of each genes with the target.
    //fitness is between 0 and 1 always
    fitness = count;
  }

//Crossover is between two parents to create a child taking traits of both parentA and parentB.
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
//mutate function to vary some charachters 
  void mutate(float mutationRate) {
    for (int i =0; i<genes.length; i++) {
      if (random(1)< mutationRate) {
        genes[i] = (char)random(32, 128);
      }
    }
  }

  void display() {
    String s = "";
    for (int i=0; i<genes.length; i++) {
      s = s+genes[i];
    }
    textSize(32);
    text(s, 200, height/2);
    text(fitness, 200, 300);
  }
}