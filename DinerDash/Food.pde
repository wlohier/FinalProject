class Food{
  int table;
  int xcor;
  int ycor;
  int eatTime = 240;
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
    if(!eaten && tables[table].customerHere){
      eatTime--;
      if(eatTime < 0){
        eaten = true;
      }
    }
    fill(240-eatTime, 255-(240-eatTime), 0);
    ellipse(xcor, ycor, 8, 8);
    fill(0, 0, 255);
    text(table, xcor, ycor);
    followWaiter(w);
  }
}