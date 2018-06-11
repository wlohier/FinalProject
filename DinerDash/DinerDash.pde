Waiter MrJ;
Counter count;
Dumpster dump;
int timer;
int money;
Table[] tables;
int occupiedTables = 0;
ArrayList<Customer> customers;
ArrayList<Customer> customerQueue;
ArrayList<Food> food;
boolean peopleHeld = false;

void setup(){
  background(255);
  size(600, 400);
  fill(0);
  rect(0, 0, 600, 100);
  timer = 0;
  MrJ = new Waiter(3);
  count = new Counter();
  tables = new Table[4];
  tables[0] = new Table(0, 200, 200, 236, 195);
  tables[1] = new Table(1, 200, 300, 236, 295);
  tables[2] = new Table(2, 400, 200, 436, 195);
  tables[3] = new Table(3, 400, 300, 436, 295);
  food = new ArrayList();
  customers = new ArrayList();
  customerQueue = new ArrayList();
  dump = new Dumpster();
}

void draw(){
  timer++;
  MrJ.display();
  count.display();
  dump.display();
  if(timer%900 == 0){
    Customer c = new Customer(50, 350 - 50*customerQueue.size());
    customers.add(c);
    customerQueue.add(c);
  }
  for(int i = 0; i < 4; i++){
    tables[i].display();
  }
  for(int i = 0; i < food.size(); i++){
      food.get(i).display(MrJ);
  }
  for(int i = 0; i < customers.size(); i++){
    customers.get(i).display();
  }
  MrJ.moveTo(MrJ.targX, MrJ.targY);
  fill(0);
  text("$ " + money, 500, 390);
}

void mouseClicked(){
  for(int i = 0; i < customers.size(); i++){
    customers.get(i).clicked(MrJ);
  }
  for(int i = 0; i < 4; i++){
    if(!peopleHeld){
      tables[i].clicked(MrJ);
    }
    if(peopleHeld){
      for(int j = 0; j < customers.size(); j++){
        tables[i].clicked(customers.get(j));
      }
    }
  }
  if(!peopleHeld){
    count.clicked(MrJ);
  }
  dump.clicked(MrJ);
}
