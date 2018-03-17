class Wave {
  float x;
  float xend;
  float y;
  float period;
  float xspacing;
  float theta;

  Wave(float x_, float xend_, float y_, float period_) {
    x = x_;
    xend = xend_;
    y = y_;
    period = period_;
    xspacing = 10;
    theta = 0;
  }

  void display() {
    for (float i =x; i<xend; i=i+xspacing) {
      fill(200, 50);
      stroke(0);
      ellipse(i, y, 30, 30);
      y = height/2+ 50*sin(theta);
      theta += (PI/period)*xspacing;
    }
  }
}