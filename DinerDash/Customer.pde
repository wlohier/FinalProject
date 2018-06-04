class Customer implements Clickable{
  int xcor;
  int ycor;
  int patience = 1500;
  boolean inLine = true;
  boolean ordering = false;
  boolean ordered = false;
  boolean eating = false;
  boolean carried;
  
  
  
  void display(){
    fill(255-(255/patience), 255/patience, 0);
    if(carried){
      xcor = mouseX;
      ycor = mouseY;
    }
    rect(xcor, ycor, 50, 50);
  }
  
  void clicked(Waiter w){
    if(pmouseX > xcor && pmouseX < xcor + 50 
      && pmouseY > ycor && pmouseY < ycor + 50){
      if(inLine && !peopleHeld){
        peopleHeld = true;
        carried = true;
      }
    }
  }
}
