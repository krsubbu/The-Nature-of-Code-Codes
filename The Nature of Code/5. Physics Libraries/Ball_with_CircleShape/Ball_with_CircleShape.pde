import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;

Box2DProcessing box2d;
ArrayList<Ball> balls = new ArrayList<Ball>();
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
   Ball ball = new Ball();
   balls.add(ball);
 }
 
 for(Ball ball : balls){
   ball.display();
 }
 
 
}