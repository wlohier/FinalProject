class Dumpster implements Clickable{
  int xcor, ycor;
  int Dwidth, Ddepth;
  int moveHereX, moveHereY;
  boolean waiterHere = false;
  
  Dumpster(){
    xcor = 50;
    ycor = 70;
    Dwidth = 70;
    Ddepth = 40;
    moveHereX = 85;
    moveHereY = 120;
  }
  
  void display(){
    fill(0);
    rect(xcor, ycor, Dwidth, Ddepth);
    
  }
  
  void clicked(Waiter w){
    if(pmouseX > xcor && pmouseX < xcor + Dwidth &&
      pmouseY > ycor && pmouseY < ycor + Ddepth){
        w.moveTo(moveHereX, moveHereY);  
    }
  }
}