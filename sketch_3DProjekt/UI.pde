class Button {
  PVector pos; //Positionen på knappen
  String text; //Funktion knappen skal køre

  float knapwidth;
  float knapheight;
  int id;

  color farve = (70);

  Button(PVector pos_, float w_, float h_, String text_, int id_) {

    knapwidth = w_;
    knapheight = h_;
    pos = pos_;
    text = text_;
    id = id_;

    rectMode(CENTER);
    fill(255, 255, 255, 70);
    textSize(24);
    textAlign(CENTER, CENTER);
  }

  void display() {
    fill(farve);
    rect(pos.x, pos.y, knapwidth, knapheight, 10, 10, 10, 10);
    fill(255);
    text(text, pos.x, pos.y);
  }

  void collision() {
    if (mouseX<pos.x+knapwidth/2 && mouseX>pos.x-knapwidth/2 && mouseY<pos.y+knapheight/2 && mouseY>pos.y-knapheight/2) {

      farve = 40;

      if (mousePressed) {

        switch(id) {

        case 1:

          Sats.add(new Sat(Sats.size()*3));

          break;

        case 2:
        
        
        
        
        }
      }
    } else {
      if (farve!=70) {
        farve = 70;
      }
    }
  }
}
