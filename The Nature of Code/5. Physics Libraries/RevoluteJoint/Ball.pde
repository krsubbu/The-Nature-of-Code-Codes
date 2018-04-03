class Ball{
   
  Body body;
  float r;
  
  Ball(){
    r = random(10,20);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2,20));
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.3;
    
    body.createFixture(fd);    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(200);
    stroke(0);
    ellipse(0,0,r,r);
    noFill();
    stroke(0);
    line(0,0,r/2,0);
    popMatrix();
  }
}