//3D-Projekt
Table table;
float r = 200;

PImage earth;
PShape globe;

ArrayList<Sat> Sats;
float x;

ArrayList<Button> buttons;

void setup() {

  size(800, 600, P3D);
  earth = loadImage("earth.jpg");


  Sats = new ArrayList<Sat>();

  

  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade
  buttons = new ArrayList<Button>();
  buttons.add(new Button(new PVector(width/2, height*0.9), width/5, height/5, "New Satelite", 1));
}

void draw() {
  ///// PREP
  background(1);
  lights();

  ///// GLOBE

  noFill();
  stroke(255);
  translate(width*0.5, height*0.5);
  pushMatrix();
  x = x+0.001;
  rotateY(x);
  shape(globe);
  //sphere(r);
  popMatrix();

  ////// SAT
  for ( Sat sat : Sats) {

    sat.display();
  }
  pushMatrix();
  translate(-width/2, -height/2);
  for ( Button b : buttons) {
    b.display();
    b.collision();
  }
  popMatrix();
}
