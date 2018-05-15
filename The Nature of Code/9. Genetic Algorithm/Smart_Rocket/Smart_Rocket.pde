Population population;
int lifespan = 200;
int count = 0;
PVector target;

void setup() {
  size(640, 360);
  population = new Population();
  target = new PVector(width/2,50);
}

void draw() {
  background(0);

  population.run();
  count++;

  if (count == lifespan) {
    count = 0;
    population = new Population();
  }
  fill(255);
  noStroke();
  ellipse(target.x,target.y,16,16);
}