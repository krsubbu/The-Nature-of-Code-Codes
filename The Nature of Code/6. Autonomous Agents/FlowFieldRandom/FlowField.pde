class FlowField{
  PVector grid[][];
  int col;
  int row;
  int resolution;
  
  FlowField(){
    resolution = 20;
    col = width/resolution;
    row = height/resolution;
    grid = new PVector[col][row];
    
    for(int i=0; i<col; i++){
      for(int j=0; j<row; j++){
        grid[i][j]= new PVector(random(1),random(1));
      }
    }
  }
  
  void display(){
    for(int i=0; i<col; i++){
      for(int j=0; j<row; j++){
        pushMatrix();
        translate(i*resolution,j*resolution);
        rotate(grid[i][j].heading2D());
        stroke(0);
        float len = grid[i][j].mag()*(resolution-2);
        line(0,0,len,0);
        popMatrix();
      }
    }
  }
  
}