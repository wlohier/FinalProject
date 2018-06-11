class Food{
  int table;
  int xcor;
  int ycor;
  int eatTime = 360;
  boolean eaten = false;
  boolean held;
  boolean onCounter = true;
  boolean onTable = false;
  
  
  Food(int t, int x, int y){
    table = t;
    xcor = x;
    ycor = y;
  }
  
  void followWaiter(Waiter w){
    if(held){
      xcor = w.xcor - 7;
      ycor = w.ycor - 5;
    }
  }
  
  void display(Waiter w){
    followWaiter(w);
    if(!eaten && tables[table].customerHere && onTable){
      eatTime--;
      if(eatTime < 0){
        eaten = true;
        for(int i = 0; i < customers.size(); i++){
          if(customers.get(i).tableNum == table){
            customers.get(i).eaten = true;
          }
        }
      }
    }
    fill(240-eatTime, 255-(240-eatTime), 0);
    ellipse(xcor, ycor, 8, 8);
    fill(255, 0, 0);
    if(!eaten){
    text(table, xcor, ycor);
    }
    else{
      fill(255, 0, 0);
      text("Finished!", xcor, ycor);
    }
  }
}
