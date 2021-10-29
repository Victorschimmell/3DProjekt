//3D-Projekt
float angle;

Table table;
float r = 200;

PImage earth;
PShape globe;

int trackTime;

PVector location1;
PVector location2;

void setup() {
  size(800, 600, P3D);
 // earth = loadImage("earth.jpg");

  noStroke();
  globe = createShape(SPHERE, r);
  //globe.setTexture(earth); // billede taget af fordi det tog lang tid at loade
  
  
}

void draw() {


  if ( millis() > trackTime+2000) {
    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=GUEEAL-Z7MBKJ-CPLJWD-4SOY");
    JSONArray positionsJson = j.getJSONArray("positions");

    location1 = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"), positionsJson.getJSONObject(0).getFloat("sataltitude"));
    location2 = new PVector(positionsJson.getJSONObject(1).getFloat("satlongitude"), positionsJson.getJSONObject(1).getFloat("satlatitude"), positionsJson.getJSONObject(1).getFloat("sataltitude"));

    println(location1, location2);

    trackTime = millis();
  }

  background(1);

  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.05;

  lights();
  fill(200);
  
  shape(globe);
  
  
  
  
}
