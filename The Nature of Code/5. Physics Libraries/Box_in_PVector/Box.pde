class Box{
 
  PVector location;
  
  Box(float x_,float y_){
    location = new PVector(x_,y_);
  }
  
  void display(){
    fill(200);
    stroke(0);
    strokeWeight(1);
    rect(location.x,location.y,30,30);
  }
  
  
}