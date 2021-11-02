class Sat {


  Sat() {
    
    
  }
  void display() {
    pushMatrix();
    translate(width*0.5+position.x, height*0.5+ position.y, position.z+(location.z*0.295));
    box(20);
    popMatrix();
  }
}
