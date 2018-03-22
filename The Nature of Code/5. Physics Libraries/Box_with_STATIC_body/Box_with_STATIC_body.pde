import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Box> boxes = new ArrayList<Box>();
Surface surface1;
Surface surface2;

void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  surface1 = new Surface(200,300);
  surface2 = new Surface(400,200);
}

void draw(){
   background(255); 
   
   box2d.step();
   
   surface1.display();
   surface2.display();
   if(mousePressed){
     Box box = new Box();
     boxes.add(box);
   }
   
   for(Box box: boxes){
     box.display();
   }
}