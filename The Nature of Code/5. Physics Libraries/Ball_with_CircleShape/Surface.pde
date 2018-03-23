class Surface{
  Body body;
  ArrayList<Vec2> surface;
  Vec2[] vertices = new Vec2[3];
  
  Surface(){
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(0,height/2));
    surface.add(new Vec2(width/2,300));
    surface.add(new Vec2(width,height/2));
    ChainShape chain = new ChainShape();
    for(int i=0;i<surface.size();i++){
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    chain.createChain(vertices,vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2,height/2));
    body = box2d.createBody(bd);

    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.3;
    
    body.createFixture(fd);
  }
  
  void display(){
    strokeWeight(2);
    stroke(0);
    fill(0);
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    vertex(width,height);
    vertex(0,height);
    endShape();
  }
  
}