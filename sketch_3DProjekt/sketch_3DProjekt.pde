//3D-Projekt
Table table;
float r = 200;

PImage earth;
PShape globe;

ArrayList<Sat> Sats;

void setup() {

  size(800, 600, P3D);
  // earth = loadImage("earth.jpg");

  Sats = new ArrayList<Sat>();

  Sats.add(new Sat());

  noStroke();
  globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade
}

void draw() {
  ///// PREP
  background(1);
  lights();

  ///// GLOBE
  noFill();
  stroke(255);
  translate(width*0.5, height*0.5);
  //shape(globe);
  sphere(r);

  ////// SAT
  for ( Sat sat : Sats) {

    sat.display(); 


    ///// TEXT
    pushMatrix();
    translate(-width/2, -height/2);
    text("timestamp: " + sat.timestamp + " seconds", 20, 20);
    popMatrix();
    
  }
}
