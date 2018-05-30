Waiter MrJ;
//Dumpster Dump;
//Table[] tables;
//ArrayList<Customer> customers;
//ArrayList<Plate> plate;

void setup(){
  rectMode(CENTER);
  fill(0, 50, 50);
  size(600, 400);
  fill(50, 50, 0);
  rect(300, 0, 600, 100);
  MrJ = new Waiter(3);
}

void draw(){
  MrJ.display();
  MrJ.moveTo(MrJ.targX, MrJ.targY);
}

void mouseClicked(){
  if(abs(MrJ.ycor - pmouseY) > 20 || abs(MrJ.xcor - pmouseX) > 20){
    MrJ.moveTo(pmouseX, pmouseY);
  }
}