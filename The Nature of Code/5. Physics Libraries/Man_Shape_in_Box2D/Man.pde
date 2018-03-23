class Man{
  
  Body body;
  float w;
  float h;
  float r;
  
  Man(){    
    w = 5;
    h = 20;
    r = 15;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX,mouseY));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float boxW = box2d.scalarPixelsToWorld(w/2);
    float boxH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(boxW,boxH);
    
    Vec2 offset = new Vec2(0,-h/2);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    cs.m_p.set(offset.x,offset.y);
    
    body.createFixture(ps,1);
    body.createFixture(cs,1); 
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(200);
    stroke(0);
    strokeWeight(1);
    rect(0,0,w,h);
    ellipse(0,0,r,r);
    popMatrix();    
  }
}