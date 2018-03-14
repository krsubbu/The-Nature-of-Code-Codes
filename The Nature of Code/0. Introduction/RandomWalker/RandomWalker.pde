Walker walker;

void setup(){
  size(300,300);
  background(255);
  walker = new Walker();
  
}

void draw(){
  walker.display();
  walker.move();
  
}