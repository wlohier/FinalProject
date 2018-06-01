class Table implements Clickable{
  int num;
  int Txcor, Tycor;
  int Twidth; 
  int Tdepth;
  int moveHereX;
  int moveHereY;
  boolean waiterHere;
  
  Table(int n, int x, int y, int mx, int my){
    num = n;
    Txcor = x;
    Tycor = y;
    Twidth = 75;
    Tdepth = 35;
    moveHereX = mx;
    moveHereY = my;
    waiterHere = false;
  }
  
  void display(){
    fill(0);
    rect(Txcor, Tycor, Twidth, Tdepth);
  }
  
  void clicked(Waiter w){
    if(pmouseX > Txcor && pmouseX < Txcor + Twidth
        && pmouseY > Tycor && pmouseY < Tycor + Tdepth){
          w.moveTo(moveHereX, moveHereY);
    }
    if(abs(w.xcor - moveHereX) < 7 &&
       abs(w.ycor - moveHereY) < 7){
         waiterHere = true;
       }
  }
}