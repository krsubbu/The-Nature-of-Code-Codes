class Path{
 
  PVector a;
  PVector b;
  float radius;
  Path(){
    radius = 25;
   a = new PVector(0,150);
   b = new PVector(width,330);
  }
  
  
  
  void display(){
    stroke(200);
    strokeWeight(radius*2);
    line(a.x,a.y,b.x,b.y);
    stroke(0);
    strokeWeight(1);
    line(a.x,a.y,b.x,b.y);
  }
  
}