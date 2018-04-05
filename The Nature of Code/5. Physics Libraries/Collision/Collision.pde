import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Ball> balls = new ArrayList<Ball>();
Boundary boundary;

void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boundary = new Boundary(width/2,height-10,width,10);
  box2d.listenForCollisions();
}

void draw(){
  background(255);
  box2d.step();
  
  boundary.display();
  
  if(mousePressed){
    Ball ball = new Ball();
    balls.add(ball);
  }
  
  for(Ball b: balls){
    b.display();
  }
}

void beginContact(Contact cp){
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if(o1.getClass() == Ball.class && o2.getClass()== Ball.class){
    Ball ball1 = (Ball)o1;
    ball1.change();
    Ball ball2 = (Ball)o2;
    ball2.change();
  }
}

void endContact(Contact cp){
  
}