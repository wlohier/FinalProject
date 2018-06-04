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
    if(abs(w.xcor - moveHereX) < 10 &&
       abs(w.ycor - moveHereY) < 10){
         waiterHere = true;
         for(int i = 0; i < food.size(); i++){
           if(food.get(i).onCounter){
             food.get(i).held = true;
             food.get(i).onCounter = false;
           }
         }       
       } 
  }
}