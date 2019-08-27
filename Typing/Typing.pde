char a[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
ArrayList<Character> inputs = new ArrayList<Character>();
boolean start, flag, end;
float time, t1;
float x, y;
letter l[];
Button Reset;

void setup() {
  size(1200, 300); 
  Init();
  InitButton();
}

void draw() {
  Box();
  Time();
  Color();
  Reset.Draw();
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
  Reset = new Button(width/2, 250, 100, 50);
  Reset.Color(255);
  Reset.Stroke(2, 0);
  Reset.Text("Reset", 0, 23);
  Reset.mouseOver(50, 155, 50);
  Reset.Edge(5, 5, 5, 5);
}

void keyPressed() {
  start = true;
  if (inputs.size() < 26 && !error()) {
    inputs.add(new Character(key));
    for (letter k : l)
      k.x -= 40;
  }
  if (inputs.size() == 26)
    end = true;
  if (key == ' ') Reset();
}

void mousePressed() {
  if (Reset.mouseOver()) {
    Reset();
  }
}
