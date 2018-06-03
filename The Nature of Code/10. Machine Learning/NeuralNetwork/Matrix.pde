class Matrix {

  int row;
  int col;
  float[][] matrix;

  Matrix(int row, int col) {
    this.row = row;
    this.col = col;
    matrix = new float[row][col];

    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        matrix[i][j] = 0;
      }
    }
  }

  void multiply(float n) {
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        matrix[i][j] *= n;
      }
    }
  }
  
  Matrix transpose(){
    Matrix m = new Matrix(col,row);
    for (int i=0; i<col; i++) {
      for (int j=0; j<row; j++) {
        m.matrix[i][j] = matrix[j][i];
      }
    }
    return m;
  }

  Matrix multiply(Matrix m) {
    if(col != m.row){
      println("Error!!! Dimensions are wrong.");
      return null;
    }
    Matrix prod_matrix = new Matrix(row,m.col);
    for (int i=0; i<row; i++) {
      for (int j=0; j<m.col; j++) {
        for (int k=0; k<j; k++) {
          prod_matrix.matrix[i][j] += matrix[i][k]*m.matrix[k][j];
        }
      }
    }
    return prod_matrix;
  }

  void add(float n) {
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        matrix[i][j] += n;
      }
    }
  }

  void add(Matrix m) {
    if (m.row!=row || m.col != col) {
      println("Error!!! Matrix is not of same dimension");
      return;
    }

    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        matrix[i][j] += m.matrix[i][j];
      }
    }
  }

  void randomize() {
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        matrix[i][j] = random(-10, 10);
      }
    }
  }

  void display() {
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        print("\t"+matrix[i][j]);
      }
      println();
    }
    println();
  }
}