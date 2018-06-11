class Customer implements Clickable{
  int xcor;
  int ycor;
  int patience = 1800;
  int tableNum = -1;
  boolean inLine = true;
  boolean ordering = false;
  boolean ordered = false;
  boolean eating = false;
  boolean eaten = false;
  boolean carried;
  
  
  Customer(int x, int y){
    xcor = x;
    ycor = y;
    carried = false;
  }
  
  void display(){
    fill(1800-patience, patience, 0);
    if(carried){
      xcor = mouseX;
      ycor = mouseY;
    }
    rect(xcor, ycor, 15, 15);
    patienceChange();
  }
  
  void clicked(Waiter w){
    if(pmouseX > xcor && pmouseX < xcor + 50 
      && pmouseY > ycor && pmouseY < ycor + 50 && occupiedTables < 4){
      if(inLine && !peopleHeld){
        peopleHeld = true;
        carried = true;
        customerQueue.remove(this);
        patience+=500;
      }
    }
  }
  
  void patienceChange(){
    if(inLine || ordered || eaten){
    patience--;
    if(patience < 0){
      int foodRem = -1;
      for(int i = 0; i < food.size(); i++){
        if(food.get(i).table == tableNum){
          foodRem = i;
        }
      }
      if(foodRem > -1){
        food.remove(foodRem);
      }
      if(tableNum > -1){
        tables[tableNum].customerHere = false;
        tables[tableNum].foodHere = false;
        tables[tableNum].ordering = false;
        occupiedTables--;
      }
      customers.remove(this);
      money -= 3;
    }
    }
  }
}
