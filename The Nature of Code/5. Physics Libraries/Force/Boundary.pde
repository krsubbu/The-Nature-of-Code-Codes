class Boundary{
  
  Body body;
  float w;
  float h;
  float x;
  float y;
  
  Boundary(float x_,float y_,float w_,float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.4;
    
    body.createFixture(fd);   
  }
  
  void display(){
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}