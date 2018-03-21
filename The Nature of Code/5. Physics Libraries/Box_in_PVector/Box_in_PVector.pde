ArrayList<Box>  boxes = new ArrayList<Box>();

void setup(){
  size(640,360);
  background(255);
}

void draw(){
  if(mousePressed){
    Box box = new Box(mouseX,mouseY);
    box.display();
    boxes.add(box);
  }
}