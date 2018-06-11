class Table implements Clickable{
  int num;
  int Txcor, Tycor;
  int Twidth; 
  int Tdepth;
  int moveHereX;
  int moveHereY;
  boolean waiterHere;
  boolean customerHere = false;
  boolean foodHere = false;
  boolean ordering = false;
  boolean finished;
  
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
    count.waiterHere = false;
    if(pmouseX > Txcor && pmouseX < Txcor + Twidth
        && pmouseY > Tycor && pmouseY < Tycor + Tdepth){
          w.moveTo(moveHereX, moveHereY);
    }
    if(abs(w.xcor - moveHereX) < 7 &&
       abs(w.ycor - moveHereY) < 7){
         waiterHere = true;
         for(int i = 0; i < food.size(); i++){
            if(food.get(i).held && food.get(i).table == num && !foodHere){
              food.get(i).onTable = true;
              food.get(i).held = false;
              foodHere = true;
              food.get(i).ycor += 30;
              for(int j = 0; j < customers.size(); j++){
                if(customers.get(j).tableNum==num){
                  customers.get(j).patience += 300;
                }
              }
            }
            else if(foodHere && food.get(i).table == num && food.get(i).eaten){
              food.get(i).held = true;
              food.get(i).onTable = false;
              foodHere = false;
              int removable = -1;
              for(int j = 0; j < customers.size(); j++){
                if(customers.get(j).tableNum==num){
                  removable = j;
                  money += customers.get(j).patience/100;
                }
              }
              customers.remove(removable);
              occupiedTables--;
              customerHere = false;
            }
          }
        if(customerHere && !foodHere && ordering){
          w.hasOrder = num;
          ordering = false;
          for(int j = 0; j < customers.size(); j++){
            if(customers.get(j).tableNum==num){
              customers.get(j).patience += 300;
            }
          }
        }
     }
   
  }
  
  void clicked(Customer c){
    if(pmouseX > Txcor && pmouseX < Txcor + Twidth
        && pmouseY > Tycor && pmouseY < Tycor + Tdepth && c.carried && !customerHere){
      c.carried = false;
      customerHere = true;
      c.inLine = false;
      c.ordering = true;
      ordering = true;
      peopleHeld = false;
      c.xcor = Txcor - 10;
      c.ycor = Tycor + 10;
      c.tableNum = num;
      occupiedTables += 1;
    }
  }
}
