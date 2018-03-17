float x;
float y;
float theta;

void setup() {
  size(640, 360);
  x =100;
  y = height/2;
  theta = 0;
}

void draw() {
  background(255);
  
  for(float x=100;x<500;x=x+10){
  fill(200,50);
  stroke(0);
  ellipse(x,y,30,30);
  
  y = height/2+ 50*sin(theta);
  
  theta += (PI/201)*10;
  }
}