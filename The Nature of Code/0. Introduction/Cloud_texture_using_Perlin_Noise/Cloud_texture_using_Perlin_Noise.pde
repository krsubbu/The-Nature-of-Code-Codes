float tx = 0;
float ty = 10000;
size(300,300);
  loadPixels();
  for (int row=0; row<width; row++) {
    ty = 0;
    for (int col=0; col<height; col++) {
      int index = row + col * width;
      float value = map(noise(tx, ty),0,1,0,255);
      pixels[index] = color(value);
      ty += 0.05;
    }
    tx += 0.05;
  }
  updatePixels();