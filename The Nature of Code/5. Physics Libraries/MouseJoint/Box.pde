class Box{
 
  Body body;
  float w;
  float h;
  
  Box(){
    w = 20;
    h = 20;
     
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2,10));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
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
    rectMode(CENTER);
    fill(200);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
  }
  
  boolean contains(float x,float y){
    Vec2 worldPoint = box2d.coordPixelsToWorld(x,y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
}