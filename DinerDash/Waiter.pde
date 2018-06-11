class Waiter{
  int xcor;
  int ycor;
  float speed;
  boolean moveToTarg;
  int hasOrder = -1;
  int secondOrder = -1
  float targX;
  float targY;
  
  Waiter(float s){
    speed = s;
    xcor = 300;
    ycor = 100;
    targX = xcor;
    targY = ycor;
    moveToTarg = false;
  }
  
  void display(){
    background(255);
    fill(255, 0, 0);
    ellipse(xcor, ycor, 25, 25);
    if(hasOrder > -1){
      fill(50, 50, 50);
      rect(xcor, ycor, 5, 5);
    }
    if(secondOrder > -1){
      fill(50, 50, 50);
      rect(xcor + 7, ycor, 5, 5);
    }
  }
  
  
  void moveTo(float x, float y){
    targX = x;
    targY = y;
    moveToTarg = true;
    if(abs(ycor - y) > 5){
      if(ycor > y){
        ycor -= speed;
      }
      if(ycor < y){
        ycor += speed;
      }
    }
    if(abs(xcor - x) > 5 && abs(ycor - y)<=5){
      if(xcor > x){
        xcor -= speed;
      }
      if(xcor < x){
        xcor += speed;
      }
    }
  }
}
