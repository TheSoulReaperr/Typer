ArrayList<Character> inputs = new ArrayList<Character>();
boolean start, flag, end;
float time, t1;
float x, y;
char a[];
letter l[];
Button Reset;
Button Reverse;

void setup() {
  size(1200, 300);
  a = new char[26];
  for(int i=0;i<26;i++)
    a[i] = char(i+97);
  Init();
  InitButton();
}

void draw() {
  Box();
  Time();
  Color();
  Reset.Draw();
  Reverse.Draw();
}

void Init() {
  frameRate(60);
  textSize(30);
  textAlign(CENTER, CENTER);
  x = width/2 + 40;
  l = new letter[26];
  for (int i=0; i<l.length; i++) {
    l[i] = new letter(x, a[i]);
    x += 40;
  }
}

void InitButton() {
  Reset = new Button(width/2 - 75, 250, 100, 50);
  Reset.Color(255);
  Reset.Stroke(2, 0);
  Reset.Text("Reset", 0, 23);
  Reset.mouseOver(50, 155, 50);
  Reset.Edge(5, 5, 5, 5);
  
  Reverse = new Button(width/2 + 75, 250, 100, 50);
  Reverse.Color(255);
  Reverse.Stroke(2, 0);
  Reverse.Text("Reverse", 0, 23);
  Reverse.mouseOver(50, 155, 50);
  Reverse.Edge(5, 5, 5, 5);
}

void keyPressed() {
  if (inputs.size() < 26 && !error() && ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z'))){
    start = true;
    inputs.add(new Character(Character.toLowerCase(key)));
    for (letter k : l)
      k.x -= 40;
  }
  if (inputs.size() == 26)
    end = true;
  if (key == ' ') Reset();
  if (key == '0') Reverse();
}

void mousePressed() {
  if (Reset.mouseOver()) {
    Reset();
  } 
  if(Reverse.mouseOver()) {
    Reverse();
  }
}
