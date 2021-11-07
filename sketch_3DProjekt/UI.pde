class Button {
  PVector pos; //Positionen på knappen
  String text; //Funktion knappen skal køre

  float knapwidth;
  float knapheight;
  int id;
  int x = 0;

  color farve = (230);

  Button(PVector pos_, float w_, float h_, String text_, int id_) {

    knapwidth = w_;
    knapheight = h_;
    pos = pos_;
    text = text_;
    id = id_;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 255, 255, 70);
    textSize(24);
    textAlign(CENTER, CENTER);
    
    fill(farve);
    rect(pos.x, pos.y, knapwidth, knapheight, 10, 10, 10, 10);
    fill(1);
    text(text, pos.x, pos.y,1);
  }

  void collision() {
    if (mouseX<pos.x+knapwidth/2 && mouseX>pos.x-knapwidth/2 && mouseY<pos.y+knapheight/2 && mouseY>pos.y-knapheight/2) {

      farve = 200;

      if (clicked==true) {
        switch(id) {

        case 1:

          Sats.add(new Sat(Sats.size()+x));
          x-=5;

          break;

        case 2:
          if (paused==true) {
            paused=false;
            text = "Pause";
            println("unpaused");
          } else {
            paused=true;
            text = "Unpause";
            println("paused");
          }
        }
        clicked = false;
      }
    } else {
      if (farve!=230) {
        farve = 230;
      }
    }
  }
}
