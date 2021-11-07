class Sat {

  float angle;
  float theta, theta2, phi, phi2;

  PVector rotationAxis;

  long timestamp;
  int id = 25544;

  PVector location, location2;

  PVector position, position2;

  float speed, currentangle;

  color farve;

  Sat(int id_) {

    id -= id_;
    try { 
      JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+ id +"/41.702/-76.014/0/2/&apiKey=WVZACL-QY9FH2-UFJJ6V-4SRE");
      JSONArray positionsJson = j.getJSONArray("positions");
      println(j.getJSONObject("info").getString("satname"));


      location = new PVector(positionsJson.getJSONObject(0).getFloat("satlongitude"), positionsJson.getJSONObject(0).getFloat("satlatitude"), positionsJson.getJSONObject(0).getFloat("sataltitude"));
      location2 = new PVector(positionsJson.getJSONObject(1).getFloat("satlongitude"), positionsJson.getJSONObject(1).getFloat("satlatitude"), positionsJson.getJSONObject(1).getFloat("sataltitude"));

      timestamp = positionsJson.getJSONObject(0).getLong("timestamp");

      Date d = new java.util.Date(timestamp*1000);
      java.text.SimpleDateFormat ft = new java.text.SimpleDateFormat("E dd/MM-yyyy 'at' hh:mm:ss zzz");
      ft.setTimeZone(java.util.TimeZone.getTimeZone("GMT+1"));


      println("Current time at simulation: "+ ft.format(d), ", Unix timestamp: " + timestamp);

      theta = radians(location.y);
      theta2 = radians(location2.y);
      phi = radians(location.x)+PI;
      phi2 = radians(location2.x)+PI;

      position = new PVector(r*cos(theta)*cos(phi), -r*sin(theta), -r*cos(theta)*sin(phi));
      position2 = new PVector(r*cos(theta2)*cos(phi2), -r*sin(theta2), -r*cos(theta2)*sin(phi2));

      rotationAxis = position.cross(position2);

      angle = PVector.angleBetween(position, position2);

      farve = color(random(1, 255), random(1, 255), random(255));


      if (timestamp !=0) {
        hBoxes.add( new hBox(j.getJSONObject("info").getString("satname"), 20, farve, ft.format(d)));
      } else {

        for (int i = 0; i < Sats.size(); i++) {
          if (Sats.get(i).timestamp == 0) {
            Sats.remove(Sats.get(i));
            println("Dead satelite has been removed", Sats.size());
          }
        }
      }
    }
    catch(Exception e) {

      System.out.println("Exception: " + e);
    }
  }


  void display() {
    if (timestamp != 0) {
      fill(farve);
      if (paused==false) {
        currentangle+=(angle);
      }

      pushMatrix();
      rotate(currentangle, rotationAxis.x, rotationAxis.y, rotationAxis.z);
      rotateY(x);
      translate(position.x, position.y, abs(position.z)+abs(location.z*0.295));
      box(15);
      popMatrix();
    }
  }
}
