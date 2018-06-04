class Counter implements Clickable{
  int moveHereX;
  int moveHereY;
  boolean waiterHere;
  
  Counter(){
    moveHereX = 300;
    moveHereY = 57;
    waiterHere = false;
  }
  
  void display(){
    fill(0);
    rect(0, 0, 600, 50);
  }
  
  void clicked(Waiter w){
    if(pmouseY < 50){
      w.moveTo(moveHereX, moveHereY);
    }
    if(abs(w.xcor - moveHereX) < 7 &&
       abs(w.ycor - moveHereY) < 7){
         waiterHere = true;
         food.get(0).held = true;
       } 
  }
}
