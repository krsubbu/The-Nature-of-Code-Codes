class Particle extends VerletParticle2D{
  
  Particle(Vec2D pos){
    super(pos);
  }
  
  void display(){
    fill(200);
    stroke(0);
    ellipse(x,y,20,20);
  }
}