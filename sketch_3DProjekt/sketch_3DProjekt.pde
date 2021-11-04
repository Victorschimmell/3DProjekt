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
  // earth = loadImage("earth.jpg");


  Sats = new ArrayList<Sat>();

  Sats.add(new Sat());

  noStroke();
  globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade
  buttons = new ArrayList<Button>();
  buttons.add(new Button(new PVector(width/2, height*0.5), width/5, height/5, "Test", 1));
  buttons.add(new Button(new PVector(width/2, height*0.1), width/5, height/5, "Test2", 2));
  buttons.add(new Button(new PVector(width*0.7, height*0.1), width/5, height/5, "Test3", 3));
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
  x = x+0.012;
  rotateY(x);
  //shape(globe);
  sphere(r);
  popMatrix();

  ////// SAT
  for ( Sat sat : Sats) {

    sat.display(); 

    ///// TEXT
    pushMatrix();
    translate(-width/2, -height/2);
    textSize(12);
    text("timestamp: " + sat.timestamp + " seconds", 20, 20);
    for ( Button b : buttons) {
      b.display();
      b.collision();
    }
    popMatrix();
  }
}
