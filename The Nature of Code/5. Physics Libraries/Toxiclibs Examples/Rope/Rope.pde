import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D world;
Chain chain;
void setup(){
  size(640,360);
  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior2D(new Vec2D(0,0.5)));
  chain = new Chain(height/2,100);
}

void draw(){
  background(255);
  
  // Update physics
  world.update();
  // Update chain's tail according to mouse position 
  chain.updateTail(mouseX, mouseY);
  // Display chain
  chain.display();
  
}

void mousePressed() {
  // Check to see if we're grabbing the chain
  chain.contains(mouseX, mouseY);
}

void mouseReleased() {
  // Release the chain
  chain.release();
}