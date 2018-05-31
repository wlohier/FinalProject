class Table implements Clickable{
  int num;
  int Txcor, Tycor;
  int Twidth; 
  int Tdepth;
  boolean waiterHere;
  
  Table(int n, int x, int y){
    num = n;
    Txcor = x;
    Tycor = y;
    Twidth = 75;
    Tdepth = 35;
    waiterHere = false;
  }
  
  void display(){
    fill(0);
    rect(Txcor, Tycor, Twidth, Tdepth);
  }
  
  void clicked(Waiter w){
    if(pmouseX > Txcor && pmouseX < Txcor + Twidth
        && pmouseY > Tycor && pmouseY < Tycor + Tdepth){
          w.moveTo(Txcor, Tycor);
          waiterHere = true;
    }
  }
}