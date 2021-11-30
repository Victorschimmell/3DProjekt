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

float camXbaseAng = 90;
void setup() {

  fullScreen( P3D);
  frameRate(60);
 // earth = loadImage("earth.jpg");

  Sats = new ArrayList<Sat>();
  buttons = new ArrayList<Button>();
  hBoxes = new ArrayList<hBox>();


  noStroke();
  //globe = createShape(SPHERE, r);
 // globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade

  buttons.add(new Button(new PVector(width*1/4, height*0.9), width/7, height/10, "New Satelite", 1));
  buttons.add(new Button(new PVector(width*3/4, height*0.9), width/7, height/10, "Pause", 2));
}

void draw() {
  ///// PREP
  background(1);
  ///// GLOBE
  noFill();
  stroke(255);
  cameraControl();

  pushMatrix();
  translate(width*0.5, height*0.5);

  if (paused==false) {
    x = x+(0.460/60*0.295); // 0.460 km/s/framerate*scaleringsfaktor
  }
  rotateY(x);
  //shape(globe);
  sphere(r);


  ////// SAT
  for ( Sat sat : Sats) {

    sat.display();
  }

  popMatrix();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(-radians(camXbaseAng-90));
  translate(-width/2, -height/2, 0);
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
  popMatrix();
}

void mousePressed() {
  clicked = true;
}

void mouseReleased() {
  clicked = false;
}
void cameraControl() {

  float orbitRadius= (height/2.0) / tan(PI*30.0 / 180.0);

  //float ypos= orbitRadius*sin(radians(camYangle+camYdist));
  float xpos= orbitRadius*cos(radians(camXbaseAng));

  // float zAngle= sqrt(pow(orbitRadius, 2) - pow(camZdist, 2));
  float zpos= orbitRadius*sin(radians(camXbaseAng));

  camera(width/2+xpos, height/2, zpos, width/2, height/2, 0, 0, 1, 0);

  if (mousePressed) {

    float camXdist = mouseX-pmouseX;
    camXbaseAng = camXbaseAng+camXdist;
  }
}
