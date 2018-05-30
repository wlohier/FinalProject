class Waiter{
  int xcor;
  int ycor;
  float speed;
  boolean moveToTarg;
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
    background(0, 55, 55);
    fill(255, 0, 0);
    ellipse(xcor, ycor, 25, 25);
  }
  
  void moveTo(float x, float y){
    targX = x;
    targY = y;
    moveToTarg = true;
    if(Math.abs(ycor - y) > 20){
      if(ycor > y){
        ycor -= speed;
      }
      if(ycor < y){
        ycor += speed;
      }
    }
    if(abs(xcor - x) > 20 && abs(ycor - y)<=20){
      if(xcor > x){
        xcor -= speed;
      }
      if(xcor < x){
        xcor += speed;
      }
    }
  }
}