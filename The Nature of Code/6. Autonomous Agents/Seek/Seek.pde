Follower follower;

void setup() {
  size(640, 360);
  follower = new Follower();
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);

  fill(200, 70);
  stroke(0);
  ellipse(mouseX, mouseY, 30, 30);
  
  follower.seek(mouse);
  follower.update();
  follower.display();
}