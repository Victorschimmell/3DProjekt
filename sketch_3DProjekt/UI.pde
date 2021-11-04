class Button{
  PVector pos; //Positionen på knappen
  String text; //Funktion knappen skal køre
  
  float knapwidth;
  float knapheight;
  
  Button(PVector pos_, float w_, float h_, String text_){
    
    knapwidth = w_;
    knapheight = h_;
    pos = pos_;
    text = text_;
    
    rectMode(CENTER);
    fill(255,255,255,70);
    textSize(24);
    textAlign(CENTER,CENTER);
  }
  
  void display(){
    rect(pos.x, pos.y, knapwidth, knapheight, 10,10,10,10);
    text(text,pos.x,pos.y);
  }
  
  void colission(){
    if(mouseX>pos.x+knapwidth/2 && mouseX<pos.x-knapwidth/2 && mouseY>pos.y+knapheight/2 && mouseY<pos.y-knapheight/2){
      println("col");
    }
  }
}
