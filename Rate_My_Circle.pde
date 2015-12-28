//circle Circle;
import java.math.BigInteger;

ArrayList<Long> x=new ArrayList<Long>();
ArrayList<Long> y=new ArrayList<Long>();

int N;



BigInteger sum_x,sum_y,
           sum_xy,sum_x2,
           sum_y2,sum_eq1,
           sum_eq2,sum_eq3,H,K,R;



void setup(){
  
  size(displayWidth,displayHeight);
  background(255);
  
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
  }
}


void mouseReleased(){
 fill(255,200);
 rectMode(CORNER);
 rect(0,height/7,width,height);
 
 //Calculations : 
 println("X Coordinates :");
 for(int i=0;i<N;i++){
   println(x.get(i));
 }
 println("Y Coordinates :");
 for(int i=0;i<N;i++){
   println(y.get(i));
 }
 calculateHKR();
 init();
}


void init(){
  
  x=new ArrayList<Long>();
  y=new ArrayList<Long>();
  sum_x=sum_y=sum_xy=sum_x2=sum_y2=sum_eq1=sum_eq2=sum_eq3=BigInteger.ZERO;
  N=0;
}
void add(long a,long b){
  x.add(a);
  y.add(b);
  sum_x=sum_x.add(BigInteger.valueOf(a));
  sum_y=sum_y.add(BigInteger.valueOf(b));
  sum_x2=sum_x2.add(BigInteger.valueOf(a*a));
  sum_y2=sum_y2.add(BigInteger.valueOf(b*b));
  sum_xy=sum_xy.add(BigInteger.valueOf(a*b));
  sum_eq1=sum_eq1.add(BigInteger.valueOf(a*(a*a+b*b)));
  sum_eq2=sum_eq2.add(BigInteger.valueOf(b*(a*a+b*b)));
  sum_eq3=sum_eq3.add(BigInteger.valueOf((a*a+b*b)));
  N+=1;
}      
void calculateHKR2(){
  
}
void calculateHKR(){
  BigInteger[][] MatrixA={{sum_x2,sum_xy,sum_x},
                         {sum_xy,sum_y2,sum_y},
                         {sum_x ,sum_y ,  new BigInteger(""+N)  }};                         
  BigInteger[] MatrixB={sum_eq1,
                        sum_eq2,
                        sum_eq3};
  // Calculate Inverse
  
  BigInteger[] MatrixC=lsolve(MatrixA,MatrixB);
  
  println("A : " + MatrixC[0] + " B : " + MatrixC[1] + " C : " + MatrixC[2]);
}

BigInteger[] lsolve(BigInteger A[][],BigInteger B[]){
  int N=B.length;
  for(int p=0;p<N;p++){
    int max=p;
    for(int i=p+1;i<N;i++){
      if(A[i][p].abs().compareTo(A[max][p])==1){
        max=i;
      }
    }
    BigInteger[] temp=A[p]; A[p] = A[max];A[max]=temp;
    BigInteger   t   =B[p];B[p]=B[max];B[max]=t;
    
    for(int i =p +1;i<N;i++){
      BigInteger alpha = A[i][p].divide(A[p][p]);
      B[i] = B[i].subtract(alpha.multiply(B[p]));
      for(int j=p;j<N;j++){
        A[i][j]=A[i][j].subtract(alpha.multiply(A[p][j]));
      }
    }
  }
  
  BigInteger[] x = new BigInteger[N];
  for (int i = N-1;i>=0;i--){
    BigInteger sum= BigInteger.ZERO;
    for (int j=i+1;j<N;j++){
      sum=sum.add(A[i][j].multiply(x[j]));
    }
    x[i] = B[i].subtract(sum).divide(A[i][i]);
  }
  return x;
}


  