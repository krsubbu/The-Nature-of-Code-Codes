class Surface {

  Body body;
  float surfaceX;
  float surfaceY;
  ArrayList<Vec2> surfaces = new ArrayList<Vec2>();

  Surface() {
    ChainShape cs = new ChainShape();
    float theta = 0;
    for (int x=0; x<width; x += 6) {
      float y = map(cos(theta), -1, 1, 100, height-10);
      theta += 0.1;
      surfaces.add(new Vec2(x, y));
    }

    Vec2[] vertices = new Vec2[surfaces.size()];
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surfaces.get(i));
    }
    cs.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.position.set(0, 0);
    body = box2d.createBody(bd);

    body.createFixture(cs, 1);
  }

  void display() {
    stroke(0);
    fill(0);
    beginShape();
    for (Vec2 v : surfaces) { 
      vertex(v.x, v.y);
    }
    vertex(width,height);
    vertex(0,height);
    endShape();
  }
}