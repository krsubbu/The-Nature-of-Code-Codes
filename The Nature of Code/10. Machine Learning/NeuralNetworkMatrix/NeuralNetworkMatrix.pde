void setup() {
  NeuralNetwork nn = new NeuralNetwork(2,2,1);
  float[] inputs = {1,0};
  float output = nn.feedforward(inputs);
  
}

void draw() {
}
