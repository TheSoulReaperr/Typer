class letter {
  float x,y;
  char a;
  color c = color(0,0,0);
  
  letter(float _x,char _c) {
    x = _x;
    y = height/2;
    a = _c;
  }
  
  void show() {
    fill(c);
    textSize(30-abs((width/2-x)/50));
    text(a,x,y);
  }
}

void Box() {
  background(255);
  noFill();
  stroke(0);
  rectMode(CENTER);
  rect(width/2, height/2+5, 40, 40);
  for (letter a : l)
    a.show();
}

boolean error() {
  boolean flag = false;
  for (int i=0; i<inputs.size(); i++)
    if (a[i] != inputs.get(i)) {      
      flag = true;
      break;
    }
  return flag;
}

void Time() {
  textSize(40);
  if(start && !flag) {
    t1 = millis();
    flag = true;
  }
  if(!end && !error())
    time = millis() -t1;
  if(flag)
    text(time/1000,width/2,50);
  else text(0,width/2,50);
}

void Color() {
  for(int i=0;i<inputs.size();i++) {
    if(a[i] == inputs.get(i)) {
      l[i].c = color(50,200,50);
    } else {
      l[i].c = color(200,50,50);
    }
  }
}

void Reset() {
  inputs = new ArrayList<Character>();
  Init();
  t1 = millis();
  start = false;
  flag = false;
  end = false;
}
