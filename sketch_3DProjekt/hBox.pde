class hBox {

  PVector pos;

  String indhold;

  int textSize;
  color farve;
  String date;


  hBox(String input, int textSize_, color farve_, String date_) {

    indhold = input;
    textSize = textSize_;
    farve = farve_;
    date = date_;

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
    rect(pos.x, pos.y-textAscent(), textWidth(indhold+" | " + date)+5, textAscent()+textDescent());
    fill(1);
    text(indhold+ " | " +date, pos.x, pos.y);

    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    stroke(255);
  }
}
