Waiter MrJ;
//Dumpster Dump;
//Table[] tables;
//ArrayList<Customer> customers;
//ArrayList<Plate> plate;

void setup(){
  fill(0, 50, 50);
  size(600, 400);
  fill(50, 50, 0);
  rect(300, 0, 600, 30);
  MrJ = new Waiter(3);
}

void draw(){
  MrJ.display();
}

void mouseClicked(){
  MrJ.moveTo(pmouseX, pmouseY);
}