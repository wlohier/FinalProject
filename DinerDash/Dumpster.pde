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
    moveHereY = 117;
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
    if(abs(w.xcor - moveHereX) < 10 &&
       abs(w.ycor - moveHereY) < 10){
      waiterHere = true;
      int foodLoop = 0;
      while(foodLoop < food.size()){
           if(food.get(foodLoop).held && food.get(foodLoop).eaten){
             food.remove(food.get(foodLoop));
           }
           else{
             foodLoop++;
           }
      }
    }
  }
}
