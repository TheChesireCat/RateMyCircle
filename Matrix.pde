class circle{
  IntList x;
  IntList y;
  int sum_x;
  int sum_y;
  int sum_x2;
  int sum_y2;
  int sum_xy;
  int sum_eq1;
  int sum_eq2;
  int sum_eq3;
  int n;
  circle(){
    x=new IntList();
    y=new IntList();
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
  public void add(int a,int b){
    x.append(a);
    y.append(b);
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
  int size(){
    return x.size();
  }
  int getSX(){return sum_x;}
  int getSY(){return sum_y;}
  int getSX2(){return sum_x2;}
  int getSY2(){return sum_y2;}
  int getSXY(){return sum_xy;}
  int getEQ1(){return sum_eq1;}
  int getEQ2(){return sum_eq2;}
  int getEQ3(){return sum_eq3;}
  int calc_A(){
    float A=(n*(sum_eq2)*(sum_xy) - (sum_eq2)*(sum_x)*(sum_y) - 
        (sum_eq3)*(sum_xy)*(sum_y) + (sum_eq1)*pow(sum_y,2) - 
        n*(sum_eq1)*(sum_y2) + (sum_eq3)*(sum_x)*(sum_y2))/
     (n*pow(sum_xy,2) - 2*(sum_x)*(sum_xy)*(sum_y) + (sum_x2)*pow(sum_y,2) + 
        pow(sum_x,2)*(sum_y2) - n*(sum_x2)*(sum_y2));
    return (int)A;
  }
  int calc_B(){
    float B=((-(sum_eq2))*pow(sum_x,2) + n*(sum_eq2)*(sum_x2) - 
        n*(sum_eq1)*(sum_xy) + (sum_eq3)*(sum_x)*(sum_xy) + 
        (sum_eq1)*(sum_x)*(sum_y) - (sum_eq3)*(sum_x2)*(sum_y))/
     ((-n)*pow(sum_xy,2) + 2*(sum_x)*(sum_xy)*(sum_y) - 
        (sum_x2)*pow(sum_y,2) - pow(sum_x,2)*(sum_y2) + 
    n*(sum_x2)*(sum_y2));
    return (int)B;
  }
  int calc_C(){
    float C=((-(sum_eq2))*(sum_x)*(sum_xy) + (sum_eq3)*pow(sum_xy,2) + 
        (sum_eq2)*(sum_x2)*(sum_y) - (sum_eq1)*(sum_xy)*(sum_y) + 
        (sum_eq1)*(sum_x)*(sum_y2) - (sum_eq3)*(sum_x2)*(sum_y2))/
     (n*pow(sum_xy,2) - 2*(sum_x)*(sum_xy)*(sum_y) + (sum_x2)*pow(sum_y,2) + 
        pow(sum_x,2)*(sum_y2) - n*(sum_x2)*(sum_y2));
    return (int)C;    
  }
}


  