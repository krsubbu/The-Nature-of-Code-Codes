class Walker{
 
  float x;
  float y;
  
  Walker(){
  x = width/2;
  y = height/2;
 }
 
 void display(){
    fill(0);
    point(x,y); 
 }
 
 void move(){
  int num = (int)random(4);
  if(num == 1){
    x = x+1;
  }else if(num==2){
    x = x -1;
  }else if(num==3){
    y = y+1;
  }else{
    y = y-1;
  }
   
 }
}