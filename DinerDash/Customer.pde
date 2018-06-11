class Customer implements Clickable{
  int xcor;
  int ycor;
  int patience = 1500;
  int tableNum = -1;
  boolean inLine = true;
  boolean ordering = false;
  boolean ordered = false;
  boolean eating = false;
  boolean carried;
  
  
  Customer(int x, int y){
    xcor = x;
    ycor = y;
    carried = false;
  }
  
  void display(){
    fill(1500-patience, patience, 0);
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
        patience+=300;
      }
    }
  }
  
  void patienceChange(){
    patience--;
    if(patience < 0){
      customers.remove(this);
      money -= 5;
    }
  }
}
