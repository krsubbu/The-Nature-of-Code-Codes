class Joint{
  Particle p1;
  Particle p2;
  
  float x;
  float y;
  
  float len;
  Joint(float x_,float y_){
    x = x_;
    y = y_;
     len = 32;
     p1 = new Particle(x,y);
     p2 = new Particle(x+random(-1,1),y+random(-1,1));
     
     DistanceJointDef djd = new DistanceJointDef();
     djd.bodyA = p1.body;
     djd.bodyB = p2.body;
     
     djd.length = box2d.scalarPixelsToWorld(len);
     djd.frequencyHz = 2;
     djd.dampingRatio = 0.1;
     
     DistanceJoint dj = (DistanceJoint)box2d.createJoint(djd);
     
  }
  
  void display(){
     Vec2 pos1 = box2d.getBodyPixelCoord(p1.body);
     Vec2 pos2 = box2d.getBodyPixelCoord(p2.body);
     stroke(0);
     strokeWeight(2);
     line(pos1.x,pos1.y,pos2.x,pos2.y);
     
     p1.display();
     p2.display();     
  }
  
}