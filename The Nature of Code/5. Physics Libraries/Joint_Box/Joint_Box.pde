import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Joint> joints = new ArrayList<Joint>();
Surface surface1;
Joint joint;

void setup(){
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  surface1 = new Surface(200,300);
  joint = new Joint(mouseX,mouseY);
}

void draw(){
  background(255);  
  box2d.step();
  
  surface1.display();
  for(Joint j : joints){
    j.display();
  }
}

void mousePressed(){
  Joint j = new Joint(mouseX,mouseY);
  joints.add(j);
}