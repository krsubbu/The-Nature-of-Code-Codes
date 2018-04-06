class Particle extends VerletParticle2D{
 
  Particle(Vec2D pos){
    super(pos);
  }
  
  void display(){
    fill(200);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,20,20);
  }  
}