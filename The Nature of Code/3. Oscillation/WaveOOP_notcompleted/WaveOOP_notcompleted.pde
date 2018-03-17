Wave wave;
Wave wave2;

void setup() {
  size(640, 360);
  wave = new Wave(300,500,height/2,201);
  wave2 = new Wave(50,200,50,200);
}

void draw() {
  background(255);
  wave.display();  
  wave2.display();
}