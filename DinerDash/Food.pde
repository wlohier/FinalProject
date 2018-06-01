class Food{
  int table;
  int xcor;
  int ycor;
  boolean eaten = false;
  boolean held;
  Food(int t, int x, int y){
    table = t;
    xcor = x;
    ycor = y;
  }
  
  void followWaiter(Waiter w, Counter c){
    if(held){
      xcor = w.xcor - 7;
      ycor = w.ycor - 5;
    }
  }
  
  void display(){
    fill(0, 255, 0);
    ellipse(xcor, ycor, 8, 8);
  }
}