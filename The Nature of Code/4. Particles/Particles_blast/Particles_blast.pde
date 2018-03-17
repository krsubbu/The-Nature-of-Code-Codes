ArrayList<Particle> particle = new ArrayList<Particle>();

void setup(){
  size(640,360);
}

void draw(){
  background(255);
  particle.add(new Particle());
  
  for(int i=0; i<particle.size(); i++){
  Particle p = particle.get(i);
  PVector gravity = new PVector(0,0.1);
  p.applyForce(gravity);
  
  p.display();
  p.move();
  
  if(p.isDead()){
    particle.remove(i);
  }
  
  
}
}