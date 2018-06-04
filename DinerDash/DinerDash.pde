Waiter MrJ;
Counter count;
//Dumpster Dump;
Table[] tables;
//ArrayList<Customer> customers;
ArrayList<Food> food;

void setup(){
  background(255);
  size(600, 400);
  fill(0);
  rect(0, 0, 600, 100);
  MrJ = new Waiter(3);
  count = new Counter();
  tables = new Table[4];
  tables[0] = new Table(0, 200, 200, 236, 195);
  tables[1] = new Table(1, 200, 300, 236, 295);
  tables[2] = new Table(2, 400, 200, 436, 195);
  tables[3] = new Table(3, 400, 300, 436, 295);
  food = new ArrayList();
  Food f = new Food(0, 300, 25);
  food.add(f);
}

void draw(){
  MrJ.display();
  count.display();
  for(int i = 0; i < 4; i++){
    tables[i].display();
  }
  for(int i = 0; i < food.size(); i++){
      food.get(i).display(MrJ);
  }
  MrJ.moveTo(MrJ.targX, MrJ.targY);
  
}

void mouseClicked(){
  for(int i = 0; i < 4; i++){
    tables[i].clicked(MrJ);
  }
  count.clicked(MrJ);
}
