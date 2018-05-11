Population population;
void setup() {
  size(640, 360);
  population = new Population();
}

void draw() {
  background(0);
  
  population.createPool();
  population.generate();
  population.calcFitness();
  
  population.display();
  
  
}