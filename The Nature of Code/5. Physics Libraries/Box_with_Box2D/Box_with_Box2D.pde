import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Box> boxes = new ArrayList<Box>();


void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void draw(){
  background(255);
  
  box2d.step();
  
  if(mousePressed){
    Box box = new Box();
    boxes.add(box);
  }
    
  for(Box b: boxes){
    b.display();
  }
  
  
}