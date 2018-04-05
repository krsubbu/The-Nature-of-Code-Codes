class Box{
  
  Body body;
  float w;
  float h;
  
  Box(){
    w = 16;
    h = 16;
    
    //First body definition will occur
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(random(width),0));
    //Creating the body using the body definitions
    body = box2d.createBody(bd);
    //Creating the shape of the body.
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    //creating a box as a shape for the body.
    ps.setAsBox(box2dW,box2dH);
    //Attaching the shape to the body using the fixture.
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    //attaching the body with fixture created with some properties.
    body.createFixture(fd);   
  }
  
  void applyForce(Vec2 force){
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force,pos);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    if(pos.y>height+20){
      killBody();
      return true;
    }else
      return false;
  }
  
  void killBody(){
    box2d.destroyBody(body);
  }
}