//3D-Projekt
Table table;
float r = 200;

PImage earth;
PShape globe;


float x;

ArrayList<Sat> Sats;
ArrayList<Button> buttons;
ArrayList<hBox> hBoxes;


void setup() {

  fullScreen( P3D);
 // earth = loadImage("earth.jpg");

  Sats = new ArrayList<Sat>();
  buttons = new ArrayList<Button>();
  hBoxes = new ArrayList<hBox>();


  noStroke();
  // globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade

  buttons.add(new Button(new PVector(width/2, height*0.9), width/7, height/10, "New Satelite", 1));
}

void draw() {
  ///// PREP
  background(1);
  lights();

  ///// GLOBE

  noFill();
  stroke(255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  pushMatrix();
  x = x+0.001;
  rotateY(x);
  // shape(globe);
  sphere(r);
  popMatrix();

  ////// SAT
  for ( Sat sat : Sats) {

    sat.display();
  }

  popMatrix();

  for ( Button b : buttons) {
    b.display();
    b.collision();
  }
  
    for (hBox HB : hBoxes)
  {
    HB.display();
  }
}
