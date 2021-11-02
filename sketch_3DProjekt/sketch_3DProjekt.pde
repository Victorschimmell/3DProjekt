//3D-Projekt
float angle;
float theta, phi;

Table table;
float r = 200;

PImage earth;
PShape globe;

int timestamp, timestamp2;

PVector location, location2;

PVector position;

ArrayList<Sat> Sats;

void setup() {
  JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=QHR6R9-M2Z5YZ-ZE8NAR-4SSY");
  JSONArray positionsJson = j.getJSONArray("positions");


  location = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"), positionsJson.getJSONObject(0).getFloat("sataltitude"));
  location2 = new PVector(positionsJson.getJSONObject(1).getFloat("satlongitude"), positionsJson.getJSONObject(1).getFloat("satlatitude"), positionsJson.getJSONObject(1).getFloat("sataltitude"));

  timestamp = positionsJson.getJSONObject(0).getInt("timestamp");
  timestamp2 = positionsJson.getJSONObject(1).getInt("timestamp");
  //println(location, timestamp);

  theta = radians(location.y);
  phi = radians(location.x)+PI;

  position = new PVector(r*cos(theta)*cos(phi), -r*sin(theta), -r*cos(theta)*sin(phi));  

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

///// TEXT
  pushMatrix();
  translate(0, 0);
  text("timestamp: " + timestamp + " seconds", 20, 20);
  popMatrix();


 ///// GLOBE
  pushMatrix();
  fill(200);
  translate(width*0.5, height*0.5);
  shape(globe);
  popMatrix();

////// SAT
 for( Sat sat : Sats){
   
  sat.display(); 
 }

  println(position, location, location2);
  
}
