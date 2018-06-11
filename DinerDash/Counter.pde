class Counter implements Clickable{
  int moveHereX;
  int moveHereY;
  boolean waiterHere;
  boolean cooking = false;
  int cooktime = 0;
  int cookTable = -1;
  int cookTable2 = -1;
  
  Counter(){
    moveHereX = 300;
    moveHereY = 57;
    waiterHere = false;
  }
  
  void display(){
    fill(0);
    rect(0, 0, 600, 50);
    if(cooking){
      cooktime++;
      if(cooktime == 180){
        cooking = false;
        Food f = new Food(cookTable, 300 + food.size()*10, 25);
        food.add(f);
        if(cookTable2 > -1){
          Food f2 = new Food(cookTable2, 300 + food.size()*10, 25);
          food.add(f2);
        }
        cooking = false;
        cooktime = 0;
      }
    }
  }
  
  void clicked(Waiter w){
    if(pmouseY < 50){
      w.moveTo(moveHereX, moveHereY);
    }
    if(abs(w.xcor - moveHereX) < 10 &&
       abs(w.ycor - moveHereY) < 10){
         waiterHere = true;
         if(w.hasOrder > -1){
           cooking = true;
           cookTable = w.hasOrder;
           w.hasOrder = -1;
         }
         if(w.secondOrder > -1){
           cooking = true;
           cookTable2 = w.secondOrder;
           w.secondOrder = -1;
         }
         for(int i = 0; i < food.size(); i++){
           if(food.get(i).onCounter){
             food.get(i).held = true;
             food.get(i).onCounter = false;
           }
         }       
       } 
  }
}
