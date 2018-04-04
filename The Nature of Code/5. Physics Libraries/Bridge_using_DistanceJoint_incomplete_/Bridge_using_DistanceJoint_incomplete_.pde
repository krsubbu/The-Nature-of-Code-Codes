import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Box> boxes = new ArrayList<Box>();
Link[] link = new Link[6];

void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  link[0] = new Link(0,height/2,true);
  link[5] = new Link(width,height/2,true);
}

void draw() {
  background(255);
  box2d.step();
  
  joint();
  
  if (mousePressed) {
    Box box = new Box();
    boxes.add(box);
  }

  for (Box b : boxes) {
    b.display();
  }
  
  for(Link l: link){
    l.display();
  }
}

void joint() {
  float x =15;
  float len = 15;
  for (int i=1; i<5; i++) {
    link[i] = new Link(x,height/2,false);
    x += 15;
    
    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = link[i-1].body;
    djd.bodyB = link[i].body;

    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 2;
    djd.dampingRatio = 0.1;

    DistanceJoint dj = (DistanceJoint)box2d.createJoint(djd);
  }
  
}