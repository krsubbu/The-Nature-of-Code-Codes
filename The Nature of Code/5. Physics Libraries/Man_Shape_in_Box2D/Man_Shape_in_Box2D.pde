import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;

Box2DProcessing box2d;
ArrayList<Man> mans = new ArrayList<Man>();
Surface surface;

void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  surface = new Surface();
}

void draw(){
  background(255);
  box2d.step();
  
  surface.display();
  
  if(mousePressed){
    Man man = new Man();
    mans.add(man);
  }
  
  for(Man man: mans){
    man.display();
  }  
}