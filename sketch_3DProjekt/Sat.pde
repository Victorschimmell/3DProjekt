class Sat {

  float angle;
  float theta, theta2, phi, phi2;
  
  PVector rotationAxis;

  int timestamp, id = 25544  ;

  PVector location, location2;

  PVector position, position2;
  
  float speed, currentangle;
  
  color farve;

  Sat(int id_) {
    
    id -= id_;
    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+ id +"/41.702/-76.014/0/2/&apiKey=QHR6R9-M2Z5YZ-ZE8NAR-4SSY");
    JSONArray positionsJson = j.getJSONArray("positions");
    println(j.getJSONObject("info").getString("satname"));


    location = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"), positionsJson.getJSONObject(0).getFloat("sataltitude"));
    location2 = new PVector(positionsJson.getJSONObject(1).getFloat("satlongitude"), positionsJson.getJSONObject(1).getFloat("satlatitude"), positionsJson.getJSONObject(1).getFloat("sataltitude"));

    timestamp = positionsJson.getJSONObject(0).getInt("timestamp");
    
    //println(location, timestamp);

    theta = radians(location.y);
    theta2 = radians(location2.y);
    phi = radians(location.x)+PI;
    phi2 = radians(location2.x)+PI;

    position = new PVector(r*cos(theta)*cos(phi), -r*sin(theta), -r*cos(theta)*sin(phi));
    position2 = new PVector(r*cos(theta2)*cos(phi2), -r*sin(theta2), -r*cos(theta2)*sin(phi2));
    
    rotationAxis = position.cross(position2);
    
    angle = PVector.angleBetween(position, position2);
    
    farve = color(random(1,255),random(1,255),random(255));
 
  }


  void display() {
    fill(farve);
    noStroke();
    currentangle+=angle;

    pushMatrix();
    rotate(currentangle, rotationAxis.x, rotationAxis.y, rotationAxis.z);
    rotateY(x);
    translate(position.x, position.y, position.z-(location.z*0.295));
    box(15);
    popMatrix();
    
    
  }
}
