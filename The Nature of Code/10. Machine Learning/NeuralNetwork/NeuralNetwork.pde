Matrix m1 = new Matrix(3, 2);
Matrix m2 = new Matrix(3, 3);


void setup() {
  m1.add(5);
  m1.display();
  m2.add(5);
  m2.display();

  Matrix m3 = m1.multiply(m2);
  m3.display();
}

void draw() {
}