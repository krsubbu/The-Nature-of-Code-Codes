class Ball{
  
  Body body;
  float r;
  color c;
  
  Ball(){
    r = random(10,20);
    
    //First body definition will occur
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(random(width),0));
    //Creating the body using the body definitions
    body = box2d.createBody(bd);
    //Creating the shape of the body.
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    
    //Attaching the shape to the body using the fixture.
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    //attaching the body with fixture created with some properties.
    body.createFixture(fd);   
    
    body.setUserData(this);
    body.setAngularVelocity(5);
    c = color(200,200,200);
  }
  void change(){
    c = color(255,0,0);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    
    fill(c);
    stroke(0);
    ellipse(0,0,r,r);
    noFill();
    line(0,0,r/2,0);
    popMatrix();
  }
  
}