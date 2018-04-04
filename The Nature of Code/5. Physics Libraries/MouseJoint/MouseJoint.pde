import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;

Box2DProcessing box2d;
Spring spring;
Box box;
Boundary boundary;

void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box = new Box();
  spring = new Spring();
  boundary = new Boundary(width/2,height/2,100,20);
  
}

void mouseReleased(){
  spring.destroy();
}

void mousePressed(){
  if(box.contains(mouseX,mouseY)){
    spring.bind(mouseX,mouseY,box);
  }
}

void draw(){
  background(255);
  box2d.step();
  
  spring.update(mouseX,mouseY);
  
  boundary.display();
  box.display();
  //spring.display();
  
  
}