
class Button {
  int TextSize=1;
  int StrokeWeight = 0;
  color ButtonColor = color(0, 0, 0);
  color TextColor = color(255, 255, 255);
  color StrokeColor = color(0, 0, 0);
  color mouseOverColor = color(0,0,0);
  float TextX, TextY;
  float Edge1, Edge2, Edge3, Edge4;
  float ButtonX, ButtonY, ButtonW, ButtonH;
  String Text = " ";
  boolean noFill = false;
  boolean circle = false;
  
  Button() {
  }

  Button(float x, float y, float w, float h) {
    ButtonX = x;
    ButtonY = y;
    ButtonW = w;
    ButtonH = h;
    TextX = x;
    TextY = y;
  }  

  void Color(color c) {
    ButtonColor = c;
    mouseOverColor = c;
  }

  void Color(int r, int g, int b) {
    ButtonColor = color(r, g, b);
    mouseOverColor = color(r, g, b);
  }

  void Text(String t, color c, int ts) {
    Text = t;
    TextSize = ts;
    TextColor = c;
  }

  void Text(String t, float x, float y, color c, int ts) {
    Text = t;
    TextX = x;
    TextY = y;
    TextSize = ts;
    TextColor = c;
  }

  void Text(String t, int r, int g, int b, int ts) {
    Text = t;
    TextSize = ts;
    TextColor = color(r, g, b);
  }

  void Text(String t, float x, float y, int r, int g, int b, int ts) {
    Text = t;
    TextX = x;
    TextY = y;
    TextSize = ts;
    TextColor = color(r, g, b);
  }

  void Stroke(int sw) {
    StrokeWeight = sw;
    StrokeColor = ButtonColor;
  }

  void Stroke(int sw, color c) {
    StrokeWeight = sw;
    StrokeColor = c;
  }

  void Stroke(int sw, int r, int g, int b) {
    StrokeWeight = sw;
    StrokeColor = color(r, g, b);
  }

  void Edge(float e1, float e2, float e3, float e4) {
    Edge1 = e1;
    Edge2 = e2;
    Edge3 = e3;
    Edge4 = e4;
  }
  
  void mouseOver(color c) {
    mouseOverColor = c;
  }

  void mouseOver(int r, int g, int b) {
    mouseOverColor = color(r, g, b);
  }
  
  boolean mouseOver() {
    if (mouseX > ButtonX - ButtonW/2 && mouseX < ButtonX + ButtonW/2 && mouseY > ButtonY - ButtonH/2 && mouseY < ButtonY + ButtonH/2){
      return true;
    } else return false;
  }
  
  boolean mousePressed() {
    if(mouseOver() && mousePressed) return true;
    else return false;
  }
  
  void Nofill() {
    noFill = true;
  }
  
  void circle() {
    circle = true;
  }
  
  void Draw() {
    if (mouseOver())
      fill(mouseOverColor);
    else
      fill(ButtonColor);
    rectMode(CENTER);
    stroke(StrokeColor);
    strokeWeight(StrokeWeight);
    if(noFill) noFill();
    if(circle) ellipse(ButtonX, ButtonY, ButtonW, ButtonH);
    else  rect(ButtonX, ButtonY, ButtonW, ButtonH, Edge1, Edge2, Edge3, Edge4);
    fill(TextColor);
    textSize(TextSize);
    textAlign(CENTER, CENTER);
    text(Text, TextX, TextY);
  }
}
