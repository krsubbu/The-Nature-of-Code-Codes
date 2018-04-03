class WindMill{
  
  Box box1;
  Box box2;
  RevoluteJoint joint;
  WindMill(){
    box1 = new Box(width/2,0.6*height,20,50,true);
    box2 = new Box(width/2,0.6*height-25,100,20,false);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(box1.body,box2.body,box2.body.getWorldCenter());
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque = 10000.0;
    rjd.enableMotor = false;
    
    joint = (RevoluteJoint)box2d.world.createJoint(rjd);
  }
  
  void toggleMotor(){
    joint.enableMotor(!joint.isMotorEnabled());
  }
  
  void display(){
   box1.display();
   box2.display();
   
   Vec2 anchor = box2d.coordWorldToPixels(box2.body.getWorldCenter());
   fill(0);
   noStroke();
   ellipse(anchor.x,anchor.y,8,8);
  }
}