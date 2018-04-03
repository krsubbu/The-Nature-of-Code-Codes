import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Ball> balls ;
WindMill wm;


void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  balls = new ArrayList<Ball>();
  wm = new WindMill();
}

void draw() {
  background(255);
  box2d.step();
  
  wm.display();
  
  for (Ball b : balls) {
    b.display();
  }
}

void mousePressed(){
   wm.toggleMotor(); 
}

void keyPressed(){
    Ball ball = new Ball();
  balls.add(ball);
}