ArrayList<xy> Circle;
FloatList scores;
void setup(){
  
  size(displayWidth,displayHeight);
  background(255);
  
  scores = new FloatList();
  scores.append(0.0);
  PFont zigFont;
  zigFont = createFont("zig.ttf",32);
  textFont(zigFont,32);
  textSize(86);
  
  textSize(86);
  translate(width/2,150);
  textAlign(CENTER);
  text("RateMyCircle!",0,0);
  textSize(30);
  text("Touch To Draw A Pretty Circle :)",0,40);
  translate(-width/2,-150);
  
  noStroke();
}

void draw(){
  
  //background(255);
  textSize(86);
  translate(width/2,150);
  textAlign(CENTER);
  text("RateMyCircle!",0,0);
  textSize(30);
  text("Touch To Draw A Pretty Circle :)",0,40);
  translate(-width/2,-150);
}

void mousePressed(){
    Circle = new ArrayList<xy>();
    Circle.add(new xy(mouseX,mouseY));
    fill(#1A5C8E);
    ellipse(mouseX,mouseY,20,20);
}
class xy{
  int x;
  int y;
  xy(int a,int b){
    x=a;
    y=b;
  }
  xy(){
    x=0;
    y=0;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
}


  