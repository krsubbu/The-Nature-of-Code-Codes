float amp;
float theta;
float x;
float y;


void setup() {
  size(640, 360);
  //distance from center
  amp = 200;
  //angle starting from 0
  theta = 0;
  //initial ball x and y coordinate
  x = width/2;
  y = height/2;
}

void draw() {
  background(255,50);
  //translating the origin to the center of the screen
  translate(width/2,height/2);
  ellipseMode(CENTER);
  fill(150);
  noStroke();
  ellipse(x,0, 30, 30);
//incrementing or decremnenting the x according to the sine function
  x = amp * sin(theta);
//increasing theta i.e angle which make sin oscillate between -1 and 1 
//which further oscillate x to -200 to 200
  theta += 0.1;
}