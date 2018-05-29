ArrayList<PVector> points;
float m = 1;
float b = 0;

void setup() {
  size(400, 400);
  points = new ArrayList<PVector>();
  frameRate(2);
}

//void mousePressed() {
//  float x = map(mouseX, 0, width, 0, 1);
//  float y = map(mouseY, 0, height, 1, 0);
//  PVector point = new PVector(x, y);
//  points.add(point);
//}

void draw() {
  background(0);
  PVector point = new PVector(map(random(200),0,width,0,1),map(random(height),0,width,0,1));
  points.add(point);
  
  if(points!=null){
    for(int i=0; i<points.size();i++){
      PVector p = points.get(i);
      float x = map(p.x,0,1,0,width);
      float y = map(p.y,0,1,height,0);
      fill(255);
      noStroke();
      ellipse(x,y,8,8);
    }
  }
  LinearRegression();
  drawLine();
}

void drawLine(){
  float x1 = 0;
  float y1 = m*x1 + b;
  float x2 = 1;
  float y2 = m*x2 + b;
  
  x1 = map(x1,0,1,0,width);
  y1 = map(y1,0,1,height,0);
  x2 = map(x2,0,1,0,width);
  y2 = map(y2,0,1,height,0);
  
  stroke(255,0,255);
  line(x1,y1,x2,y2);
  
}

void LinearRegression(){
  float xsum = 0;
  float ysum = 0;
  
  for(int i=0; i<points.size();i++){
    xsum += points.get(i).x;
    ysum += points.get(i).y;
  }
  float xmean = xsum/points.size();
  float ymean = ysum/points.size();
  
  float num = 0;
  float den = 0;
  for(int i=0; i<points.size();i++){
    float x = points.get(i).x;
    float y = points.get(i).y;
    num += (x-xmean)*(y-ymean);
    den += (x-xmean)*(x-xmean);
  }
  
  m = num/den;
  b = ymean - m*xmean;  
}