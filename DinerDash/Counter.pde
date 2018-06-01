class Counter implements Clickable{
  int moveHereX;
  int moveHereY;
  boolean waiterHere;
  ArrayList<Food> food;
  
  Counter(){
    moveHereX = 300;
    moveHereY = 57;
    waiterHere = false;
    food = new ArrayList();
    Food f = new Food(0, 300, 25);
    food.add(0, f);
  }
  
  void display(){
    fill(0);
    rect(0, 0, 600, 50);
    for(int i = 0; i < food.size(); i++){
      food.get(i).display();
    }
  }
  
  void clicked(Waiter w){
    if(pmouseY < 50){
      w.moveTo(moveHereX, moveHereY);
    }
    if(abs(w.xcor - moveHereX) < 7 &&
       abs(w.ycor - moveHereY) < 7){
         waiterHere = true;
       }
    food.get(0).held = true;
  }
}