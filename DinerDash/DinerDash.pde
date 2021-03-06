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
boolean paused = false;
boolean won = false;
PImage brian;
PImage jermy1;
PImage jermy2;
PImage jermy3;
PImage dumpster;
PImage dabSterr;
PauseScreen p;
VictoryScreen v;

void setup(){
  background(255);
  size(600, 400);
  fill(0);
  rect(0, 0, 600, 100);
  timer = 0;
  MrJ = new Waiter(3);
  count = new Counter();
  tables = new Table[4];
  tables[0] = new Table(0, 200, 200, 236, 190);
  tables[1] = new Table(1, 200, 300, 236, 290);
  tables[2] = new Table(2, 400, 200, 436, 190);
  tables[3] = new Table(3, 400, 300, 436, 290);
  food = new ArrayList();
  customers = new ArrayList();
  customerQueue = new ArrayList();
  dump = new Dumpster();
  brian = loadImage("brian-300px.png");
  jermy1 = loadImage("jermy1.png");
  jermy2 = loadImage("jermy2.png");
  jermy3 = loadImage("jermy3.png");
  dabSterr = loadImage("dabsterr.png");
  dumpster = loadImage("dumpster.png");
  p = new PauseScreen();
  v = new VictoryScreen();
}

void draw(){
  if(!paused && !won){
  timer++;
  }
  MrJ.display();
  count.display();
  dump.display();
  if(timer%800 == 0 || timer == 300){
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
  text("$ " + money, 500, 385);
  if(money >= 50){
    won = true;
  }
  rect(530, 345, 50, 18);
  rect(530, 370, 50, 18);
  fill(255);
  text("+speed", 532, 358);
  text("pause", 538, 383);
  p.display();
  v.display();
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
  if(pmouseX > 530 && pmouseX < 580 && pmouseY > 345 && pmouseY < 345 + 18 && money >= 7){
    MrJ.speed+=.25;
    money -=7;
  }
  p.clicked();
  v.clicked();
}

void reset(){
  occupiedTables = 0;
  customers.clear();
  customerQueue.clear();
  food.clear();
  peopleHeld = false;
  paused = false;
  won = false;
  MrJ.reset();
  count.reset();
  for(int i = 0; i < 4; i++){
    tables[i].reset();
  }
  textSize(13);
  money = 0;
  timer = 0;
}
