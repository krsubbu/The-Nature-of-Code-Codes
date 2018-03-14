class Bob {
  float x;
  float y;
  float length;
  float theta;
  float thetaVel;
  float thetaAcc;
  float mass;

  Bob(int length_) {
    length = length_;
    x = width/2;
    y = length;
    theta = PI/4;
    thetaVel = 0;
    thetaAcc = 0;
    mass = 2;
  }

  void display() {
    translate(width/2, 0);
    line(0, 0, x, y);
    fill(200);
    stroke(0);
    strokeWeight(1);
    ellipse(x, y, 30, 30);
  }

  void move() {
    
    x = length*sin(theta);
    y = length*cos(theta);
    thetaAcc = -0.01* sin(theta)/mass;
    theta += thetaVel;
    thetaVel += thetaAcc;
    
    thetaVel *= 0.99;
    
    
    
  }
}