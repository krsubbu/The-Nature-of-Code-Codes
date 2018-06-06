class NeuralNetwork {

  int input_nodes;
  int hidden_nodes;
  int output_nodes;
  Matrix weight_ih;
  Matrix weight_oh;
  Matrix bias_h;
  Matrix bias_o;


  NeuralNetwork(int input, int hidden, int output) {
    input_nodes = input;
    hidden_nodes = hidden;
    output_nodes = output;

    Matrix weight_ih = new Matrix(hidden_nodes, input_nodes);
    Matrix weight_oh = new Matrix(output_nodes, hidden_nodes);
    weight_ih.randomize();
    weight_oh.randomize();

    Matrix bias_h = new Matrix(hidden_nodes, 1);
    Matrix bias_o = new Matrix(output_nodes, 1);
    //bias_ih.add(1);
  }

  float feedforward(float[] input) {
    Matrix inputs = Matrix.fromArray(input);
    Matrix hidden = weight_ih.multiply(inputs);
  }
}
