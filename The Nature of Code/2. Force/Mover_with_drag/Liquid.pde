class Liquid {

  float x;
  float y;
  float w;
  float h;
  float c;

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
  void display() {
    fill(100);
    noStroke();
    rect(x, y, w, h);
  }

  PVector drag(Mover mover) {
    PVector drag = mover.velocity.get();
    float speed = mover.velocity.mag();
    drag.normalize();
    drag.mult(-1*speed*speed*liquid.c);
    return drag;
  }
}