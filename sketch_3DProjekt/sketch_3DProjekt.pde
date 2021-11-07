//3D-Projekt
import java.util.*;
import java.text.*;

Table table;
float r = 200;

PImage earth;
PShape globe;

float x;

ArrayList<Sat> Sats;
ArrayList<Button> buttons;
ArrayList<hBox> hBoxes;

Boolean paused = false;
Boolean clicked = false;


void setup() {

  fullScreen( P3D);
  frameRate(60);
  // earth = loadImage("earth.jpg");

  Sats = new ArrayList<Sat>();
  buttons = new ArrayList<Button>();
  hBoxes = new ArrayList<hBox>();


  noStroke();
  // globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade

  buttons.add(new Button(new PVector(width*1/4, height*0.9), width/7, height/10, "New Satelite", 1));
  buttons.add(new Button(new PVector(width*3/4, height*0.9), width/7, height/10, "Pause", 2));
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

  if (paused==false) {
    x = x+(0.460/60*0.295); // 0.460 km/s/framerate*scaleringsfaktor
  }
  rotateY(x);
  // shape(globe);
  sphere(r);


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

  textSize(12);
  fill(255);
  text(round(frameRate)+ " fps", width-textWidth(round(frameRate)+ " fps  "), 20);
}

void mousePressed() {
  clicked = true;
}

void mouseReleased() {
  clicked = false;
}
