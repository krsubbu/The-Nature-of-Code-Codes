import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;
ArrayList<Box> boxes = new ArrayList<Box>();
Boundary b1;
Boundary b2;


void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  b1 = new Boundary(width-10, height/2, 10, height);
  b2 = new Boundary(width-200, height-10, 300, 10);
}

void draw() {
  background(255);
  box2d.step();

  b1.display();
  b2.display();
  if (random(1)<0.1) {
    Box box = new Box();
    boxes.add(box);
  }


  for (int i=0; i<boxes.size(); i++) {
    if (mousePressed) {
      Vec2 wind = new Vec2(200, 0);
      boxes.get(i).applyForce(wind);
    }
    boxes.get(i).display();
    if (boxes.get(i).done()) {
      boxes.remove(i);
    }
  }
}