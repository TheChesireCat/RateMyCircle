//circle Circle;
import java.math.BigInteger;
FloatList scores;
BigInteger h,k,r;
ArrayList<Long> x;
ArrayList<Long> y;
int n;
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
  init();
  noStroke();
}

void draw(){
  
  //background(255);
  textSize(86);
  fill(#1A5C8E);
  translate(width/2,150);
  textAlign(CENTER);
  text("RateMyCircle!",0,0);
  textSize(30);
  text("Touch To Draw A Pretty Circle :)",0,40);
  translate(-width/2,-150);
  
  if(mousePressed){
    add(mouseX,mouseY);
    fill(#1A5C8E);
    ellipse(mouseX,mouseY,20,20);
    println(n);
  }
}


void mouseReleased(){
 fill(255,200);
 rectMode(CORNER);
 rect(0,height/7,width,height);
 
 //Calculations : 
 long a=calc_A();
 long b=calc_B();
 long c=calc_C();
 h=a/2;
 k=b/2;
 r=-(long)(sqrt(4*c+a*a+b*b))/2;
 noFill();
 stroke(0,40);
 ellipse(h,k,r,r);
 println("h =" + h +" k ="+k+" r ="+r);
 println("X Coordinates :");
 for(int i=0;i<n;i++){
   println(x.get(i));
 }
 println("Y Coordinates :");
 for(int i=0;i<n;i++){
   println(y.get(i));
 }
 init();
 println("size = "+n);
 println("START AGAIN");
}

void init(){
  x=new ArrayList<Long>();
  y=new ArrayList<Long>();
  sum_x=0;
  sum_y=0;
  sum_xy=0;
  sum_x2=0;
  sum_y2=0;
  sum_eq1=0;
  sum_eq2=0;
  sum_eq3=0;
  n=0;
}

void add(long a,long b){
  x.add(a);
  y.add(b);
  sum_x+=a;
  sum_y+=b;
  sum_xy+=(a*b);
  sum_x2+=(a*a);
  sum_y2+=(b*b);   
  sum_eq1+=(a*(a*a+b*b));
  sum_eq2+=(b*(a*a+b*b));
  sum_eq3+=(a*a+b*b);
  n+=1;
}

long calc_A(){
  float A=(n*(sum_eq2)*(sum_xy) - (sum_eq2)*(sum_x)*(sum_y) - 
      (sum_eq3)*(sum_xy)*(sum_y) + (sum_eq1)*pow(sum_y,2) - 
      n*(sum_eq1)*(sum_y2) + (sum_eq3)*(sum_x)*(sum_y2))/
   (n*pow(sum_xy,2) - 2*(sum_x)*(sum_xy)*(sum_y) + (sum_x2)*pow(sum_y,2) + 
      pow(sum_x,2)*(sum_y2) - n*(sum_x2)*(sum_y2));
  println("A: "+A);
  return (long)A;
}
long calc_B(){
  float B=((-(sum_eq2))*pow(sum_x,2) + n*(sum_eq2)*(sum_x2) - 
      n*(sum_eq1)*(sum_xy) + (sum_eq3)*(sum_x)*(sum_xy) + 
      (sum_eq1)*(sum_x)*(sum_y) - (sum_eq3)*(sum_x2)*(sum_y))/
   ((-n)*pow(sum_xy,2) + 2*(sum_x)*(sum_xy)*(sum_y) - 
      (sum_x2)*pow(sum_y,2) - pow(sum_x,2)*(sum_y2) + 
  n*(sum_x2)*(sum_y2));
  println("B: "+B);
  return (long)B;
}
long calc_C(){
  float C=((-(sum_eq2))*(sum_x)*(sum_xy) + (sum_eq3)*pow(sum_xy,2) + 
      (sum_eq2)*(sum_x2)*(sum_y) - (sum_eq1)*(sum_xy)*(sum_y) + 
      (sum_eq1)*(sum_x)*(sum_y2) - (sum_eq3)*(sum_x2)*(sum_y2))/
   (n*pow(sum_xy,2) - 2*(sum_x)*(sum_xy)*(sum_y) + (sum_x2)*pow(sum_y,2) + 
      pow(sum_x,2)*(sum_y2) - n*(sum_x2)*(sum_y2));
      println("C: "+C);
  return (long)C;    
}


  