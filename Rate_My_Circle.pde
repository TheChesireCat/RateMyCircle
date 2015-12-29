//circle Circle;
import java.math.BigDecimal;
import java.math.MathContext;

ArrayList<Long> x=new ArrayList<Long>();
ArrayList<Long> y=new ArrayList<Long>();

int N;



BigDecimal sum_x,sum_y,
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
    noStroke();
    fill(#1A5C8E);
    ellipse(mouseX,mouseY,20,20);
  }
}


void mouseReleased(){

 fill(255,230);
 rectMode(CORNER);
 noStroke();
 rect(0,0,width,height);
 
 //Calculations : 
 
 long[] HKR=toHKR(calculateHKR());
 noFill();
 stroke(#7B92ED,200);
 strokeWeight(10);
 ellipse(HKR[0],HKR[1],HKR[2]*2,HKR[2]*2);

 println("N :" + N);
 println("R :" + HKR[2]);

 init();
}


void init(){
  
  x=new ArrayList<Long>();
  y=new ArrayList<Long>();
  sum_x=sum_y=sum_xy=sum_x2=sum_y2=sum_eq1=sum_eq2=sum_eq3=BigDecimal.ZERO;
  N=0;
}
void add(long a,long b){
  x.add(a);
  y.add(b);
  sum_x=sum_x.add(BigDecimal.valueOf(a));
  sum_y=sum_y.add(BigDecimal.valueOf(b));
  sum_x2=sum_x2.add(BigDecimal.valueOf(a*a));
  sum_y2=sum_y2.add(BigDecimal.valueOf(b*b));
  sum_xy=sum_xy.add(BigDecimal.valueOf(a*b));
  sum_eq1=sum_eq1.add(BigDecimal.valueOf(a*(a*a+b*b)));
  sum_eq2=sum_eq2.add(BigDecimal.valueOf(b*(a*a+b*b)));
  sum_eq3=sum_eq3.add(BigDecimal.valueOf((a*a+b*b)));
  N+=1;
}      

BigDecimal[] calculateHKR(){
  BigDecimal[][] MatrixA={{sum_x2,  sum_xy,     sum_x           },
                         { sum_xy,   sum_y2,    sum_y           },
                         { sum_x ,   sum_y ,  new BigDecimal(N)  }};    
                         
  BigDecimal[] MatrixB={sum_eq1,
                        sum_eq2,
                        sum_eq3};

  BigDecimal[] MatrixC=lsolve(MatrixA,MatrixB);
  return MatrixC;
}

BigDecimal[] lsolve(BigDecimal A[][],BigDecimal B[]){
  int N=B.length;
  for(int p=0;p<N;p++){
    int max=p;
    for(int i=p+1;i<N;i++){
      if(A[i][p].abs().compareTo(A[max][p])==1){
        max=i;
      }
    }
    BigDecimal[] temp=A[p]; A[p] = A[max];A[max]=temp;
    BigDecimal   t   =B[p];B[p]=B[max];B[max]=t;
    
    for(int i =p +1;i<N;i++){
      BigDecimal alpha = A[i][p].divide(A[p][p],MathContext.DECIMAL128);
      B[i] = B[i].subtract((alpha.multiply(B[p])));
      for(int j=p;j<N;j++){
        A[i][j]=A[i][j].subtract(alpha.multiply(A[p][j]));
      }
    }
  }
  
  BigDecimal[] x = new BigDecimal[N];
  for (int i = N-1;i>=0;i--){
    BigDecimal sum= BigDecimal.ZERO;
    for (int j=i+1;j<N;j++){
      sum=sum.add(A[i][j].multiply(x[j]));
    }
    x[i] = B[i].subtract(sum).divide(A[i][i],MathContext.DECIMAL128);
  }
  
  return x;
}
long[] toHKR(BigDecimal x[]){
  long[] HKR=new long[3];
  HKR[0]=x[0].divide(new BigDecimal(2),MathContext.DECIMAL128).longValue();
  HKR[1]=x[1].divide(new BigDecimal(2),MathContext.DECIMAL128).longValue();
  HKR[2]=sqrt(x[2].multiply(new BigDecimal(4)).add(x[1].multiply(x[1])).add(x[0].multiply(x[0]))).divide(new BigDecimal(2),MathContext.DECIMAL128).longValue();
  return HKR;
}

BigDecimal sqrt(BigDecimal value) {
    BigDecimal x = new BigDecimal(Math.sqrt(value.doubleValue()));
    return x.add(new BigDecimal(value.subtract(x.multiply(x)).doubleValue() / (x.doubleValue() * 2.0)));
}


  