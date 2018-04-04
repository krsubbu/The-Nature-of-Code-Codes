import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Box> boxes = new ArrayList<Box>();
Bridge bridge;

void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  bridge = new Bridge(500,200,height/4);
}

void draw() {
  background(255);
  box2d.step();
  
  if (mousePressed) {
    Box box = new Box();
    boxes.add(box);
  }

  for (Box b : boxes) {
    b.display();
  }
  
  bridge.display();
}