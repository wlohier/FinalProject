class PauseScreen{
  void display(){
    if(paused){
      fill(0);
      rect(100, 0, 400, 400);
      fill(255);
      text("welcome to the exSTERRordinary diner!\nYou are here today to help Mr. Sterr serve all\n"+
          "of his customers in order to buy Nolan Gregory a new crib!\n"+
          "click on the customers to move them to tables.\n" + "click on the tables to take orders and bring or remove food.\n" +
          "Click on the dumpster to dispose of food\nand on the counter to place orders before the customers get angry \n" 
          + "most importantly, have fun!!",
          105, 20);
    }

    
  }
  
  void clicked(){
   if(pmouseX > 530 && pmouseX < 580 &&
      pmouseY > 370 && pmouseY < 388){
        if(paused){
          paused = false;
        }
        else{
          paused = true;
        }
      }
  }
}
