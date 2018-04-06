class Chain {

  float totalLength;
  float numPoints;
  Particle tail;
  PVector offset;
  boolean dragged = false;
  ArrayList<Particle> particles;

  Chain(float t_, float n_) {
    totalLength = t_;
    numPoints = n_;
    offset = new PVector();
    float len = totalLength/numPoints;

    particles = new ArrayList();

    for (int i=0; i<numPoints; i++) {
      Particle particle = new Particle(new Vec2D(width/2, i*len));
      world.addParticle(particle);
      particles.add(particle);

      if (i!=0) {
        Particle prev = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, prev, len, 1);
        world.addSpring(spring);
      }
    }

    Particle head = particles.get(0);
    head.lock();

    tail = particles.get((int)(numPoints-1));
  }

  void contains(float x, float y) {
    float d = dist(x, y, tail.x, tail.y);
    if (d < 10) {
      offset.x = tail.x - x;
      offset.y = tail.y - y;
      tail.lock();
      dragged = true;
    }
  }

  void release() {
    tail.unlock();
    dragged = false;
  }

  void display() {
    
    stroke(0);
    strokeWeight(2);
    noFill();
    beginShape();
    for (Particle p : particles) {
      vertex(p.x, p.y);
    }
    endShape();
    tail.display();
  }
  void updateTail(int x, int y) {
    if (dragged) {
      tail.set(x+offset.x, y+offset.y);
    }
  }
}