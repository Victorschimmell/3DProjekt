//3D-Projekt
float rotation = 0;

PVector yAxis = new PVector(0, 1, 0);
PVector zAxis = new PVector(0, 0, 1);

int trackTime;

PVector location1;
PVector location2;

void setup() {
  size(800, 600, P3D);
}

void draw() {


  if ( millis() > trackTime+2000) {
    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=GUEEAL-Z7MBKJ-CPLJWD-4SOY");
    JSONArray positionsJson = j.getJSONArray("positions");

    location1 = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"));
    location2 = new PVector( positionsJson.getJSONObject(1).getFloat("satlongitude"), positionsJson.getJSONObject(1).getFloat("satlatitude"));

    println(location1, location2);

    trackTime = millis();
  }

  background(1);

  rotation+=0.1;

  //midten
  pushMatrix();
  translate(width*0.5, height*0.5);
  box(20);
  popMatrix();

  //latt
  pushMatrix();
  translate(width*0.5, height*0.5);
  //rotate(rotation, yAxis.x, yAxis.y, yAxis.z);
  rotate(rotation, zAxis.x, zAxis.y, zAxis.z);
  translate(100, 0, 0);
  box(20);
  popMatrix();
}
