class hBox {

  PVector pos;

  String indhold;

  int textSize;
  color farve;


  hBox(String input, int textSize_, color farve_) {

    indhold = input;
    textSize = textSize_;
    farve = farve_;

    pos = new PVector(10, textAscent()+textDescent());
  }

  void display() {
    noStroke();
    textSize(textSize);
    textAlign(CORNER, RIGHT);
    rectMode(CORNER);

    for (int i = 1; i < hBoxes.size(); i++) {
      if (hBoxes.get(i).pos.y == hBoxes.get(i-1).pos.y) {
        pos.y+=textAscent()+textDescent();
      }
    }
    
    fill(farve);
    rect(pos.x, pos.y, textWidth(indhold)+5, -(10+(textAscent())));
    fill(255);
    text(indhold, pos.x, pos.y);

    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    stroke(255);
  }
}
