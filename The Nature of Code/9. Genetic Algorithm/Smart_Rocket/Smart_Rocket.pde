Population population;
int lifespan = 500;
int count = 0;
PVector target;
int generation = 1;
float rx ;
float ry ;
float rw ;
float rh ;

void setup() {
  size(640, 360);
  rx = width/2;
  ry = height/2+100;
  rw = 200;
  rh = 20;
  population = new Population();
  target = new PVector(width/2, 50);
}

void draw() {
  background(0);

  population.run();

  count++;

  if (count == lifespan) {
    population.evaluate();
    population.selection();
    count = 0;
    generation++;
  }

  fill(255);
  noStroke();
  rect(rx, ry, rw, rh);

  fill(255);
  noStroke();
  ellipse(target.x, target.y, 16, 16);

  textSize(16);
  text(generation, 10, height-40);

  text(count, 10, height-20);
}