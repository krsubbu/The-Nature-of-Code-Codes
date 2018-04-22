void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  PVector a = new PVector(50, 300);
  PVector b = new PVector(500, 250);
  PVector mouse = new PVector(mouseX, mouseY);
  
  stroke(0);
  strokeWeight(2);
  line(a.x, a.y, b.x, b.y);
  line(a.x, a.y, mouse.x, mouse.y);
  
  fill(0);
  ellipse(a.x, a.y, 10, 10);
  ellipse(b.x, b.y, 10, 10);
  fill(255, 0, 0);
  noStroke();
  ellipse(mouse.x, mouse.y, 10, 10);
  
  PVector normal = projection(a,b,mouse);
  fill(0,255,0);
  ellipse(normal.x,normal.y,10,10);
  noFill();
  stroke(0);
  strokeWeight(1);
  line(mouse.x,mouse.y,normal.x,normal.y);
  
}

PVector projection(PVector a,PVector b,PVector mouse){
  PVector sub = PVector.sub(b,a);
  PVector mouseVec = PVector.sub(mouse,a);
  
  sub.normalize();
  sub.mult(mouseVec.dot(sub));
  
  PVector normal = PVector.add(a,sub);
  return normal;  
}