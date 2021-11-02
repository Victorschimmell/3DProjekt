//3D-Projekt
float angle;
float theta, phi;

Table table;
float r = 200;

PImage earth;
PShape globe;

int trackTime;

int timestamp;

PVector location;
PVector position;

void setup() {
  size(800, 600, P3D);
  // earth = loadImage("earth.jpg");

  noStroke();
  globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade
}

void draw() {


 if ( millis() > trackTime + 5000) {
    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=WVZACL-QY9FH2-UFJJ6V-4SRE");
    JSONArray positionsJson = j.getJSONArray("positions");


    location = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"), positionsJson.getJSONObject(0).getFloat("sataltitude"));

    timestamp = positionsJson.getJSONObject(0).getInt("timestamp");
    //println(location, timestamp);

    theta = radians(location.y);
    phi = radians(location.x)+PI;

    position = new PVector(r*cos(theta)*cos(phi), -r*sin(theta), -r*cos(theta)*sin(phi));  

    trackTime = millis();
 }

  background(1);
  lights();

  pushMatrix();
  translate(0, 0);
  text("timestamp: " + timestamp + " seconds", 20, 20);
  popMatrix();

  pushMatrix();
  fill(200);
  translate(width*0.5, height*0.5);
  shape(globe);
  popMatrix();

  pushMatrix();
  translate(width*0.5+position.x, height*0.5+ position.y, position.z+(location.z*0.295));
  box(20);
  popMatrix();

  println(position);
}
